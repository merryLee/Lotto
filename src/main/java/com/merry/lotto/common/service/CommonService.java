package com.merry.lotto.common.service;

import java.util.Map;

import com.merry.lotto.game.model.NanumDto;
import com.merry.lotto.util.PageNavigation;

public interface CommonService {

	NanumDto getRecentNanum();
	String getNextDay();
	String getNextTime();

//	PageNavigation makePageNavigation(Map<String, String> map);

}
