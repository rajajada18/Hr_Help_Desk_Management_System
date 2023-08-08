package com.example.demo.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.bean.UserFlagBean;

public interface UserFlagBeanRepo extends JpaRepository<UserFlagBean, Integer> {

     UserFlagBean findByUserBean(int id);

     @Query("Select flag From UserFlagBean Where User_Bean_Id =?1")
	String findFlagByUserBean(int id);
	
	@Transactional
	@Modifying
	@Query("Update UserFlagBean Set flag=?1 where user_bean_id=?2")
	void setFlagByUserBean(String flag,int id);
	
	@Transactional
	@Modifying
	@Query("Update UserFlagBean Set flag=?1")
	void updateAllFlags(String flag);
	
	@Transactional
	@Modifying
	@Query(value="DELETE From UserFlagBean WHERE user_bean_id = :user_id")
	void deleteByUserBeanId(Integer user_id);
}
