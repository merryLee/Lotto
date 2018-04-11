package com.merry.lotto.common.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.merry.lotto.common.dao.CommonDao;
import com.merry.lotto.game.model.NanumDto;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public NanumDto getRecentNanum() {
		String date = "";
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		date = f.format(cal.getTime());
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		return commonDao.getRecentNanum(date);
	}

	@Override
	public String getNextDay() {
		String day = "";
		SimpleDateFormat f = new SimpleDateFormat("yyyy년 MM월 dd일");
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.SUNDAY);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY); 
		day = f.format(cal.getTime());
		return day;
	}
	
	
	
}
