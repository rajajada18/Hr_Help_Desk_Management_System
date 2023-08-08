package com.example.demo.repo;

import java.sql.Date;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.bean.Ticket;

public interface TicketRepo extends JpaRepository<Ticket, Integer> {

	@	Query(value = "From Ticket where user_id=?1") //From Ticket WHERE status = 'pending'
	List<Ticket> findAllByUserBean(int id);
	
	
	
	@Query(value="From Ticket where status=?1") //SELECT * FROM Ticket WHERE status = 'pending' HQL JQL JPQL
	List<Ticket> findAllByStatus(String status);
	
	@Query(value = "From Ticket WHERE user_id = ?1 and status = ?2 ")
	List<Ticket> findAllByUserBeanAndStatus(int id, String status);
	
	@Modifying
	@Query(value = "UPDATE Ticket SET status = ?1 WHERE ticket_Id = ?2") 
	int setTicketInfoById(String status,int id);
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM Ticket WHERE user_id = ?1")
	void deleteAllByUserBean(int id);
	
	@Query(value = "SELECT date FROM Ticket ")
	List<Date> findAllDates();
	
	@Query(value = "From Ticket Where user_id=?1 Order By ticket_Id desc")
	List<Ticket> findByUserIdOrderByDateAndStatusDesc(int id);
}
