package com.merry.lotto.common.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.merry.lotto.common.dao.CommonDao;
import com.merry.lotto.game.model.NanumDto;
import com.merry.lotto.util.Constance;
import com.merry.lotto.util.PageNavigation;

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

	@Override
	public String getNextTime() {
		Date curDate = null;
		Date nextDate = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			curDate = df.parse(df.format(new Date()));	//현재시각
			nextDate = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss").parse(getNextDay()+" 20:40:00");	//다음방송시각
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return calTime(curDate, nextDate);
	}

	private String calTime(Date curDate, Date nextDate) {
		String result = "";
		long nextDateTime = nextDate.getTime();
		long curDateTime = curDate.getTime();
		long total = (nextDateTime - curDateTime) / 1000;

		if (total > 0) {
			long day = total / (24 * 60 * 60);
			total -= day * (24 * 60 * 60);
			result += day + "일";
			long hour = total / (60 * 60);
			total -= hour * (60 * 60);
			result += " " + hour + "시간";
			long minute = total / 60;
			total -= minute * 60;
			result += " " + minute + "분";
			long second = total;
			result += " " + second + "초";
		} else {
			result += "대기중";
		}
		
		return result;
	}
	
}
