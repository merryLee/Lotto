package com.merry.lotto.mypage.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merry.lotto.mypage.dao.MyinfoDao;
import com.merry.lotto.mypage.model.WithdrawDto;

@Service
public class MyinfoServiceImpl implements MyinfoService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public String insertWithdraw(WithdrawDto withdrawDto) {
		MyinfoDao myinfoDao = sqlSession.getMapper(MyinfoDao.class);
		String url = "/views/mypage/pay/withdrawfail.jsp";
		int cnt = myinfoDao.insertWithdraw(withdrawDto);
		System.out.println("cnt >>>" + cnt);
		if(cnt == 1) {
			substractBalance(withdrawDto.getMno(), withdrawDto.getPrice());
			url = "/views/mypage/pay/withdrawok.jsp";
		}
		return url;
	}

	@Override
	public int substractBalance(int mno, int price) {
		MyinfoDao myinfoDao = sqlSession.getMapper(MyinfoDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mno", mno+"");
		map.put("price", price+"");
		return myinfoDao.substractBalance(map);
	}
	
}
