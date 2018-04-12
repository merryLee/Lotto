package com.merry.lotto.member.dao;

import java.util.Map;

import com.merry.lotto.member.model.MemberDetailDto;

public interface MemberDao {

	int idCheck(String id);
	int registerMember(MemberDetailDto memberDetailDto);
	int registerMdetail(MemberDetailDto memberDetailDto);
	int getMno(String mid);
	int loginCheck(Map<String, String> map);
	MemberDetailDto login(Map<String, String> map);
	
/*	
	void deleteMember(String id);
	List<MemberDetailDto> listMember(Map<String, String> map);
*/
	
}
