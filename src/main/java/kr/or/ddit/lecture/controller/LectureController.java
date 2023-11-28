package kr.or.ddit.lecture.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture")
public class LectureController {
	
	@GetMapping("/list.do")
	public String getLectureList(Authentication atuehtication) {
		return "professor/lecture/lectureList";
	}
	
	@GetMapping("/view.do")
	public String getLectureDetail(Authentication atuehtication) {
		return "professor/lecture/lectureView";
	}
}
