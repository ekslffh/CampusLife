//package kr.or.ddit.professor.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import kr.or.ddit.professor.service.ProfessorService;
//import kr.or.ddit.professor.vo.ProfessorVO;
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequiredArgsConstructor
//@RequestMapping("/staff/account/profAccInsert.do")
//public class ProfInsertController {
//
//	private final ProfessorService service;
//	
//	@ModelAttribute
//	public ProfessorVO prof() {
//		return new ProfessorVO();
//	}
//	
//	@GetMapping
//	public String profForm(@ModelAttribute("prof") ProfessorVO prof, Model model) {
//		model.addAttribute("prof", prof);
//		return "staff/account/profAccForm";
//	}
//	
//	@PostMapping
//	public String profInsert(
//			@Validated @ModelAttribute("prof") ProfessorVO prof,
//			BindingResult errors,
//			Model model
//		) {
//		String viewName = null;
//		
//		if (!errors.hasErrors()) {
//			boolean success = service.createProf(prof);
//			if (success) {
//				viewName = "redirect:/staff/account/accList.do";
//			} else {
//				model.addAttribute("message", "계정 생성 중 문제 발생");
//				viewName = "staff/account/profAccForm";
//			}
//		} else {
//			viewName = "staff/account/profAccForm";
//			System.out.println(errors.getAllErrors());
//		}
//		
//		return viewName;
//	}
//}
