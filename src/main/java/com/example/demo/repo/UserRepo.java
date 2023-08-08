package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.bean.UserBean;

public interface UserRepo extends JpaRepository<UserBean, Integer>{

	UserBean findByEmail(String email); 
	
	@Modifying
	@Query(value = "UPDATE UserBean SET email = ?2, firstName = ?3, lastName = ?4, password = ?5 Where id = ?1")
	int setUserBeanInfoById(int id, String email,String firstName, String lastName, String password);
	
	@Query("SELECT count(*) FROM UserBean WHERE email =:uemail")
	public int getCountByUserEmail(String uemail);
	
}
