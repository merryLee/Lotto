package com.merry.lotto.member.service;

import com.merry.lotto.member.model.MemberDetailDto;
import com.merry.lotto.member.model.MemberDto;

public interface MemberService {

	int idCheck(String id);
	int registerMember(MemberDetailDto memberDetailDto);
	int loginCheck(String id, String pass);
	MemberDetailDto login(String id, String pass);
	
	/*
	void deleteMember(String id);
	List<MemberDetailDto> listMember(String key, String word);
*/
	
	
}
