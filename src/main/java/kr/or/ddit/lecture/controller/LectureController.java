package kr.or.ddit.lecture.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture")
public class LectureController {
	
	@GetMapping("/list.do")
	public String getLectureList(Authentication atuehtication) {
		return "professor/lecture/lectureList";
	}
	
	@GetMapping("/view.do")
	public String getLectureDetail(
		Authentication authentication
		, String lecNo
		, Model model
	) {
		model.addAttribute("lecNo", lecNo);
		return "professor/lecture/lectureView";
	}
	
	@GetMapping("/plan.do")
	public String getLecturePlan() {
		return "professor/lecture/ajax/lecturePlan";
	}
	
	@GetMapping("/data/list.do")
	public String getLectureDataList() {
		return "professor/lecture/ajax/dataList";
	}
	
	@GetMapping("/data/view.do")
	public String getLectureDataDetail() {
		return "professor/lecture/ajax/dataView";
	}
	
	@GetMapping("/exam/list.do")
	public String getExamList() {
		return "professor/lecture/ajax/examList";
	}
	
	@GetMapping("/exam/view.do")
	public String getExamDetail() {
		return "professor/lecture/ajax/examView";
	}
	
	@GetMapping("/group.do")
	public String getLectureGroupInfo() {
		return "professor/lecture/ajax/groupInfo";
	}
	
	@GetMapping("/record/list.do")
	public String getRecordList() {
		return "professor/lecture/ajax/recordList";
	}
	
	@GetMapping("/attend.do")
	public String getAttendInfo() {
		return "professor/lecture/ajax/attendInfo";
	}
	
}
