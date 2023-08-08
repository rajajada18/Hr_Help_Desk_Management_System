package com.example.demo.bean;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSenderBean {

	@Autowired
	private JavaMailSender sender;
	
	public  boolean send(			
			String to,
			String cc[],
			String bcc[],
			String subject,
			String text,
			boolean isHtml,
			Resource file
			) {
		boolean sent = false;
		try {
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,file!=null);
			helper.setTo(to);
			if(cc!=null && cc.length>0)
				helper.setCc(cc);
			if(bcc!=null && bcc.length>0)
				helper.setBcc(bcc);
			helper.setSubject(subject);
			
			helper.setText(text,isHtml);
			if(file!=null)
				helper.addAttachment(file.getFilename(), file);
			sender.send(message);
			sent=true;
		}catch (Exception e) {
			e.printStackTrace();
			sent=false;
		}
		return sent;
	}
	
}
