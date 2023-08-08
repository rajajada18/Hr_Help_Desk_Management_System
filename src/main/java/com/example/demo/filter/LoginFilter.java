package com.example.demo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.example.demo.service.TicketSerivceImple;


@Component
@WebFilter({"/jsp/login","/head/login","/hr/login"})
public class LoginFilter implements Filter{

	TicketSerivceImple ticket = new TicketSerivceImple();
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	
//		Ticket t = ticket.findById(8);
//		System.out.println(t.getTicketId());
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("Login filter executed first");
		if(email.length()>1 && password.length()>1)
		{
		chain.doFilter(request, response);
			
		}
		String uri = ((HttpServletRequest) request).getRequestURI();
		
		if(uri.equalsIgnoreCase("/jsp/login")) {
		request.setAttribute("lmessage", "Two fields are manditory");
		request.getRequestDispatcher("/jsp/login.jsp").include(request, response);;
		}
		else if(uri.equalsIgnoreCase("/head/login")) {
			request.setAttribute("lmessage", "Two fields are manditory");
			request.getRequestDispatcher("/jsp/hrhead.jsp").include(request, response);;
		}
		else if(uri.equalsIgnoreCase("/hr/login")){
			request.setAttribute("lmessage", "Two fields are manditory");
			request.getRequestDispatcher("/jsp/hrlogin.jsp").include(request, response);;
		}
	}

}
