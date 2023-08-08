package com.example.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.bean.HrBean;
import com.example.demo.bean.Ticket;
import com.example.demo.bean.TicketDate;

import com.example.demo.repo.HrRepo;
import com.example.demo.repo.TicketRepo;
import com.example.demo.repo.UserRepo;
import com.example.demo.repo.UserReportRepo;
import com.example.demo.service.TicketSerivceImple;

@Controller
@RequestMapping("/hr")
public class HrController {

	@Autowired
	HrRepo service;
	@Autowired
	TicketRepo service2;
	@Autowired
	TicketSerivceImple serivceImple;
	@Autowired
	UserRepo userService;
	
	@Autowired
	UserReportRepo reportService;
	
	@RequestMapping("/hrLoginPage")
	public String hrLoginPage() {
		return "hrlogin";
	}
	
	@RequestMapping("/login")
	public ModelAndView loginHr(HrBean hr,HttpServletRequest request) {
		
		HrBean bean = service.findByEmail(hr.getEmail());
		System.out.println(hr.getEmail());
		System.out.println(hr.getPassword());
		ModelAndView mv = new ModelAndView();
		
		
		if (bean!=null){
			
		 if(hr.getPassword().equals(bean.getPassword())) {
			
			 request.getSession(true).setAttribute("list", service2.findAllByStatus("pending"));
			 System.out.println(request.getSession().getId());
			 request.getSession().setAttribute("size", service2.findAllByStatus("pending").size());
			 request.getSession().setAttribute("hr", bean);
			 mv.setViewName("HrWelcome");
			mv.addObject("hr",bean);
			return mv;
		}
		 	mv.setViewName("login");
			request.getSession().setAttribute("hr", bean);
			mv.addObject("pmessage","Incorrect Password");
			return mv;
			}
		else {			
			mv.setViewName("hrlogin");
			mv.addObject("emessage","Invalid Email");			
			
			return mv;
		
	}
	}
	
	//Mapping for the dynamic view 
	@RequestMapping("/view")
	public String getTickets(HttpServletRequest request) {
		
		List<Ticket> lbeans  = service2.findAllByStatus("Pending");
		  List<TicketDate> tdlist = new ArrayList<TicketDate>();
		  Date todayDate = new Date(System.currentTimeMillis());
		  lbeans.forEach(bean->{
			  TicketDate td = new TicketDate();
			  td.setTicketId(bean.getTicketId());
			  td.setDate(bean.getDate());
			  td.setStatus(bean.getStatus());
			  td.setDescription(bean.getDescription());
			  td.setType(bean.getType());
			  td.setUser(bean.getUser());
			  td.setTimediff(TimeUnit.MILLISECONDS.toDays(todayDate.getTime()-bean.getDate().getTime()));
			  tdlist.add(td);
		  });
		  
		  //Sort the TicketDate list with the help of streams
		List<TicketDate> sortedList =   tdlist.stream()
		  .sorted(Comparator.comparing(TicketDate::getDate))
		  .collect(Collectors.toList());
		  
				request.getSession().setAttribute("rlist", sortedList);
		 request.getSession().setAttribute("size", service2.findAllByStatus("pending").size());
		return "HrViewTicket";
	}
	
	//Mapping for the user details 
	@RequestMapping("/user/{id}")
	public ModelAndView getUser(@PathVariable int id) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",userService.getById(id));
		mv.setViewName("displayUser");
		return mv;	
	}
	
	@Transactional
	@RequestMapping("/resolve/{ticketId}")
	public String resolve(@PathVariable int ticketId,Model model,HttpServletRequest request) {
		int res = service2.setTicketInfoById("Resolve", ticketId);
		reportService.deleteByTicketId(ticketId);
		if(res>0) {
			model.addAttribute("setUpdate", "Update is successful");
			request.getSession().setAttribute("size", service2.findAllByStatus("pending").size());
			System.out.println("Update is successful");
		}
		else {
			System.out.println("Update is unsuccessful");
		}
//		Ticket ticket = service2.getById(ticketId);
//		ticket = new Ticket(ticket.getTicketId(), ticket.getUser(), ticket.getDate(), ticket.getType(), ticket.getDescription(), "Resolve");
//		service2.deleteById(ticketId);
//		service2.save(ticket);
		return "redirect:/hr/view";
	}
	
	//Here Ticket Resolve with a proper reason
	@Transactional
	@RequestMapping("/resolveReason/{ticketId}")
	public String resolveWithReason(@PathVariable int ticketId,Model model,HttpServletRequest request) {
		int res = service2.setTicketInfoById("Resolve", ticketId);
		reportService.deleteByTicketId(ticketId);
		if(res>0) {
			model.addAttribute("setUpdate", "Update is successful");
			request.getSession().setAttribute("size", service2.findAllByStatus("pending").size());
			System.out.println("Update is successful");
		}
		else {
			System.out.println("Update is unsuccessful");
		}
//		Ticket ticket = service2.getById(ticketId);
//		ticket = new Ticket(ticket.getTicketId(), ticket.getUser(), ticket.getDate(), ticket.getType(), ticket.getDescription(), "Resolve");
//		service2.deleteById(ticketId);
//		service2.save(ticket);
		return "redirect:/hr/view";
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hrlogin");
		mv.addObject("logout","<script>alert('You was successfully logged out')"
				+ ""
				+ "</script>");
		System.out.println("Hr session id "+request.getSession().getId());
		request.getSession().invalidate();
		return mv;
	}
}
