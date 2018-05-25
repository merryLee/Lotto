package com.merry.lotto.mypage.service;

public interface PayService {
	//kakao 결제준비, 결제연동, 결제승인, 결제취소(보류).
	String ready(int value);	//결제준비
	String approve();	//결제승인
	
}
