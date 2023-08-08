package com.example.demo.bean;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class UserReport {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@OneToOne(fetch = FetchType.EAGER)	
	@JoinColumn(nullable = false)
	private Ticket ticket;
	
	
	private long ticketdiff;

		

	public UserReport() {
		super();
	
	}

	public UserReport(Ticket ticket, long ticketdiff) {
		super();		
		this.ticket = ticket;
		this.ticketdiff = ticketdiff;
	}

	@Override
	public String toString() {
		return "UserReport [id=" + id + ", ticket=" + ticket + ", ticketdiff=" + ticketdiff + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public long getTicketdiff() {
		return ticketdiff;
	}

	public void setTicketdiff(long ticketdiff) {
		this.ticketdiff = ticketdiff;
	}
	
	
}
