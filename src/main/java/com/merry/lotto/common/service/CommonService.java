package com.merry.lotto.common.service;

import com.merry.lotto.game.model.NanumDto;

public interface CommonService {

	NanumDto getRecentNanum();
	String getNextDay();
	String getNextTime();

}
