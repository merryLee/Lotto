package com.merry.lotto.member.dao;

import com.merry.lotto.member.model.MemberDetailDto;

public interface MemberDao {

	int idCheck(String id);
	int registerMember(MemberDetailDto memberDetailDto);
	int registerMdetail(MemberDetailDto memberDetailDto);
	int getMno(String mid);
	
/*	List<ZipDto> zipSearch(String dong);
	void deleteMember(String id);
	
	MemberDto login(Map<String, String> map);	
	
	List<MemberDetailDto> listMember(Map<String, String> map);*/
	
}
