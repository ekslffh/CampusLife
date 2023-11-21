package kr.or.ddit.lecture.subject.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.lecture.subject.service.SubjectService;
import kr.or.ddit.lecture.subject.vo.SubjectVO;

@Controller
@RequestMapping("/subject/")
public class SubjectController {

	@Inject
	private SubjectService service;
	
	@GetMapping("subjectList.do")
	public String subjectList(Model model) {
		List<SubjectVO> subList = service.findAll();
		
		model.addAttribute("subList", subList);
		
		return "professor/subjectList";
	}

}
