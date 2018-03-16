package com.merry.lotto.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "redirect:/views/join/join.jsp";
	}


}
