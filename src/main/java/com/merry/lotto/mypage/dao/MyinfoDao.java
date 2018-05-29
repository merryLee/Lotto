package com.merry.lotto.mypage.dao;

import java.util.Map;

public interface MyinfoDao {

	int updateBalance(Map<String, String> map);
	int insertDeposit(Map<String, String> map);
	
}
