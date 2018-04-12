package com.merry.lotto.member.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.merry.lotto.member.dao.MemberDao;
import com.merry.lotto.member.model.MemberDetailDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSender mailSender;

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

	@Override
	public int loginCheck(String id, String pass) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		map.put("userpass", pass);
		return memberDao.loginCheck(map);
	}

	@Override
	public MemberDetailDto login(String id, String pass) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		map.put("userpass", pass);
		return memberDao.login(map);
	}

	@Override
	public String findId(MemberDetailDto memberDetailDto) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.findId(memberDetailDto);
	}
	
	@Override
	public String findPass(MemberDetailDto memberDetailDto) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
//		String email = memberDao.findPass(memberDetailDto);
		String email = "ismpink@daum.net";
		if(email != null) {
			resetPassword(memberDao, memberDetailDto.getMid(), email);
		}
		return email;
	}

	private void resetPassword(MemberDao memberDao, String mid, String email) {
		//비밀번호재설정
		String newPwd = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);	//임시비밀번호생성
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", mid);
		map.put("password", newPwd);
		memberDao.resetPass(map);
		//메일발송
		PwdMailSender pwdMailSender = new PwdMailSender(mailSender);
		pwdMailSender.sendMail(email, newPwd);
	}

}
