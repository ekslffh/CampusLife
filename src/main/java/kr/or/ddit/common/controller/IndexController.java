package kr.or.ddit.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping("/student")
	public String getStdudentPage() {
		return "stdIndex";
	}
	
	@GetMapping("/professor")
	public String getProfessorPage() {
		return "profIndex";
	}
	
	@GetMapping("/staff")
	public String getStaffPage() {
		return "stfIndex";
	}
	
}