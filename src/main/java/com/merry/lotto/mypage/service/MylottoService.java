package com.merry.lotto.mypage.service;

import java.util.List;
import java.util.Map;

import com.merry.lotto.game.model.OlottoDto;
import com.merry.lotto.util.PageNavigation;

public interface MylottoService {

	List<OlottoDto> listArticle(Map<String, String> map);
	PageNavigation makePageNavigation(Map<String, String> map);
}
