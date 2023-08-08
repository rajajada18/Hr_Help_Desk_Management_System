package com.example.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.bean.HrBean;
import com.example.demo.bean.HrHeadBean;
import com.example.demo.bean.Ticket;
import com.example.demo.bean.TicketDate;
import com.example.demo.bean.UserBean;
import com.example.demo.bean.UserFlagBean;
import com.example.demo.bean.UserReport;
import com.example.demo.repo.HrHeadRepo;
import com.example.demo.repo.HrRepo;
import com.example.demo.repo.TicketRepo;
import com.example.demo.repo.UserFlagBeanRepo;
import com.example.demo.repo.UserRepo;
import com.example.demo.repo.UserReportRepo;
import com.example.demo.service.GenerateRandomOtpNumber;
import com.example.demo.service.MailSenderService;
import com.example.demo.service.TicketSerivceImple;
import com.example.demo.service.UserServiceImpl;

@org.springframework.stereotype.Controller

public class Controller {
	// /
	
	HttpServletRequest req;
	
	@Autowired
	UserRepo service;
	
	@Autowired
	UserServiceImpl serviceImpl;
	
	@Autowired
	 TicketRepo service2;
	
	@Autowired
	TicketSerivceImple serivceImple;
	
	@Autowired
	UserReportRepo reportService;
	
	@Autowired
	HrHeadRepo headService;
	
	StopWatch st = new StopWatch("Hr Help");
	
	@Autowired
	HrRepo hrService;
	
	@Autowired
	UserFlagBeanRepo flagService;
	
	@Autowired
	MailSenderService mailService;
    // static Map<String, String> otpRandom;
     
   //  static int rand=1;
	
  
   

	//Landing Page
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		System.out.println(Thread.currentThread());

		if(request.getSession().getAttribute("user") != null) {
			return "welcome";
		}
		System.out.println(request.getContextPath() + " ...came");
			return "reguser";		
		
	}
	
	@RequestMapping("/loginPage")
	public String openLoginPage() {
		return "login";
	}
	@RequestMapping("/hr")
	public String landingHr() {
		return "hrlogin";
	}
	//Just go to the welcome page
	@RequestMapping("/welcome")
	public String openWelcome() {
		return "welcome";
	}
	
	@RequestMapping("/confirmOtp")
	public String sendOtp(UserBean user,HttpServletRequest request, Model mv) {
		HrHeadBean hben = headService.findByEmail(user.getEmail());
	    HrBean hrben = hrService.findByEmail(user.getEmail());	
		UserBean bean = service.findByEmail(user.getEmail());
		if(bean==null) {
		char[] randOtp = GenerateRandomOtpNumber.OTP();
		String str = new String(randOtp);
		System.out.println(str);
		request.getSession().setAttribute("otp", str);
		request.getSession().setAttribute("userBeanObj", user);
		user.setOtp(str);
		//mailService.sendOTPMail(user.getEmail(), str, user.getFirstname() + " " + user.getLastname());
		return "confirmOtp";
		}	
		else if(hrben != null || hben!=null) {
			mv.addAttribute("already", user.getFirstname() +" " + user.getLastname() + " This email is already registered as Hr/HrHead, please use your mail to register");
			return "reguser";
		}
		else {
			mv.addAttribute("warn", user.getFirstname() + " " +  user.getLastname() + " you have already registered please login");	
			return "login";
		}
	}
	
	@RequestMapping("/checkOtp")
	public  String checkOtp(UserBean bean, HttpServletRequest request,@RequestParam String otp) {
		String otps = (String)request.getSession().getAttribute("otp");
		System.out.println(otp.equals(otps));
		System.out.println(otps);
		if(otp.equals(otps))
			return "redirect:/register";
		else {
			request.getSession().setAttribute("incorrectOtp", "Incorrect OTP re-enter it...");
		 return "confirmOtp";	
		}
		
	}
	
	//Register Mapping
	@RequestMapping({"/register","/jsp/register"})
	public  ModelAndView register(UserBean user, HttpServletRequest request) {
		if(request.getSession().getAttribute("userBeanObj")!=null) {
			System.out.println("I'm here");
		 user = (UserBean)request.getSession().getAttribute("userBeanObj");
		}
		System.out.println("Yeah I'm here");
		//System.out.println(request.getSession().getId());
		ModelAndView mv = new ModelAndView();
		HrHeadBean hben = headService.findByEmail(user.getEmail());
		HrBean hrben = hrService.findByEmail(user.getEmail());
		UserBean ben = service.findByEmail(user.getEmail());
		if(ben!=null ) {
//		System.out.println(ben==null);
		mv.addObject("warn", user.getFirstname() + " " +  user.getLastname() + " you have already registered please login");		
		mv.setViewName("login");
		return mv;
		}
		else if(hrben != null || hben!=null) {
			mv.addObject("already", user.getFirstname() +" " + user.getLastname() + " This email is already registered as Hr/HrHead, please use your mail to register");
			mv.setViewName("reguser");
			return mv;
		}
		else {
			mv.addObject("success", user.getFirstname() +" " + user.getLastname() + " Thanks for regestering to our services please login to move futher");
			UserBean bean = service.save(user);
			UserFlagBean ufb = new UserFlagBean();
			ufb.setUserBean(user);
			ufb.setFlag("false");
			flagService.save(ufb);
			mv.addObject("bean",bean);
			mv.setViewName("login");
			return mv;
		}
			
	}
	
	//Logging mapping
	@PostMapping({"/jsp/login","/login"})
	public ModelAndView login(HttpServletRequest request,@RequestParam String email, @RequestParam String password,Model model) {
		req=request;
//		System.out.println("came here");
		UserBean bean = service.findByEmail(email); 
		ModelAndView mv = new ModelAndView();
		if(bean!=null) {		
		if(password.equals(bean.getPassword())) {
			//Setting session attributes which will fall under if conditions
			
		
			request.getSession().setAttribute("message", "");
			//Added to session scope 
			request.getSession().setAttribute("list", service2.findAllByUserBean(bean.getId()));
			
			//Taking count of user ticket size
			int count = service2.findAllByUserBean(bean.getId()).size();
			request.getSession().setAttribute("usize", count);			
			mv.setViewName("welcome");
			
			request.getSession().setAttribute("user", bean); //bean object set
			mv.addObject("bean",bean);
			
			//Check for flag status
			String flag = flagService.findFlagByUserBean(bean.getId());
			//System.out.println("came here...");
			if(flag.equalsIgnoreCase("false")) {
			flagService.setFlagByUserBean("true", bean.getId());
			}
			else {
				mv.addObject("logged","<script>alert('You have already logged in another device logout there to continue here..')</script>");
				mv.setViewName("login");
			}
			
			//Stopwatch try catch block...
			/*
			 * Stopwatch is getting created for every request
			 * */
			
			try {
						st.start(bean.getFirstname() + " " + bean.getLastname() + " " + bean.getId());
					System.out.println(st.getLastTaskName());
			}
			catch (IllegalStateException e) {
				try {
					System.out.println("came inside try");
				st.start(bean.getFirstname() + " " + bean.getLastname() + " " + bean.getId());
				}catch (IllegalStateException e1) {
					System.out.println("came inside catch");
				
				
				}
			}
			return mv;
		}
		
		//Redirecting to login page when password is incorrect
		mv.setViewName("login");
		request.getSession().setAttribute("bean", bean);
		mv.addObject("error","Incorrect Password");
		return mv;
	}
		else {
			//When email is not found
			mv.addObject("error","Please register first to do login ");
			mv.setViewName("reguser");
			return mv;
		}
	}
	
	//Ticket Raise Mapping 
	@PostMapping({"/raise","/jsp/raise"})
	public ModelAndView raise(Ticket ticket, String definedIssue ,HttpServletRequest request) {
		//Session: to retrieve bean and store ticket
		ModelAndView mv = new ModelAndView("welcome");
//		System.out.println(definedIssue + " Issue"	);
		ticket.setUser((UserBean)request.getSession().getAttribute("user"));
		if(!definedIssue.isEmpty()) {
			ticket.setType(definedIssue);
		}
		service2.save(ticket);		
		UserBean user = (UserBean)request.getSession().getAttribute("user");
		request.getSession().setAttribute("list", "");
		request.getSession().setAttribute("list", service2.findAllByUserBean(user.getId()));
		int count = service2.findAllByUserBean(user.getId()).size(); //list.size() => int
		request.getSession().setAttribute("usize", count);
		mv.addObject("ticket" , "Ticket is raised successfully, check your tickets in View Tickets ");
		request.getSession().setAttribute("message", " \"Ticket is raised successfully, check your tickets in View Tickets\"");
		return mv;
	}
	

	
	//for view Tickets
	@RequestMapping("/viewTickets")
	public String viewTickets(HttpServletRequest request) {
		request.getSession().setAttribute("usize", service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId()).size());
		request.getSession().setAttribute("ulist", service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId()));
		List<Date> dates =service2.findAllDates();
		

		List<Ticket> lbeans = service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId());
		  Date todayDate = new Date(System.currentTimeMillis());
		   List<Long> ldays = new ArrayList<Long>();
		  dates.forEach(date->{
			  ldays.add(TimeUnit.MILLISECONDS.toHours(todayDate.getTime()-date.getTime()));
		  });
		  
		  List<TicketDate> tdlist = new ArrayList<TicketDate>();
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
		  

		  
//				tdlist.forEach(tdlist2 -> System.out.println(tdlist2));
				request.getSession().setAttribute("tdlist", tdlist);
//		ldays.forEach(d->System.out.println(d));
		return "ViewTicket";
	}
	//for cancel button click
	@RequestMapping("/cancel")
		public String viewCancalTicket(HttpServletRequest request) {
		
		request.getSession().setAttribute("usize", service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId()).size());
		request.getSession().setAttribute("ulist", service2.findAllByUserBeanAndStatus(((UserBean) request.getSession().getAttribute("user")).getId(),"Pending"));
		return "cancelTicket";
	}
	
	
	@RequestMapping("/cancel/{ticketId}")
	public String cancelTicket(@PathVariable int ticketId, Model model,HttpServletRequest request) {
		reportService.deleteByTicketId(ticketId);
		service2.deleteById(ticketId);
		//Updating the list in session object
		request.getSession().setAttribute("ulist", service2.findAllByUserBeanAndStatus(((UserBean) request.getSession().getAttribute("user")).getId(),"Pending"));
		request.getSession().setAttribute("usize", service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId()).size());
		model.addAttribute("cmessage", "Your Ticket has been cancelled, now you tickets list is updated...");
		return "cancelTicket";
	}
	
	//display report view tickets
		@RequestMapping("/viewReport")
		public String viewReportForUser(HttpServletRequest request) {
			request.getSession().setAttribute("usize", service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId()).size());
			request.getSession().setAttribute("ulist", service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId()));
			List<Date> dates =service2.findAllDates();
			

			List<Ticket> lbeans = service2.findAllByUserBean(((UserBean) request.getSession().getAttribute("user")).getId());
			  Date todayDate = new Date(System.currentTimeMillis());
			   List<Long> ldays = new ArrayList<Long>();
			  dates.forEach(date->{
				  ldays.add(TimeUnit.MILLISECONDS.toHours(todayDate.getTime()-date.getTime()));
			  });
			  
			  List<TicketDate> tdlist = new ArrayList<TicketDate>();
			  lbeans.forEach(bean->{
				  TicketDate td = new TicketDate();
				  td.setTicketId(bean.getTicketId());
				  td.setDate(bean.getDate());
				  td.setStatus(bean.getStatus());
				  td.setDescription(bean.getDescription());
				  td.setType(bean.getType());
				  td.setUser(bean.getUser());
				  td.setTimediff(TimeUnit.MILLISECONDS.toDays(todayDate.getTime()-bean.getDate().getTime()));
//	             add the report data also to database
				  List<UserReport> lrepo = reportService.findAll();
				  boolean flag =false;
				  for(UserReport lr : lrepo)
				  {
				if(lr.getTicket().getTicketId()==td.getTicketId())
				  flag = true;
				  }
				  if(flag==false)
//				Logic ends here					  
				  tdlist.add(td);
			  });
//					tdlist.forEach(tdlist2 -> System.out.println(tdlist2));
					request.getSession().setAttribute("tdlist", tdlist);
					

					
//			ldays.forEach(d->System.out.println(d));
			return "UserReportViewTicket";
		}
	
		//logout 
		@RequestMapping("/logout")
		public ModelAndView logout(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("logout","<script>alert('You was successfully logged out')"
					+ ""
					+ "</script>");
			try {
			st.stop();
			System.out.println(st.prettyPrint());
			System.out.println("Hello inside try");
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}
			
				
			
			flagService.setFlagByUserBean("false", ((UserBean)request.getSession().getAttribute("user")).getId());
//			System.out.println("User total Login Time =>"+TimeUnit.NANOSECONDS.toMinutes(st.getTotalTimeNanos()));
//			System.out.println(st.prettyPrint());
			System.out.println("User session id "+request.getSession().getId());
			request.getSession().invalidate();
			
			
			return mv;
		}
		
		//model attribute setvalues
		public  void setValues(HttpServletRequest request) {
			UserBean user = (UserBean)request.getSession().getAttribute("user");
			request.getSession().setAttribute("list", "");
			request.getSession().setAttribute("list", service2.findAllByUserBean(user.getId()));
			int count = service2.findAllByUserBean(user.getId()).size(); //list.size() => int
			request.getSession().setAttribute("usize", count);
		}
		
		/**********************USER DEFINED REPORT PAGE******************************/
		@RequestMapping({"/report","jsp/report"})
		public String raiseUserDefReport() {
			
			return "UserDefinedReport";
		}
		
		@RequestMapping("/report/raise")
		public String saveUserDefReport(Ticket ticket,HttpServletRequest request) {
			UserBean user = (UserBean)request.getSession().getAttribute("user");
			request.getSession().setAttribute("list", "");
			request.getSession().setAttribute("list", service2.findAllByUserBean(user.getId()));
			int count = service2.findAllByUserBean(user.getId()).size(); //list.size() => int
			request.getSession().setAttribute("usize", count);
			ticket.setDescription("User Defined Report: "+ticket.getDescription());
			ticket.setUser((UserBean)request.getSession().getAttribute("user"));
			
			service2.save(ticket);
			System.out.println();
			  Date todayDate = new Date(System.currentTimeMillis());
			//td.setTimediff(TimeUnit.MILLISECONDS.toDays(todayDate.getTime()-bean.getDate().getTime()))
			return "redirect:/head/report/"+ticket.getTicketId()+"/"+TimeUnit.MILLISECONDS.toDays(todayDate.getTime()-ticket.getDate().getTime());
		}
		
		/**********************USER PROFILE PAGE******************************/
		@RequestMapping("/userProfile")
		public String userProfile(Model model,HttpServletRequest request) {
			UserBean user = (UserBean)request.getSession().getAttribute("user");
			user = service.getById(user.getId());
			System.out.println(user.getFirstname());
			request.getSession().setAttribute("user", user);
			model.addAttribute("user",user);
			List<Ticket> tickets = service2.findByUserIdOrderByDateAndStatusDesc(user.getId());
			System.out.println(tickets);
			if(!tickets.isEmpty())
			{
			Ticket ticket = tickets.get(0);
			model.addAttribute("ticket","Ticket Type: "+ticket.getType() + "<br/> Raised on: " + ticket.getDate() + "<br/> Status: " + ticket.getStatus() );
			}
			else {
				model.addAttribute("ticket"," <marquee>No Tickets!!</marquee> ");
			}
			return "userProfile";
		} 
		
//		* *******************USER PROFILE PAGE*****************************
		/****
		 *  <b>Make Ajax Calls</b>
		 */
		
		@GetMapping("/validate")
		public @ResponseBody String validateEmail(
				@RequestParam String uemail
				) {
			System.out.println("Im here " + uemail);
			
			String message = "";
				if(serviceImpl.isUserExistByEmail(uemail) ) {
					System.out.println("Im here " + uemail);
					message = uemail + ", already exists!!";					
				}else {
					System.out.println("Im here " + uemail);
					message = "empty";
				}
				
				System.out.println("Im here " + uemail);
			return message;
		}
}
