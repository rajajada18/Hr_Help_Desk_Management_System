package com.example.demo.runner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.demo.repo.UserFlagBeanRepo;

@Component
public class FlagRunner implements CommandLineRunner {

	@Autowired
	UserFlagBeanRepo flagBeanRepo;
	@Override
	public void run(String... args) throws Exception {
		flagBeanRepo.updateAllFlags("false"); 

	}

}
