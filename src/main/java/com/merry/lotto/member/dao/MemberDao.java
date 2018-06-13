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
	String findId(MemberDetailDto memberDetailDto);
	String findPass(MemberDetailDto memberDetailDto);
	void resetPass(Map<String, String> map);
	int getRecentBalance(int mno);
	
/*	
	void deleteMember(String id);
	List<MemberDetailDto> listMember(Map<String, String> map);
*/
	
}
