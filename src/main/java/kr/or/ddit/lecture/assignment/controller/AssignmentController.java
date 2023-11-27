package kr.or.ddit.lecture.assignment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture/assignment")
public class AssignmentController {
	
	@GetMapping("/list.do")
	public String getList() {
		return "professor/lecture/assignmentList";
	}
	
}
