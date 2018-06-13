package com.merry.lotto.mypage.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KftcServiceImpl implements PayService {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String ACCESS_TOKEN = "f45f904a-c37e-4fb1-a9c9-2c74219f184c";
	
	@Override
	public String ready(int value) {
		System.out.println("KftcServiceImpl value >>>>>> " + value);
		String readyState = readyRequest(value);	//요청실행
		System.out.println("응답Ready JSON >>> " + readyState);

		String redirect_url = ""; // 리다이렉트하고
		String tid = ""; // 서버에저장하고

		JSONTokener tokener = new JSONTokener(readyState);
		JSONObject jsonObj = new JSONObject(tokener);

		tid = (String) jsonObj.get("tid");
		// redirect_url = (String) jsonObj.get("next_redirect_mobile_url");
		return redirect_url;
	}

	private String readyRequest(int val) {
		double vat = val * 0.1;
		double totalVal = val + vat;
		String result = "";
		try {
			String apiURL = "https://openapi.open-platform.or.kr/transfer/withdraw";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
	
			con.setRequestMethod("POST");
//			con.setRequestProperty("Authorization", "Bearer " + ACCESS_TOKEN);
			con.setRequestProperty("Authorization", "Bearer f45f904a-c37e-4fb1-a9c9-2c74219f184c");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("charset", "utf-8");
			
			JSONObject jsonBody = new JSONObject();
			jsonBody.put("dps_print_content", "입금인자"); //입금계좌인자내역
			jsonBody.put("fintech_use_num", "123456789012345678901234"); //핀테크이용번호
			jsonBody.put("print_content", "출금인자"); //출금계좌인자내역
			jsonBody.put("tran_amt", "10000"); //거래금액
			jsonBody.put("tran_dtime", "20160310101921"); //요청일시
			jsonBody.put("cms_no", "123456789123"); //CMS번호
			
			con.setDoOutput(true);
			
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(jsonBody.toString());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer resmsg = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				resmsg.append(inputLine);
			}
			br.close();
			result = resmsg.toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	@Override
	public String approve(Map<String, String> resMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBalance(String mno, int price) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertDeposit(String mno, int price) {
		// TODO Auto-generated method stub
		return 0;
	}

}
