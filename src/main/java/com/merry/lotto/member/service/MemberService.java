package com.merry.lotto.member.service;

import com.merry.lotto.member.model.MemberDetailDto;

public interface MemberService {

	int idCheck(String id);
	int registerMember(MemberDetailDto memberDetailDto);
	int loginCheck(String id, String pass);
	MemberDetailDto login(String id, String pass);
	String findId(MemberDetailDto memberDetailDto);
	String findPass(MemberDetailDto memberDetailDto);
	int getRecentBalance(int mno);
	
	
	/*
	void deleteMember(String id);
	List<MemberDetailDto> listMember(String key, String word);
*/
	
	
}
