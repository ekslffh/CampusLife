package kr.or.ddit.lecture.subject.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.lecture.subject.service.SubjectService;
import kr.or.ddit.lecture.subject.vo.SubjectVO;

@Controller
@RequestMapping("/professor/subject/")
public class SubjectController {

	@Inject
	private SubjectService service;

	@ModelAttribute("subject")
	public SubjectVO getSubject() {
		return new SubjectVO();
	}

	@GetMapping("subjectList.do")
	public String subjectList(Model model) {
		List<SubjectVO> subList = service.findAll();

		model.addAttribute("subList", subList);

		return "professor/subject/subjectList";
	}

	@PostMapping("insertSubject.do")
	public String insertSubject(@ModelAttribute("subject") SubjectVO sub, Errors errors, Model model) {

		String viewName = null;
		
	      if(!errors.hasErrors()) {
	    	  boolean subInsert = service.create(sub);
		         
		         if(subInsert) {
		            viewName = "redirect:/professor/subject/subjectList.do";
		         } else {
		            model.addAttribute("message", "과목 개설 중 문제 발생");
		            viewName = "professor/subject/subjectList";
		         }
		      } else {
		         viewName = "professor/subject/subjectList";
		      }

		return viewName;
	}

}
