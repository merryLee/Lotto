package com.merry.lotto.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.merry.lotto.game.model.OlottoDto;
import com.merry.lotto.mypage.service.MylottoService;
import com.merry.lotto.util.Constance;
import com.merry.lotto.util.PageNavigation;

@Controller
@RequestMapping("/mylotto")
public class MylottoController {
	
	@Autowired
	private MylottoService mylottoService;
	
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		System.out.println("롸?");
		
		ModelAndView mav = new ModelAndView();
		List<OlottoDto> list = mylottoService.listArticle(map);

		System.out.println("롸!?");
		map.put("listsize", Constance.LIST_SIZE + "");
		PageNavigation navigation = mylottoService.makePageNavigation(map);
		navigation.setRoot(request.getContextPath());

		System.out.println("롸!--?");
		navigation.setMylottoNavigator();
		
		System.out.println("롸!!!?");
		mav.addObject("navigator", navigation);
		mav.addObject("articles", list);
//		mav.addObject("querystring", map);
		mav.setViewName("/views/mypage/mylotto");
		System.out.println("롸!!!????");
		return mav;
	}

}