package com.merry.lotto.game.model;

public class OlottoDto {

	private int order_no;	//주문번호
	private int mno;	//회원번호
	private int lottono;	//회차
	private int lnum1;
	private int lnum2;
	private int lnum3;
	private int lnum4;
	private int lnum5;
	private int lnum6;
	private String date;	//구매일시 datetime
	private String code;	//진행코드 A구매신청,B구매중,C구매완료,F취소
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getLottono() {
		return lottono;
	}
	public void setLottono(int lottono) {
		this.lottono = lottono;
	}
	public int getLnum1() {
		return lnum1;
	}
	public void setLnum1(int lnum1) {
		this.lnum1 = lnum1;
	}
	public int getLnum2() {
		return lnum2;
	}
	public void setLnum2(int lnum2) {
		this.lnum2 = lnum2;
	}
	public int getLnum3() {
		return lnum3;
	}
	public void setLnum3(int lnum3) {
		this.lnum3 = lnum3;
	}
	public int getLnum4() {
		return lnum4;
	}
	public void setLnum4(int lnum4) {
		this.lnum4 = lnum4;
	}
	public int getLnum5() {
		return lnum5;
	}
	public void setLnum5(int lnum5) {
		this.lnum5 = lnum5;
	}
	public int getLnum6() {
		return lnum6;
	}
	public void setLnum6(int lnum6) {
		this.lnum6 = lnum6;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
