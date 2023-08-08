package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.bean.HrBean;

public interface HrRepo extends JpaRepository<HrBean, Integer>{

	HrBean findByEmail(String email);

	@Modifying
	@Query(value =  "UPDATE HrBean SET  name = ?2, password = ?3 Where id = ?1")
	int setHrInfoById(int id, String name, String password); 
		
	
}
