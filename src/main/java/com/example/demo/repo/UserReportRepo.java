package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.bean.UserReport;

public interface UserReportRepo extends JpaRepository<UserReport, Integer> {

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM UserReport WHERE ticket_ticket_id = ?1")
	void deleteByTicketId(int id);
	
	
}
