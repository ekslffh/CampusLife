package kr.or.ddit.staff.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.staff.service.StaffService;
import kr.or.ddit.staff.vo.StaffVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/staff/account/accInsert.do")
public class StaffInsertController {

	private final StaffService service;
	
	@ModelAttribute
	public StaffVO stf() {
		return new StaffVO();
	}
	
	@GetMapping
	public String stfForm(@ModelAttribute("stf") StaffVO stf, Model model) {
		model.addAttribute("stf", stf);
		return "staff/account/accForm";
	}
	
	@PostMapping
	public String stfInsert(
			@Validated @ModelAttribute("stf") StaffVO stf,
			BindingResult errors,
			Model model
		) {
		
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = service.createStf(stf);
			if (success) {
				viewName = "redirect:/staff/account/accList.do";
			} else {
				model.addAttribute("message", "계정 생성 중 문제 발생");
				viewName = "staff/account/accForm";
			}
		} else {
			viewName = "staff/account/accForm";
			System.out.println(errors.getAllErrors());
		}
		
		return viewName;
	}
}
