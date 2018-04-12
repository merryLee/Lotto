package com.merry.lotto.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.merry.lotto.member.dao.MemberDao;
import com.merry.lotto.member.model.MemberDetailDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
//	private MemberDao memberDao;

	@Override
	public int idCheck(String id) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.idCheck(id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int registerMember(MemberDetailDto memberDetailDto) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int t1 = memberDao.registerMember(memberDetailDto);		//member테이블 인서트
		int mno = memberDao.getMno(memberDetailDto.getMid());
		memberDetailDto.setMno(mno);
		int	t2 = memberDao.registerMdetail(memberDetailDto);	//mdetail테이블 인서트
		if(t1*t2 == 0) return 0;
		else return mno;
	}
	


}
