package kr.or.ddit.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.student.service.StudentService;
import kr.or.ddit.student.vo.StudentVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/student/account/accInsert.do")
public class StdInsertController {

	private final StudentService service;
	
	@ModelAttribute
	public StudentVO std() {
		return new StudentVO();
	}
	
	@GetMapping
	public String stdForm(@ModelAttribute("std") StudentVO std, Model model) {
		model.addAttribute("std", std);
		return "student/account/accForm";
	}
	
	@PostMapping
	public String stdInsert(
			@Validated @ModelAttribute("std") StudentVO std,
			BindingResult errors,
			Model model
			) {
		
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = service.createStd(std);
			if (success) {
				viewName = "redirect:/student/account/accList.do";
			} else {
				model.addAttribute("message", "계정 생성 중 문제 발생");
				viewName = "student/account/accForm";
			}
		} else {
			viewName = "";
			System.out.println(errors.getAllErrors());
		}
		
		return viewName;
	}
}
