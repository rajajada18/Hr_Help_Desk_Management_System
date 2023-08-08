package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.demo.bean.MailSenderBean;

@Component
public class MailSenderService {

	@Autowired
	MailSenderBean mailService;
	
	public void sendOTPMail(String email,String otp,String name) {
		
		boolean sent = mailService.send(email, 
				null, 
				null, 
				"Hr Help-Desk Registeration OTP Service", 
				"<div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\r\n"
				+ "  <div style=\"margin:50px auto;width:70%;padding:20px 0\">\r\n"
				+ "    <div style=\"border-bottom:1px solid #eee\">\r\n"
				+ "      <a href=\"\" style=\"font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600\">Hr HelpDesk System</a>\r\n"
				+ "    </div>\r\n"
				+ "    <p style=\"font-size:1.1em\">Hi, "+name +"</p>\r\n"
				+ "    <p>Thank you for choosing Our Services. Use the following OTP to complete your Sign Up procedures. OTP is valid for 5 minutes</p>\r\n"
				+ "    <h2 style=\"background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;\">"+otp+"</h2>\r\n"
				+ "    <p style=\"font-size:0.9em;\">Regards,<br />HR HELPDESK SYSTEM</p>\r\n"
				+ "    <hr style=\"border:none;border-top:1px solid #eee\" />\r\n"
				+ "    <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\r\n"
				+ "      <p>Virtusa Private LTD</p>\r\n"
				+ "      <p>Southborough</p>\r\n"
				+ "      <p>, Massachusetts, United States</p>\r\n"
				+ "    </div>\r\n"
				+ "  </div>\r\n"
				+ "</div>",
				true,
				null);
		System.out.println(sent);
	}
}
