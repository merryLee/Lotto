package com.merry.lotto.mypage.dao;

import java.util.List;
import java.util.Map;

import com.merry.lotto.game.model.OlottoDto;

public interface MylottoDao {

	List<OlottoDto> listArticle(Map<String, String> map);
	
}
