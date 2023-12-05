package kr.or.ddit.staff.account;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.professor.service.ProfessorService;
import kr.or.ddit.professor.vo.ProfessorVO;
import kr.or.ddit.staff.service.StaffService;
import kr.or.ddit.staff.vo.StaffVO;
import kr.or.ddit.student.service.StudentService;
import kr.or.ddit.student.vo.StudentVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/staff/account/")
public class AccountCreateController {

	private final StaffService stfService;
	
	private final ProfessorService profService;
	
	private final StudentService stdService;
	
	@RequestMapping("accInsert.do")
	public String getPage() {
		return "staff/account/accForm";
	}
	
	// 학생 계정 리스트 출력하기
	@RequestMapping("accList.do")
	public String stdList(Model model) {
		List<StudentVO> stdList = stdService.findAll();
		
		model.addAttribute("stdList", stdList);
		
		return "staff/account/accList";
	}
	
	// 교직원 계정 생성
	@RequestMapping("stfInsert.do")
	public String stfInsert(
			@Validated @ModelAttribute("stf") StaffVO stf,
			BindingResult errors,
			Model model
		) {
		
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = stfService.createStf(stf);
			if (success) {
				viewName = "redirect:/staff/account/accList.do";
			} else {
				model.addAttribute("message", "계정 생성 중 문제 발생");
				viewName = "staff/account/stfAccForm";
			}
		} else {
			viewName = "staff/account/stfAccForm";
			System.out.println(errors.getAllErrors());
		}
		
		return viewName;
	}
	
	// 교수 계정 생성
	@RequestMapping("profInsert.do")
	public String profInsert(
			@Validated @ModelAttribute("prof") ProfessorVO prof,
			BindingResult errors,
			Model model
		) {
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = profService.createProf(prof);
			if (success) {
				viewName = "redirect:/staff/account/accList.do";
			} else {
				model.addAttribute("message", "계정 생성 중 문제 발생");
				viewName = "staff/account/profAccForm";
			}
		} else {
			viewName = "staff/account/profAccForm";
			System.out.println(errors.getAllErrors());
		}
		
		return viewName;
	}
	
	// 학생 계정 생성
	@RequestMapping("stdInsert.do")
	public String stdInsert(
			@Validated @ModelAttribute("std") StudentVO std,
			BindingResult errors,
			Model model
			) {
		
		String viewName = null;
		
		if (!errors.hasErrors()) {
			boolean success = stdService.createStd(std);
			if (success) {
				viewName = "redirect:/staff/account/accList.do";
			} else {
				model.addAttribute("message", "계정 생성 중 문제 발생");
				viewName = "staff/account/stdAccForm";
			}
		} else {
			viewName = "staff/account/stdAccForm";
			System.out.println(errors.getAllErrors());
		}
		
		return viewName;
	}
	
	
	
	
}
