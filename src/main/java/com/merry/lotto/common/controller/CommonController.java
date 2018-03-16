package com.merry.lotto.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String join() {
		return "redirect:/views/index.jsp";
	}

}
