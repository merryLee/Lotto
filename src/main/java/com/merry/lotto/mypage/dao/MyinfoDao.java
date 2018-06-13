package com.merry.lotto.mypage.dao;

import java.util.Map;

import com.merry.lotto.mypage.model.WithdrawDto;

public interface MyinfoDao {

	int updateBalance(Map<String, String> map);
	int insertDeposit(Map<String, String> map);
	int substractBalance(Map<String, String> map);
	int insertWithdraw(WithdrawDto withdrawDto);
	
}
