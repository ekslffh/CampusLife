package kr.or.ddit.lecture.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.security.vo.AccountWrapper;

@Controller
@RequestMapping("/lecture")
public class LectureController {
	
	@GetMapping("/list.do")
	public String getLectureList(
			Authentication authentication
			, RedirectAttributes redirectAttributes 	
	) {
		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		String viewName = null;
		if (accType.equals("STD")) {
			viewName = "student/lecture/lectureList";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/lectureList";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/view.do")
	public String getLectureDetail(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes 	
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/lectureView";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/lectureView";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/plan.do")
	public String getLecturePlan(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/lecturePlan";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/lecturePlan";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/data/list.do")
	public String getLectureDataList(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/dataList";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/dataList";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/data/view.do")
	public String getLectureDataDetail(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/dataView";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/dataView";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/exam/list.do")
	public String getExamList(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/examList";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/examList";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/exam/view.do")
	public String getExamDetail(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/examView";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/examView";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/group.do")
	public String getLectureGroupInfo(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/groupInfo";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/groupInfo";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/record/list.do")
	public String getRecordList(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/recordList";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/recordList";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
	@GetMapping("/attend.do")
	public String getAttendInfo(
			String lecNo
			, Model model
			, Authentication authentication
			, RedirectAttributes redirectAttributes
	) {
		model.addAttribute("lecNo", lecNo);

		AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
		String accType = wrapper.getAccType();
		
		String viewName = null;
		
		if (accType.equals("STD")) {
			viewName = "student/lecture/ajax/attendInfo";
		} else if (accType.equals("PRF")) {
			viewName = "professor/lecture/ajax/attendInfo";
		} else {
			redirectAttributes.addFlashAttribute("errMsg", "교직원은 입장할 수 없습니다.");
			viewName = "redirect:/staff";
		}
		return viewName;
	}
	
}
