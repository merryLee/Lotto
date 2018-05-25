package com.merry.lotto.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.merry.lotto.mypage.service.MyinfoService;
import com.merry.lotto.mypage.service.PayService;

@Controller
@RequestMapping("/myinfo")
public class MyinfoController {

	@Autowired
	private MyinfoService myinfoService;
	@Autowired
	private PayService payService;
	
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
	@RequestMapping(value="/chargeok")
	public String openchargeok() {
		return "redirect:/views/mypage/pay/chargeok.jsp";
	}
	@RequestMapping(value="/chargefail")
	public String openchargefail() {
		return "redirect:/views/mypage/pay/chargefail.jsp";
	}

	@RequestMapping(value="/tosscharge", method=RequestMethod.POST)
	public String openToss(@RequestParam(value="radioValues") String val, HttpSession session) {
		System.out.println("진입!tosP >> " + val);
		return "redirect:/views/mypage/pay/chargeok.jsp";
	}

	@RequestMapping(value="/kakaocharge", method=RequestMethod.POST)
	public String openKpay(@RequestParam("radioValues") int value) {
		System.out.println("카카오G >>>  " + value);
		String url = payService.ready(value);
		System.out.println("카카오G2 >>>  " + url);
		return "redirect:" + url;
	}
	@RequestMapping(value="/kakaoapprove")
	public String processKpay(@RequestParam("pg_token") String pg_token) {
		System.out.println("카카오approve 컨트롤러진입! >>>" + pg_token);
		String url = payService.approve();
		
		//pg토큰전달필요.
		
		System.out.println("카카오G3 >>>  " + url);
		return "redirect:" + url;
	}
	

}