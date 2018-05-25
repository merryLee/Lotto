/*package com.merry.lotto.mypage.controller;

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
	
	@RequestMapping(value="/mylotto", method=RequestMethod.GET)
	public String mvmylotto() {
		return "redirect:/views/mypage/mylotto.jsp";
	}
	@RequestMapping(value="/mypoint", method=RequestMethod.GET)
	public String mvmypoint() {
		return "redirect:/views/mypage/mypoint.jsp";
	}
	@RequestMapping(value="/myqna", method=RequestMethod.GET)
	public String mvmyqna() {
		return "redirect:/views/mypage/myqna.jsp";
	}
	@RequestMapping(value="/charge")
	public String opencharge() {
		return "redirect:/views/mypage/pay/charge.jsp";
	}
	
}
*/