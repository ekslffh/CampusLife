package kr.or.ddit.officialAbsence.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.officialAbsence.service.OfficialAbsenceService;
import kr.or.ddit.officialAbsence.vo.OfficialAbsCategoVO;
import kr.or.ddit.officialAbsence.vo.OfficialAbsHisVO;
import kr.or.ddit.validate.InsertGroup;

@Controller
@RequestMapping("/student/official-absence")
public class OfficialAbsenceController {
	
	@Inject
	private OfficialAbsenceService absService;
	
	@GetMapping("/list.do")
	public String absenceList(Model model) {
		List<OfficialAbsCategoVO> absCategories = absService.findOffiAbsCtgrList();
		List<OfficialAbsHisVO> absHistories = absService.findAll();
		
		model.addAttribute("absCategories", absCategories);
		model.addAttribute("absHistories", absHistories);
		
		return "student/officialAbsence/officialAbsenceList";
	}
	
	@GetMapping("/insert.do")
	public String absenceForm() {
		return "student/officialAbsence/officialAbsenceForm";
	}
	
	@PostMapping("/insert.do")
	public String createAbsence(
			@Validated(InsertGroup.class) OfficialAbsHisVO absHis
			, Errors errors
			, RedirectAttributes redirectAttributes
	) {
		String viewName = "student/officialAbsence/officialAbsenceList";
		
		// 에러가 없는 경우
		if (!errors.hasErrors()) {
			// 공결내역 추가하기
			try {
				boolean success = absService.create(absHis);
				if (success) {
					redirectAttributes.addFlashAttribute("sucMsg", "공결신청에 성공하였습니다.");
				} else {
					redirectAttributes.addFlashAttribute("errMsg", "공결신청에 성공하였습니다.");
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
