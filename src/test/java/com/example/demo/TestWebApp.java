package com.example.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.service.UserServiceImpl;

public class TestWebApp  {

	@Autowired
	private UserServiceImpl userService;
	
	@Test
	public void test() 
	{
		// Mockito.when(userService.isUserExistByEmail("rajajada18@gmail.com")).thenReturn(false);
		 boolean actual=userService.isUserExistByEmail("rajajada18@gmail.com");
		 boolean expected=false;
		 assertEquals(expected, actual);
	}
	@Test
	public void test1() 
	{
		// Mockito.when(userService.isUserExistByEmail("rajajada18@gmail.com")).thenReturn(false);
		 boolean actual=userService.isUserExistByEmail("mraj@gmail.com");
		 boolean expected=false;
		 assertEquals(expected, actual);
	}
	
}
