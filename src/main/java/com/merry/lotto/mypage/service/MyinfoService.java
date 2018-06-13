package com.merry.lotto.mypage.service;

import com.merry.lotto.mypage.model.WithdrawDto;

public interface MyinfoService {

	String insertWithdraw(WithdrawDto withdrawDto);
	int substractBalance(int mno, int price); // 멤버포인트차감.
}
