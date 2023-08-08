package com.example.demo.service;


import org.springframework.stereotype.Service;

import com.example.demo.bean.Ticket;
import com.example.demo.repo.TicketRepo;

@Service
public class TicketSerivceImple {

	
	TicketRepo service;
	
	public Ticket findById(int id) {
		
		 Ticket ticket = service.getById(8);
		 if(ticket==null) {
			 throw new NullPointerException("Ticket is null");
		 }
		 return ticket;
	}

}
