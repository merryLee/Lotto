package com.merry.lotto.mypage.service;

public class TossPayServiceImpl implements PayService {

	@Override
	public String ready() {
		// TODO Auto-generated method stub
		return null;
	}
/*
	public void tossReady() {
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
			jsonBody.put("orderNo", "2015072012211");
			jsonBody.put("amount", 35000);
			jsonBody.put("amountTaxFree", 0);
			jsonBody.put("productDesc", "토스티셔츠");
			jsonBody.put("apiKey", "sk_test_apikey1234567890a");
			jsonBody.put("autoExecute", false);
			jsonBody.put("retUrl", "http://YOUR-SITE.COM/ORDER-CHECK");

			BufferedOutputStream bos = new BufferedOutputStream(connection.getOutputStream());
			bos.write(jsonBody.toJSONString().getBytes());
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
		System.out.println(responseBody.toString());
	}
*/

	@Override
	public String approve() {
		// TODO Auto-generated method stub
		return null;
	}

}
