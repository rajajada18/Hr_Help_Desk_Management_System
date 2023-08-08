package com.example.demo.service;

import java.util.Random;

public class GenerateRandomOtpNumber {

	public static char[] OTP()
	{
		String numbers = "0123456789";
		Random random_method = new Random();
		
		char[] otp = new char[6];
		
		for(int i=0;i<6;i++) {
			otp[i] = numbers.charAt(random_method.nextInt(numbers.length()));
		}
		return otp;
	}
}
