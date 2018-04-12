package com.merry.lotto.member.service;

import com.merry.lotto.member.model.MemberDetailDto;

public interface MemberService {

	int idCheck(String id);
	int registerMember(MemberDetailDto memberDetailDto);
	
	/*
	void deleteMember(String id);
	MemberDto login(String id, String pass);
	List<MemberDetailDto> listMember(String key, String word);
*/
	
	
}
