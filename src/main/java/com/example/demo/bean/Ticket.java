package com.example.demo.bean;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Ticket")
public class Ticket {

	@Override
	public String toString() {
		return "Ticket [ticketId=" + ticketId + ", user=" + user + ", date=" + date + ", type=" + type
				+ ", description=" + description + "]";
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ticketId;
	
   @OneToOne(fetch = FetchType.EAGER)	
	@JoinColumn(nullable = false)
	private UserBean user;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date;
	
	@Column(length = 50)
	private String type;
	
	@Column(length = 4000)
	private String description;
	
	@Column()
	private String status = "Pending";
	
	public Ticket() {
		super();

	}
	
	public Ticket(int ticketId, UserBean user, Date date, String type, String description, String status) {
		super();
		this.ticketId = ticketId;
		this.user = user;
		this.date = date;
		this.type = type;
		this.description = description;
		this.status = status;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
