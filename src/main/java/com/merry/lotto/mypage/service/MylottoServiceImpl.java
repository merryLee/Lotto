package com.merry.lotto.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.merry.lotto.common.dao.CommonDao;
import com.merry.lotto.game.model.OlottoDto;
import com.merry.lotto.mypage.dao.MylottoDao;
import com.merry.lotto.util.Constance;
import com.merry.lotto.util.PageNavigation;

@Service
public class MylottoServiceImpl implements MylottoService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OlottoDto> listArticle(Map<String, String> map) {
		// public List<OlottoDto> listArticle(Map<String, String> map) {
		MylottoDao mylottoDao = sqlSession.getMapper(MylottoDao.class);

		int mno = 2; // Integer.parseInt(map.get("mno"));
		int pg = 1; // Integer.parseInt(map.get("pg"));
		int end = Constance.LIST_SIZE * pg;
		int size = Constance.LIST_SIZE;

		System.out.println("서비스임플진입!2");
		map.put("mno", mno + "");
		map.put("end", end + "");
		map.put("size", size + "");
		System.out.println("서비스임플진입!3");
		return mylottoDao.listArticle(map);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		System.out.println("서비스임플진입!4");

		PageNavigation navigation = new PageNavigation();
//		int pg = Integer.parseInt(map.get("pg"));
		int pg = 1;
		int pgSize = Constance.PAGE_SIZE;
		navigation.setPageNo(pg);
		System.out.println("서비스임플진입!5");
//		int newArticleCount = commonDao.getNewArticleCount(Integer.parseInt(map.get("bcode")));
//		navigation.setNewArticleCount(newArticleCount);
//		int totalArticleCount = commonDao.getTotalArticleCount(map);
//		navigation.setTotalArticleCount(totalArticleCount);
//		int totalPageCount = (totalArticleCount - 1) / Integer.parseInt(map.get("listsize")) + 1;
//		navigation.setTotalPageCount(totalPageCount);
//		navigation.setNowFirst(pg <= pgSize);
//		navigation.setNowEnd(pg > (totalPageCount - 1) / pgSize * pgSize);

		System.out.println("서비스임플진입!6");
		return navigation;
	}

}
