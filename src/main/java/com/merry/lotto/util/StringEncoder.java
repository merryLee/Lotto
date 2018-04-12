package com.merry.lotto.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class StringEncoder {

	public static String urlUtf(String tmp) {
		String utf = "";
		try {
			if(tmp != null)
				utf = URLEncoder.encode(tmp, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return utf;
	}
}
