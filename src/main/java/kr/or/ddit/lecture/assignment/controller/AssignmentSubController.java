package kr.or.ddit.lecture.assignment.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.lecture.assignment.service.AssignmentSubService;
import kr.or.ddit.lecture.assignment.vo.AssignmentSubVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/lecture/assignmentsub")
@RequiredArgsConstructor
public class AssignmentSubController {
	
	private final AssignmentSubService assignmentSubService;
	
	@PostMapping("/insert.do")
	@ResponseBody
	public ResponseEntity<?> createAssignmentSub(
			@Validated(InsertGroup.class) AssignmentSubVO asub
			, Errors errors
	) {
		Map<String, String> response = new HashMap<>();
		// 유효성 검사 성공한 경우
		if (!errors.hasErrors()) {
			// 제출, 수정일시 넣어주기
			asub.setAsubCrtTm(LocalDateTime.now());
			asub.setAsubUpdTm(LocalDateTime.now());
			boolean success = assignmentSubService.create(asub);
			// 생성 성공한 경우
			if (success) {
				response.put("message", "성공적으로 제출되었습니다.");
				response.put("redirectUrl", "/lecture/assignment/view.do?asNo=" + asub.getAsubAsNo());
				return ResponseEntity.ok(response);
			} else { // 제출에 실패한 경우
				response.put("message", "제출에 실패하였습니다.");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
			}
		} else { // 유효성검사 실패한 경우
			response.put("message", "잘못된 입력으로 실패하였습니다.");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
	@PostMapping("/update.do")
	@ResponseBody
	public ResponseEntity<?> updateAssignmentSub(
			@Validated(UpdateGroup.class) AssignmentSubVO asub
			, Errors errors
	) {
		Map<String, String> response = new HashMap<>();
		// 유효성 검사 성공한 경우
		if (!errors.hasErrors()) {
			boolean success = assignmentSubService.modify(asub);
			// 생성 성공한 경우
			if (success) {
				response.put("message", "성공적으로 제출되었습니다.");
				response.put("redirectUrl", "/lecture/assignment/view.do?asNo=" + asub.getAsubAsNo());
				return ResponseEntity.ok(response);
			} else { // 제출에 실패한 경우
				response.put("message", "제출에 실패하였습니다.");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
			}
		} else { // 유효성검사 실패한 경우
			response.put("message", "잘못된 입력으로 실패하였습니다.");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
	@GetMapping("/delete.do")
	@ResponseBody
	public ResponseEntity<?> removeAsub(
			@Validated(DeleteGroup.class) AssignmentSubVO asub
			, Errors errors
	) {
		Map<String, String> response = new HashMap<>();
		
		if (!errors.hasErrors()) {
			boolean success = assignmentSubService.removeByAsNoAndStdNo(asub);
			if (success) {
				response.put("message", "성공적으로 삭제되었습니다.");
				response.put("redirectUrl", "/lecture/assignment/view.do?asNo=" + asub.getAsubAsNo());
				return ResponseEntity.ok(response);
			} else {
				response.put("message", "삭제에 실패하였습니다. 다시 시도해주세요.");
				response.put("redirectUrl", "/lecture/assignment/view.do?asNo=" + asub.getAsubAsNo());
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
			}
		} else {
			response.put("message", "삭제실패: 과제번호와 학번을 확인해주세요.");
			return ResponseEntity.badRequest().body(response);
		}
	}
	
}
