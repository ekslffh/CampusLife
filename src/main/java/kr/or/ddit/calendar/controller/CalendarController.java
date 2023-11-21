package kr.or.ddit.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	@RequestMapping("calList.do")
	public String calList() {
		return "/calendar/calTemplate";
	}
}
