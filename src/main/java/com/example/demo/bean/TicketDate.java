package com.example.demo.bean;

import java.util.Date;


public class TicketDate {

	private int ticketId;
	private UserBean user;
	private Date date;
	private String type;
	private String status = "Pending";
	private Long timediff;
	private String description;
	
	public TicketDate() {
		super();

	}

	


	@Override
	public String toString() {
		return "TicketDate [ticketId=" + ticketId + ", user=" + user + ", date=" + date + ", type=" + type + ", status="
				+ status + ", timediff=" + timediff + ", description=" + description + "]";
	}




	public TicketDate(int ticketId, UserBean user, Date date, String type, String status, Long timediff,String description) {
		super();
		this.ticketId = ticketId;
		this.user = user;
		this.date = date;
		this.type = type;
		this.status = status;
		this.timediff = timediff;
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getTimediff() {
		return timediff;
	}
	public void setTimediff(Long timediff) {
		this.timediff = timediff;
	}
	
	
	
	
}
