package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.bean.HrHeadBean;

public interface HrHeadRepo extends JpaRepository<HrHeadBean, String> {

	HrHeadBean findByEmail(String email);
	
	
}
