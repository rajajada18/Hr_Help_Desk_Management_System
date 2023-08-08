package com.example.demo.bean;

public class HrReason {

	private Ticket ticket;
	private HrBean hr;
	private String reason;
	
	
	
	public HrReason() {
		super();

	}
	
	public HrReason(Ticket ticket, HrBean hr, String reason) {
		super();
		this.ticket = ticket;
		this.hr = hr;
		this.reason = reason;
	}
	public Ticket getTicket() {
		return ticket;
	}
	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}
	public HrBean getHr() {
		return hr;
	}
	public void setHr(HrBean hr) {
		this.hr = hr;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
