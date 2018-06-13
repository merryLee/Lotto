package com.merry.lotto.mypage.service;

import java.util.Map;

public interface PayService {
	//kakao 결제준비, 결제연동, 결제승인, 결제취소(보류).
	//toss .
	String ready(int value);	//결제준비
	String approve(Map<String, String> resMap);	//결제승인
	
	int updateBalance(String mno, int price); // 멤버포인트디비값업데이트.
	int insertDeposit(String mno, int price);//입금관리내역 추가.
//	int insertDeposit(int deposit_no, int mno, int price, String detail, String date);//입금관리내역 추가.
	
}
