package com.merry.lotto.mypage.model;

public class WithdrawDto {

	private int withdraw_no;
	private int mno;
	private int price;
	private String detail;
	private String date;
	private String bankcode;
	private String account_num;
	private String wcode;
	
	public int getWithdraw_no() {
		return withdraw_no;
	}
	public void setWithdraw_no(int withdraw_no) {
		this.withdraw_no = withdraw_no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBankcode() {
		return bankcode;
	}
	public void setBankcode(String bankcode) {
		this.bankcode = bankcode;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getWcode() {
		return wcode;
	}
	public void setWcode(String wcode) {
		this.wcode = wcode;
	}
	
}
