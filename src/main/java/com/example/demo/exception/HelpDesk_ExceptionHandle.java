package com.example.demo.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.example.demo.bean.UserBean;
import com.example.demo.repo.UserFlagBeanRepo;



@Controller
@ControllerAdvice
public class HelpDesk_ExceptionHandle {

	@Autowired
	UserFlagBeanRepo flagBeanRepo;
	
	@ExceptionHandler(value = {IllegalStateException.class , NullPointerException.class,RuntimeException.class,Error.class})
	public String handleIllegal(HttpServletRequest request) {
		System.out.println("Im here inside new exception");
		try { 
		flagBeanRepo.setFlagByUserBean("false", ((UserBean)request.getSession().getAttribute("user")).getId());
		request.getSession().invalidate();
		}catch (Exception e) {
			e.printStackTrace();
			return "RedirectError";
		}
		return "RedirectError";
	}
	
	@ExceptionHandler(value = Exception.class)
	public String handle(HttpServletRequest request) {
		System.out.println("Im here");
		flagBeanRepo.setFlagByUserBean("false", ((UserBean)request.getSession().getAttribute("user")).getId());
		request.getSession().invalidate();
			return "RedirectError";
	}
	
}
