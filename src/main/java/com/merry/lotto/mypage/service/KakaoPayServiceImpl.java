package com.merry.lotto.mypage.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merry.lotto.member.dao.MemberDao;
import com.merry.lotto.mypage.dao.MyinfoDao;

@Service
public class KakaoPayServiceImpl implements PayService {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String TEST_CID = "TC0ONETIME";
	private static final String ADMIN_KEY = "cabb9921d62c829e4874dbe79dfdcf2a";
	private String KAKAO_TID;
	
	@Override
	public String ready(int value) {
		System.out.println("KPayServiceImpl value >>>>>> " + value);
		String readyState = readyRequest(value);
		System.out.println("응답Ready JSON >>> " + readyState);

		String redirect_url = ""; // 리다이렉트하고
		String tid = ""; // 서버에저장하고

		JSONTokener tokener = new JSONTokener(readyState);
		JSONObject jsonObj = new JSONObject(tokener);

		tid = (String) jsonObj.get("tid");
		redirect_url = (String) jsonObj.get("next_redirect_pc_url");
		// redirect_url = (String) jsonObj.get("next_redirect_mobile_url");

		this.KAKAO_TID = tid;

		System.out.println("Redirect url >>>>>>>" + redirect_url);
		return redirect_url;
	}

	private String readyRequest(int val) {
		double vat = val * 0.1;
		double totalVal = val + vat;
		String result = "";
		try {
			String apiURL = "https://kapi.kakao.com/v1/payment/ready"; //
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK " + ADMIN_KEY);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			con.setRequestProperty("charset", "utf-8");

			StringBuffer params = new StringBuffer();
			params.append("cid=" + TEST_CID + "&");
			params.append("partner_order_id=partner_order_id" + "&");
			params.append("partner_user_id=partner_user_id" + "&");
			params.append("item_name=O-Lotto" + "&");
			params.append("quantity=1" + "&");
			params.append("total_amount=" + (int) totalVal + "&");
			params.append("vat_amount=" + (int) vat + "&");
			params.append("tax_free_amount=0" + "&");
			params.append("approval_url=http://localhost:8008/lotto/myinfo/kakaoapprove" + "&");
			params.append("fail_url=http://localhost:8008/lotto/myinfo/chargefail" + "&");
			params.append("cancel_url=http://localhost:8008/lotto/myinfo/chargefail");
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(params.toString());
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
	@Transactional
	public String approve(Map<String, String> map) {
		Map<String, String> approveMap;
		
		String path = "/views/mypage/pay/chargefail.jsp";
		map.put("tid", KAKAO_TID);
		
		approveMap = approveRequest(map);
		String approveCode = approveMap.get("code");
		String approveState = approveMap.get("result");
		map.remove("tid");
		this.KAKAO_TID = "";
		
		JSONTokener tokener = new JSONTokener(approveState);
		JSONObject jsonObj = new JSONObject(tokener);
		
		if ("200".equals(approveCode)) {
			JSONObject jsonAmount = (JSONObject) jsonObj.get("amount");
			int price = (int) jsonAmount.get("total") - (int) jsonAmount.get("vat");
			String mno = map.get("mno"); 
			
			updateBalance(mno, price); // 멤버포인트디비값업데이트.
			insertDeposit(mno, price);//입금관리내역 추가.
			
			path = "/views/mypage/pay/chargeok.jsp";
		}
		
		return path;
	}

	private Map<String, String> approveRequest(Map<String, String> map) {
		Map<String, String> resultMap = new HashMap<String, String>();
		
		String pg_token = map.get("pg_token");
		String tid = map.get("tid");

		String result = "";
		try {
			String apiURL = "https://kapi.kakao.com/v1/payment/approve";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK " + ADMIN_KEY);
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			con.setRequestProperty("charset", "utf-8");
			StringBuffer params = new StringBuffer();
			params.append("cid=" + TEST_CID + "&");
			params.append("tid=" + tid + "&");
			params.append("partner_order_id=partner_order_id" + "&");
			params.append("partner_user_id=partner_user_id" + "&");
			params.append("pg_token=" + pg_token);

			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(params.toString());
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
			resultMap.put("code", responseCode+"");
			resultMap.put("result", result);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return resultMap;
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
		map.put("detail", "카카오페이");
		return myinfoDao.insertDeposit(map);
	}
	
}
