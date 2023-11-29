package kr.or.ddit.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/message")
public class MessageController {
	@RequestMapping("/messageList.do")
	public String messageList() {
		return "student/message/stdMessage";
	}
}
