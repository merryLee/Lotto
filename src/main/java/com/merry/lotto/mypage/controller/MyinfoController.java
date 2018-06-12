package com.merry.lotto.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.merry.lotto.member.model.MemberDetailDto;
import com.merry.lotto.mypage.service.MyinfoService;
import com.merry.lotto.mypage.service.PayService;

@Controller
@RequestMapping("/myinfo")
public class MyinfoController {

	@Autowired
	private MyinfoService myinfoService;
	@Autowired
	@Qualifier("payKakao")
	private PayService kakaoPayService;
	@Autowired
	@Qualifier("payToss")
	private PayService tossPayService;
	
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
	public String openToss(@RequestParam(value="radioValues") int value) {
		String url = tossPayService.ready(value);
		System.out.println("토스레디 최종 리턴 url >>> " + url);
		return "redirect:" + url;
	}
	@RequestMapping(value="/tossapprove")
	public String processToss(HttpSession session) {
		System.out.println("토스approve 컨트롤러진입! >>>");
		Map<String, String> resMap = new HashMap<String, String>();
//		resMap.put("payToken", payToken);
		
		MemberDetailDto memberDetailDto = (MemberDetailDto) session.getAttribute("userinfo");
		resMap.put("mno", memberDetailDto.getMno()+"");
		String url = tossPayService.approve(resMap);
		return "redirect:" + url;
	}
	
	@RequestMapping(value="/kakaocharge", method=RequestMethod.POST)
	public String openKpay(@RequestParam("radioValues") int value) {
		String url = kakaoPayService.ready(value);
		return "redirect:" + url;
	}
	@RequestMapping(value="/kakaoapprove")
	public String processKpay(@RequestParam("pg_token") String pg_token, HttpSession session) {
		Map<String, String> resMap = new HashMap<String, String>();
		resMap.put("pg_token", pg_token);
		MemberDetailDto memberDetailDto = (MemberDetailDto) session.getAttribute("userinfo");
		resMap.put("mno", memberDetailDto.getMno()+"");
		String url = kakaoPayService.approve(resMap);
		return "redirect:" + url;
	}
	

}