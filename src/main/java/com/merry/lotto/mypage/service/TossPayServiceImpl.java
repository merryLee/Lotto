package com.merry.lotto.mypage.service;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.merry.lotto.mypage.dao.MyinfoDao;

public class TossPayServiceImpl implements PayService {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String TEST_KEY = "sk_test_apikey1234567890a";
	private String PAY_TOKEN;
	private String ORDER_NO = "2015072012211";
	private int value;

	@Override
	public String ready(int value) {
		System.out.println("토스레디 호출!!");
		String readyState = readyRequest(value);
		this.value = value;
		System.out.println("토스응답Ready JSON >>> " + readyState);

		String checkoutPage = ""; // 리다이렉트하고
		String payToken = ""; // 서버에저장하고

		JSONTokener tokener = new JSONTokener(readyState);
		JSONObject jsonObj = new JSONObject(tokener);

		payToken = (String) jsonObj.get("payToken");
		checkoutPage = "https://192.168.1.101:8443/lotto/myinfo/tossapprove";
//		checkoutPage = (String) jsonObj.get("checkoutPage");

		this.PAY_TOKEN = payToken;
		
		return checkoutPage;
	}

	private String readyRequest(int val) {
		double vat = val * 0.1;
		double totalVal = val + vat;
		
		URL url = null;
		URLConnection connection = null;
		StringBuilder responseBody = new StringBuilder();
		try {
			url = new URL("https://pay.toss.im/api/v1/payments");
			connection = url.openConnection();
			connection.addRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true);
			connection.setDoInput(true);

			JSONObject jsonBody = new JSONObject();
			jsonBody.put("orderNo", ORDER_NO);
			jsonBody.put("amount", totalVal);
			jsonBody.put("amountTaxFree", 0);
			jsonBody.put("productDesc", "O-Lotto");
			jsonBody.put("apiKey", TEST_KEY);
			jsonBody.put("autoExecute", false);
			jsonBody.put("retUrl", "https://192.168.1.101:8443/lotto/myinfo/tossapprove");

			BufferedOutputStream bos = new BufferedOutputStream(connection.getOutputStream());
			bos.write(jsonBody.toString().getBytes());
			bos.flush();
			bos.close();

			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line = null;
			while ((line = br.readLine()) != null) {
				responseBody.append(line);
			}
			br.close();
		} catch (Exception e) {
			responseBody.append(e);
		}
		
		String result = responseBody.toString();
		System.out.println("resSTring >>>> " + result);
		
		return result;
	}
	
	@Override
	@Transactional
	public String approve(Map<String, String> map) {
		String path = "/views/mypage/pay/chargefail.jsp";
		String approve = approveRequest(map);
		System.out.println("approve 통과!!");
	
		JSONTokener tokener = new JSONTokener(approve);
		JSONObject jsonObj = new JSONObject(tokener);
		
//		String approveCode = jsonObj.getString("code") + "";
		String approveCode = "0";
		
		if ("0".equals(approveCode)) {
			int price = this.value;
			String mno = map.get("mno"); 
			
			updateBalance(mno, price); // 멤버포인트디비값업데이트.
			insertDeposit(mno, price);//입금관리내역 추가.

			path = "/views/mypage/pay/chargeok.jsp";
		}
		
		return path;
	}
	
	private String approveRequest(Map<String, String> map) {
		String result = "";
		String payToken = this.PAY_TOKEN;
		System.out.println("요청값 payTOken" + payToken);
//		String payToken = map.get("payToken");

		URL url = null;
		URLConnection connection = null;
		StringBuilder responseBody = new StringBuilder();
		try {
			url = new URL("https://pay.toss.im/api/v1/execute");
			connection = url.openConnection();
			connection.addRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true);
			connection.setDoInput(true);
			
			JSONObject jsonBody = new JSONObject();
//			jsonBody.put("payToken", "test_token1234567890a");
			jsonBody.put("payToken", payToken);
			jsonBody.put("apiKey", TEST_KEY);
			
			BufferedOutputStream bos = new BufferedOutputStream(connection.getOutputStream());
			bos.write(jsonBody.toString().getBytes());
			bos.flush();
			bos.close();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line = null;
			while ((line = br.readLine()) != null) {
				responseBody.append(line);
			}
			br.close();
		} catch (Exception e) {
			responseBody.append(e);
		}
		
		result = responseBody.toString();
		System.out.println("승인응답 >>>>>> " + result);
		
		return result;
	}

	@Override
	public int updateBalance(String mno, int price) {
		MyinfoDao myinfoDao = sqlSession.getMapper(MyinfoDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mno", mno+"");
		map.put("price", price+"");
		return myinfoDao.updateBalance(map);
	}

	@Override
	public int insertDeposit(String mno, int price) {
		MyinfoDao myinfoDao = sqlSession.getMapper(MyinfoDao.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mno", mno+"");
		map.put("price", price+"");
		map.put("detail", "토스");
		return myinfoDao.insertDeposit(map);
	}

}
