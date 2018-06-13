package com.merry.lotto.member.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.merry.lotto.member.model.MemberDetailDto;
import com.merry.lotto.member.model.MemberDto;
import com.merry.lotto.member.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "redirect:/views/join/join.jsp";
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "redirect:/views/login/login.jsp";
	}
	@RequestMapping(value="/findid", method=RequestMethod.GET)
	public String findId() {
		return "redirect:/views/login/findid.jsp";
	}
	@RequestMapping(value="/findpass", method=RequestMethod.GET)
	public String findPass() {
		return "redirect:/views/login/findpass.jsp";
	}
	
	@RequestMapping(value="/openidck")
	public String openidck() {
		return "redirect:/views/join/idcheck.jsp";
	}

	@RequestMapping("/idcheck")
	public @ResponseBody String idCheck(@RequestParam("id") String id) {
		int cnt = memberService.idCheck(id);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		json.put("id", id);
		return json.toString();
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView join(MemberDetailDto memberDetailDto) {
		ModelAndView mav = new ModelAndView();
		int mno = memberService.registerMember(memberDetailDto);
		String viewName;
		if(mno != 0) {
			viewName = "/views/join/joinok";
		} else {
			viewName = "/views/join/joinfail";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping("/logincheck")
	public @ResponseBody String loginCheck(@RequestParam(value="id", required=true) String id,
			@RequestParam(value="pass", required=true) String pass) {
		int cnt = memberService.loginCheck(id, pass);
		return cnt+"";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam(value="id", required=true) String id,
				@RequestParam(value="pass", required=true) String pass, HttpSession session) {
		String url = "/views/index.jsp";
		MemberDetailDto memberDetailDto = memberService.login(id, pass);
		if(memberDetailDto == null)
			url = login();
		else	
			session.setAttribute("userinfo", memberDetailDto);
		return "redirect:" + url;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		return "redirect:/views/index.jsp";
	}
	
	@RequestMapping(value="/findid", method=RequestMethod.POST)
	public ModelAndView findId(MemberDetailDto memberDetailDto) {
		ModelAndView mav = new ModelAndView();
		String viewName;
		String fid = memberService.findId(memberDetailDto);
		if(fid != null) {
			viewName = "/views/login/findid_ok";
		} else {
			viewName = "/views/login/findid_fail";
		}
		mav.addObject("fid", fid);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/findpass", method=RequestMethod.POST)
	public ModelAndView findPass(MemberDetailDto memberDetailDto) {
		ModelAndView mav = new ModelAndView();
		String viewName;
		String email = memberService.findPass(memberDetailDto);
		if(email != null) {
			viewName = "/views/login/findpass_ok";
		} else {
			viewName = "/views/login/findpass_fail";
		}
		mav.setViewName(viewName);
		return mav;
	}
}
