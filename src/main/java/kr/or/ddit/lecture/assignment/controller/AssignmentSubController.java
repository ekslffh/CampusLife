package kr.or.ddit.lecture.assignment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.lecture.assignment.service.AssignmentSubService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/lecture/assignmentsub")
@RequiredArgsConstructor
public class AssignmentSubController {
	
	private final AssignmentSubService assignmentSubService;
	
}
