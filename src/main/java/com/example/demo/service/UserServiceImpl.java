package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repo.UserRepo;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserRepo repo;

	@Override
	public boolean isUserExistByEmail(String uemail) {	
		return repo.getCountByUserEmail(uemail)>0;
	}

}
