package com.merry.lotto.member.service;

import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class PwdMailSender {

	private JavaMailSender mailSender;

	public PwdMailSender (JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String email, String pwd) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			messageHelper.setSubject("[O Lotto] 임시 비밀번호 안내");
			String content = "<html><body><div align='center'><p><img src='cid:logo' height='30'/></p><p>고객님의 임시 비밀번호는 <strong>"+pwd+"</strong>입니다.</p></div></body></html>";
			messageHelper.setText(content, true);
			messageHelper.setFrom("smlee627@gmail.com", "운영자");
			messageHelper.setTo(new InternetAddress(email));
            
			String path = "C:\\Users\\seonmin\\Documents\\javadata\\workspace\\lotto\\WebContent\\resources\\img\\mainlogo.png";
			messageHelper.addInline("logo", new FileDataSource(path));
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
