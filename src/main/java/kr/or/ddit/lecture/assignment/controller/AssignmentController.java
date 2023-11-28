package kr.or.ddit.lecture.assignment.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.lecture.assignment.service.AssignmentService;
import kr.or.ddit.lecture.assignment.service.AssignmentSubService;
import kr.or.ddit.lecture.assignment.vo.AssignmentSubVO;
import kr.or.ddit.lecture.assignment.vo.AssignmentVO;
import kr.or.ddit.security.vo.AccountWrapper;
import kr.or.ddit.student.vo.StudentVO;
import kr.or.ddit.validate.InsertGroup;

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
	) {
		String viewName = null;
		// 특정강의에 대한 전체 과제리스트 가져와서 모델에 담기
		List<AssignmentVO> assignmentList = assignmentService.findListByLecture(lecNo);
		model.addAttribute("assignmentList", assignmentList);
		viewName = "professor/lecture/assignmentList";
		return viewName;
	}
	
	@GetMapping("/view.do")
	public String getDetail(
		String asNo
		, Authentication authentication
		, Model model
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
			viewName = "professor/lecture/assignmentView";
		}
		// 학생일 경우, 과제상세정보와 본인이 제출한 내역만 우측상단에서 확인이 가능하다.(제출물 수정,삭제가능)
		else if (accType.equals("STD")) {
			// 학번가져오기 위해서 realUser꺼내오고 캐스팅하기
			StudentVO student = (StudentVO) wrapper.getRealUser();
			// 과제제출에 대해서는 복합키로 과제번호와 학번이 필요하므로 객체에 담아주기
			AssignmentSubVO obj = new AssignmentSubVO();
			obj.setAsubAsNo(asNo);
			obj.setAsubStdNo(student.getStdNo());
			AssignmentSubVO assignmentSub = assignmentSubService.findByIds(obj);
			model.addAttribute("assignmentSub", assignmentSub);
			viewName = "student/lecture/assignmentView";
		}
		// 교직원이거나 잘못된 사용자의 타입인경우로 에러
		else {}
		
		return viewName;
	}
	
	@PostMapping("/insert.do")
	public String createAssignment(
		@Validated(InsertGroup.class) AssignmentVO assignment 
	) {
		return null;
	}
	
}
