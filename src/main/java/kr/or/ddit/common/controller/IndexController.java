package kr.or.ddit.common.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.security.vo.AccountInfo;
import kr.or.ddit.security.vo.AccountWrapper;

@Controller
public class IndexController {

	@GetMapping("/")
	public String getIdxPage(Authentication auth) {
		AccountWrapper wrapper = (AccountWrapper) auth.getPrincipal();
		String accType = wrapper.getAccType();
		if (accType.equals("STD")) {
			return "redirect:/student";
		} else if (accType.equals("PROF")) {
			return "redirect:/professor";
		} else {
			return "redirect:/staff";
		}
	}
	
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