package com.example.demo.bean;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class UserBean {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private int id;
	private String firstname;
	private String lastname;	
	private String email;
	private String password;
	@Transient
	private String otp;
	private String enteredOtp;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	
	public String getEnteredOtp() {
		return enteredOtp;
	}
	public void setEnteredOtp(String enteredOtp) {
		this.enteredOtp = enteredOtp;
	}
	@Override
	public String toString() {
		return "UserBean [firstname=" + firstname + ", lastname=" + lastname + ", email=" + email + ", password="
				+ password + "]";
	}
	
	
}
