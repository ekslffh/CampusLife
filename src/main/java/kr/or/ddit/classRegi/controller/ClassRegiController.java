package kr.or.ddit.classRegi.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.classRegi.service.ClassRegiService;
import kr.or.ddit.classRegi.vo.ClassRegiVO;

@Controller
@RequestMapping("/staff/classRegi/")
public class ClassRegiController {
	
	@Inject
	private ClassRegiService service;
	
	@ModelAttribute("classRegi")
	public ClassRegiVO getClassRegi() {
		return new ClassRegiVO();
	}
	
	@GetMapping("openingClass.do")
	public String classRegi() {
		return "staff/class/openingClass";
	}
	
	@PostMapping("insertClassRegi.do")
	public String insertClassRegi(
			@ModelAttribute("classRegi") ClassRegiVO claRegi
			, Errors errors
			, RedirectAttributes redirectAttributes) {
		
		String viewName = "redirect:/staff/classRegi/openingClass.do";
		
		claRegi.setCrNo((claRegi.getCrYear() * 10 + claRegi.getCrSem()));
		
		if (!errors.hasErrors()) {
			try {
				boolean success = service.create(claRegi);
				if (success) {
					redirectAttributes.addFlashAttribute("sucMsg", "학기개설에 성공하였습니다.");
				} else {
					redirectAttributes.addFlashAttribute("errMsg", "학기개설에 실패하였습니다.");
				}
			} catch(Exception e) {
				redirectAttributes.addFlashAttribute("errMsg", e.getMessage());
			}
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "입력이 잘못되었습니다.");
		}
		
		return viewName;
	}
}
