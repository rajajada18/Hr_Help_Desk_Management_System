package com.example.demo;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.demo.bean.HrBean;
import com.example.demo.bean.UserBean;
import com.example.demo.repo.HrRepo;
import com.example.demo.repo.UserRepo;



@SpringBootTest
class SpringDataRest11ApplicationTests {

	@Test
	void contextLoads() {
	}

	
	
	@Autowired
	UserRepo service;
	@Autowired
	HrRepo hrservice;
	
	

	@Test
	public void test1() {
		String email="raja@gmail.com";
		UserBean bean = service.findByEmail(email); 
		if(bean!=null) {
			String expected="Raja@123";
			String actual=bean.getPassword();
			assertEquals(expected, actual);
		}
		else {
			fail();
		}
		}
	@Test
	public void test2() {
		String email="rajajada18@gmail.com";
		HrBean bean = hrservice.findByEmail(email);
		if(bean!=null) {
			String expected="Raja@123";
			String actual=bean.getPassword();
			assertEquals(expected, actual);
		}
		else {
			fail();
		}
		}
	
	
	
	}

