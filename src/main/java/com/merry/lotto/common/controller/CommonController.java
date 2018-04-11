package com.merry.lotto.common.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.merry.lotto.common.service.CommonService;
import com.merry.lotto.game.model.NanumDto;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String join() {
		return "redirect:/views/index.jsp";
	}
	
	@RequestMapping(value="/ninfo")
	public @ResponseBody String nanuminfo(HttpServletRequest request) {
		System.out.println("ninfo진입!!");
		NanumDto ndto = commonService.getRecentNanum();
		request.setAttribute("ninfo", ndto);
		JSONObject json = new JSONObject(ndto);
		return json.toString();
	}
	
	@RequestMapping(value="/nextday", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
	public @ResponseBody String nextday() {
		return commonService.getNextDay();
	}
	
	@RequestMapping(value="/nexttime", method=RequestMethod.GET, produces="text/plain; charset=utf-8")
	public @ResponseBody String nexttime() {
		return commonService.getNextTime();
	}
	
}
