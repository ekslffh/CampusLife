package kr.or.ddit.lecture.assignment.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.lecture.assignment.service.AssignmentService;
import kr.or.ddit.lecture.assignment.service.AssignmentSubService;
import kr.or.ddit.lecture.assignment.vo.AssignmentSubVO;
import kr.or.ddit.lecture.assignment.vo.AssignmentVO;
import kr.or.ddit.security.vo.AccountWrapper;
import kr.or.ddit.student.vo.StudentVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/lecture/assignment")
public class AssignmentController {
	
	@Inject
	private AssignmentService assignmentService;
	
	@Inject
	private AssignmentSubService assignmentSubService;
	
	@GetMapping("/list.do")
	public String getList(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		// 특정강의에 대한 전체 과제리스트 가져와서 모델에 담기
		List<AssignmentVO> assignmentList = assignmentService.findListByLecture(lecNo);
		
		model.addAttribute("assignmentList", assignmentList);
		model.addAttribute("lecNo", lecNo);
		
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/assignment/ajax/assignmentList";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/assignment/ajax/assignmentList";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/view.do")
	public String getDetail(
		String asNo
		, Authentication authentication
		, Model model
		, RedirectAttributes redirectAttributes
	) {
		String viewName = null;
		// 과제번호를 기준으로 과제정보 가져오기
		AssignmentVO assignment = assignmentService.findById(asNo);
		model.addAttribute("assignment", assignment);
		// 특정 과제로 들어갔을 때 두가지로 구분한다.
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		// 교수일 경우, 과제상세정보와 아래의 학생들이 제출한 자료들을 확인할 수 있다.(과제정보 수정, 삭제가능)
		if (accType.equals("PRF")) {
			List<AssignmentSubVO> assignmentSubList = assignmentSubService.findListByAssignment(asNo);
			model.addAttribute("assignmentSubList", assignmentSubList);
			viewName = "professor/lecture/assignment/ajax/assignmentView";
		}
		// 학생일 경우, 과제상세정보와 본인이 제출한 내역만 우측상단에서 확인이 가능하다.(제출물 수정,삭제가능)
		else if (accType.equals("STD")) {
			// 학번가져오기 위해서 realUser꺼내오고 캐스팅하기
			StudentVO student = (StudentVO) wrapper.getRealUser();
			// 과제제출에 대해서는 복합키로 과제번호와 학번이 필요하므로 객체에 담아주기
			AssignmentSubVO obj = new AssignmentSubVO();
			obj.setAsubAsNo(asNo);
			obj.setAsubStdNo(student.getStdNo());
			try {
				AssignmentSubVO assignmentSub = assignmentSubService.findByIds(obj);
				model.addAttribute("assignmentSub", assignmentSub);
			} catch (PKNotFoundException e) {
				
			}
			viewName = "student/lecture/assignment/ajax/assignmentView";
		}
		// 교직원이거나 잘못된 사용자의 타입인경우로 에러
		else {}
		
		return viewName;
	}
	
	@ModelAttribute("assignment")
	public AssignmentVO assignment() {
		return new AssignmentVO();
	}
	
	@GetMapping("/insert.do")
	public String getAsInsertForm(
		String lecNo
		, Model model
	) {
		// 특정 강의에 대한 과제를 추가하기 위해 강의번호 그대로 저장
		model.addAttribute("lecNo", lecNo);
		// 과제는 교수만 만들 수 있다.
		return "professor/lecture/assignment/ajax/assignmentForm";
	}
	
	@PostMapping("/insert.do")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> createAssignment(
		@ModelAttribute("assignment") @Validated(InsertGroup.class) AssignmentVO assignment
		, Errors errors
	) {
		// 결과를 담을 변수 선언
		Map<String, Object> response = new HashMap<>();
		
		// 정상적으로 값이 들어온 경우
		if (!errors.hasErrors()) {
			// 과제번호, 등록일시는 여기서 넣어준다.
			// 과제번호 = 강의번호 + UUID
			String asNo = assignment.getAsLecNo() + UUID.randomUUID().toString().substring(0, 7);
			assignment.setAsNo(asNo);
			assignment.setAsRegTm(LocalDateTime.now());
			
			boolean success = assignmentService.create(assignment);
			
			// 추가 성공한 경우 뷰로 이동
			if (success) {
				response.put("message", "과제추가에 성공하였습니다.");
				response.put("redirectUrl", "/lecture/assignment/view.do?asNo=" + assignment.getAsNo());
				return ResponseEntity.ok().body(response);
			} else { // 추가에 실패한 경우 (서버문제)
				response.put("message", "과제추가에 실패하였습니다.");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
			}
		} else { // 값이 잘못 들어온 경우
			Map<String, String> fieldErrors = new HashMap<>();
			// 잘못된 들어온 값들 무엇인지 map에 담아주기 
	        for (FieldError fieldError : errors.getFieldErrors()) {
	            fieldErrors.put(fieldError.getField(), fieldError.getDefaultMessage());
	        }
			response.put("message", "입력값이 올바르지 않습니다.");
	        response.put("fieldErrors", fieldErrors);
	        return ResponseEntity.badRequest().body(response);
		}
	}
	
	@GetMapping("/update.do")
	public String getAsUpdateForm(
		String asNo
		, Model model
	) {
		AssignmentVO assignment = assignmentService.findById(asNo);
		model.addAttribute("assignment", assignment);
		return "professor/lecture/assignment/ajax/assignmentForm";
	}
	
	@PostMapping("/update.do")
	@ResponseBody
	public ResponseEntity<?> updateAssignment(
		@ModelAttribute("assignment") @Validated(UpdateGroup.class) AssignmentVO assignment
		, Errors errors
	) {
		// 결과를 담을 변수 선언
		Map<String, Object> response = new HashMap<>();
		
		// 정상적으로 값이 들어온 경우
		if (!errors.hasErrors()) {
			// 등록일시 갱신해주기
			assignment.setAsRegTm(LocalDateTime.now());
			
			boolean success = assignmentService.modify(assignment);
			
			// 추가 성공한 경우 뷰로 이동
			if (success) {
				response.put("message", "과제수정에 성공하였습니다.");
				response.put("redirectUrl", "/lecture/assignment/view.do?asNo=" + assignment.getAsNo());
				return ResponseEntity.ok(response);
			} else { // 추가에 실패한 경우 (서버문제)
				response.put("message", "과제추가에 실패하였습니다.");
				response.put("redirectUrl", "/lecture/assignment/list.do?lecNo=" + assignment.getAsLecNo());
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
			}
		} else { // 값이 잘못 들어온 경우
			Map<String, String> fieldErrors = new HashMap<>();
			// 잘못된 들어온 값들 무엇인지 map에 담아주기 
	        for (FieldError fieldError : errors.getFieldErrors()) {
	            fieldErrors.put(fieldError.getField(), fieldError.getDefaultMessage());
	        }
			response.put("message", "입력값이 올바르지 않습니다.");
	        response.put("fieldErrors", fieldErrors);
	        return ResponseEntity.badRequest().body(response);
		}
	}
	
	@GetMapping("/delete.do")
	@ResponseBody
	public ResponseEntity<?> deleteAssignment(
		@Validated(DeleteGroup.class) AssignmentVO assignment
		, Errors errors
	) {
		Map<String, String> response = new HashMap<>();
		
		if (!errors.hasErrors()) {
			boolean success = assignmentService.removeById(assignment.getAsNo());
			// 삭제 성공 후 리스트로 이동
			if (success) {
				response.put("message", "과제를 삭제하였습니다.");
				response.put("redirectUrl", "/lecture/assignment/list.do?lecNo=" + assignment.getAsLecNo());
				return ResponseEntity.ok(response);
			} else { 
				response.put("message", "과제삭제 실패하였습니다.");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
			}
		} else {
			response.put("message", "과제번호와 강의번호를 확인해주세요.");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
}
