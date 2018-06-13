package com.merry.lotto.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.merry.lotto.game.model.OlottoDto;
import com.merry.lotto.member.model.MemberDetailDto;
import com.merry.lotto.member.service.MemberService;
import com.merry.lotto.mypage.service.MylottoService;
import com.merry.lotto.util.Constance;
import com.merry.lotto.util.PageNavigation;

@Controller
@RequestMapping("/mylotto")
public class MylottoController {
	
	@Autowired
	private MylottoService mylottoService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		MemberDetailDto memberDetailDto = (MemberDetailDto) session.getAttribute("userinfo");
		memberDetailDto.setBalance(memberService.getRecentBalance(memberDetailDto.getMno()));
		session.setAttribute("userinfo", memberDetailDto);
		
		List<OlottoDto> list = mylottoService.listArticle(map);

		map.put("listsize", Constance.LIST_SIZE + "");
		PageNavigation navigation = mylottoService.makePageNavigation(map);
		navigation.setRoot(request.getContextPath());

		navigation.setMylottoNavigator();

		mav.addObject("navigator", navigation);
		mav.addObject("articles", list);
//		mav.addObject("querystring", map);
		mav.setViewName("/views/mypage/mylotto");
		return mav;
	}

}