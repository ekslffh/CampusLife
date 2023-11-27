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
import kr.or.ddit.lecture.subject.vo.SubjectDTO;
import kr.or.ddit.lecture.subject.vo.SubjectEssentialVO;
import kr.or.ddit.lecture.subject.vo.SubjectVO;

@Controller
@RequestMapping("/professor/subject/")
public class SubjectController {

	@Inject
	private SubjectService service;

	@ModelAttribute("subject")
	public SubjectDTO getSubject() {
		return new SubjectDTO();
	}

	@GetMapping("subjectList.do")
	public String subjectList(Model model) {
		List<SubjectVO> subList = service.findAll();

		model.addAttribute("subList", subList);

		return "professor/subject/subjectList";
	}

	@PostMapping("insertSubject.do")
	public String insertSubject(@ModelAttribute("subject") SubjectDTO sub, Errors errors, Model model) {

		String viewName = null;
		SubjectVO subVo = new SubjectVO();
		SubjectEssentialVO subEvo = new SubjectEssentialVO();

		if (!errors.hasErrors()) {
	        // 필수 테이블에 저장
	        if (sub.getSubRequired().equals("1")) {
	        	// 과목 테이블에 저장
	        	subVo.setSubNo(sub.getSubNo());
	        	subVo.setSubNm(sub.getSubNm());
	        	subVo.setSubMajCd(sub.getSubMajCd());
	        	subVo.setSubStatus(sub.getSubStatus());
	        	subVo.setSubType(sub.getSubType());
	        	
	        	service.create(subVo);
	        	String seSubNo = subVo.getSubNo();
	        	
	            // seSubNo를 null로 설정하고 필수 테이블에 저장
	            subEvo.setSeSubNo(seSubNo);
	            subEvo.setSeMajCd(sub.getSubMajCd());
	            subEvo.setSeGrade(sub.getSeGrade());

	            boolean subVOInsert = service.insertSubjectEss(subEvo);


	            if (subVOInsert) {
	                viewName = "redirect:/professor/subject/subjectList.do";
	            } else {
	                model.addAttribute("message", "과목 개설 중 문제 발생");
	                viewName = "professor/subject/subjectList";
	            }
	        } else {
	            // 필수가 아닌 경우 과목 테이블에만 저장
	            subVo.setSubNo(sub.getSubNo()); // 시퀀스에 의해 자동 생성
	            subVo.setSubNm(sub.getSubNm());
	            subVo.setSubMajCd(sub.getSubMajCd());
	            subVo.setSubStatus(sub.getSubStatus());
	            subVo.setSubType(sub.getSubType());

	            boolean subVOInsert = service.create(subVo);

	            if (subVOInsert) {
	                viewName = "redirect:/professor/subject/subjectList.do";
	            } else {
	                model.addAttribute("message", "과목 개설 중 문제 발생");
	                viewName = "professor/subject/subjectList";
	            }
	        }
	    } else {
	        viewName = "professor/subject/subjectList";
	    }

	    return viewName;
		
//		if (!errors.hasErrors()) {
//			
//			subVo.setSubNo(sub.getSubNo());
//			subVo.setSubNm(sub.getSubNm());
//			subVo.setSubMajCd(sub.getSubMajCd());
//			subVo.setSubStatus(sub.getSubStatus());
//			subVo.setSubType(sub.getSubType());
//			
//			boolean subVOInsert = service.create(subVo);
//
//			if (sub.getSubRequired().equals("1")) {
//				subEvo.setSeSubNo(sub.getSubNo());
//				subEvo.setSeMajCd(sub.getSubMajCd());
//				subEvo.setSeGrade(sub.getSeGrade());
//				
//				service.insertSubjectEss(subEvo);
//				
//			}
//			
//			
//			if (subVOInsert) {
//				viewName = "redirect:/professor/subject/subjectList.do";
//			} else {
//				model.addAttribute("message", "과목 개설 중 문제 발생");
//				viewName = "professor/subject/subjectList";
//			}
//		} else {
//			viewName = "professor/subject/subjectList";
//		}
//
//		return viewName;
	}

}
