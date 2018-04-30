package com.merry.lotto.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merry.lotto.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value="/myhome", method=RequestMethod.GET)
	public String mvmyhome() {
		return "redirect:/views/mypage/myhome.jsp";
	}
	@RequestMapping(value="/charge")
	public String opencharge() {
		return "redirect:/views/mypage/pay/charge.jsp";
	}
	
}
