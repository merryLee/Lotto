package com.merry.lotto.mypage.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private SqlSession sqlSession;
	
	
	
}
