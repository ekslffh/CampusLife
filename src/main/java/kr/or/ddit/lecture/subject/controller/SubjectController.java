package kr.or.ddit.lecture.subject.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.lecture.subject.service.SubjectService;

@Controller
@RequestMapping("/subject/")
public class SubjectController {

	@Inject
	private SubjectService service;
	

}
