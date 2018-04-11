package com.merry.lotto.common.dao;

import com.merry.lotto.game.model.NanumDto;

public interface CommonDao {

	NanumDto getRecentNanum(String date);
	
}
