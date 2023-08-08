package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.bean.HrBean;
import com.example.demo.bean.HrHeadBean;
import com.example.demo.bean.Ticket;
import com.example.demo.bean.TicketDate;
import com.example.demo.bean.UserBean;
import com.example.demo.bean.UserReport;
import com.example.demo.repo.HrHeadRepo;
import com.example.demo.repo.HrRepo;
import com.example.demo.repo.TicketRepo;
import com.example.demo.repo.UserFlagBeanRepo;
import com.example.demo.repo.UserRepo;
import com.example.demo.repo.UserReportRepo;

@Controller
@RequestMapping("/head")
public class HrHeadController {

	

	@Autowired
	HrHeadRepo service;

	@Autowired
	TicketRepo tService;

	@Autowired
	UserRepo userService;

	@Autowired
	HrRepo hrService;

	@Autowired
	UserReportRepo reportService;
	
	@Autowired
	UserFlagBeanRepo flagRepo;

	private static int pageNo;

	private static boolean pageNext;
	
	private static boolean pagePrevious;
	public HrHeadController() {
		System.out.println("Hello");
	}

	@RequestMapping("/")
	public String loginPage() {
		return "hrhead";
	}
	@RequestMapping("/login")
	public String login(HrHeadBean bean,HttpServletRequest request) {
		//System.out.println(bean.getName() + " " + bean.getEmail());
		try {
			HrHeadBean head = service.getById(bean.getEmail());

			//System.out.println(head.getName());
			if(head!=null) {
				//System.out.println("email correct");


				if(bean.getPassword().equals(head.getPassword())) {

					//Header name
					request.getSession().setAttribute("hname",head.getName());
					//Size of tickets count
					request.getSession().setAttribute("tCount", tService.findAllByStatus("Pending").size());
					//			System.out.println("password correct");
					//Size of reports
					request.getSession().setAttribute("rCount", reportService.findAll().size());
					return "HrHeadWelcome";
				}
				else {
					System.out.println("password incorrect");
					request.getSession().setAttribute("incorrect", " Incorrect Password ");
					return "hrhead";
				}
			}
			else {
				System.out.println("user incorrect");
				request.getSession().setAttribute("incorrect", "You're mail is not correct, please check your mail!");
				return "hrhead";
			}
		}catch (Exception e) {
			request.getSession().setAttribute("incorrect", "You're mail is not correct, please check your mail!");
			return "hrhead";
		}
	}

	@RequestMapping({"/view","/view/previous","/view/next"})
	public ModelAndView view(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("HrHeadWelcome");
		request.getSession().setAttribute("tCount", tService.findAllByStatus("Pending").size());
		//Size of reports
		request.getSession().setAttribute("rCount", reportService.findAll().size());
		//List of tickets 
		mv.addObject("list", tService.findAllByStatus("Pending")
				.stream()
				.sorted(Comparator.comparing(Ticket::getDate))
				.collect(Collectors.toList())
				);

		/*
		 * 		  //Here Pagination Implemented
		  Pageable pageable = PageRequest.of(0, 5);
		  Page<Ticket> page = service2.findAll(pageable);
		 * */
		//System.out.println(request.getRequestURL());
		//System.out.println(request.getRequestURI());
		//getRequestURI->/head/view
		if(request.getRequestURI().equals("/head/view")) {
			pageNo=0;
			//System.out.println("Yes");
			Pageable pageable = PageRequest.of(pageNo,6);
			Page<Ticket> page = tService.findAll(pageable);
			pageNext = page.hasNext();
			pagePrevious=page.hasPrevious();
			List<Ticket> list =page.stream().filter(ticket->ticket.getStatus().equalsIgnoreCase("Pending")).sorted(Comparator.comparing(Ticket::getDate)).collect(Collectors.toList());
			mv.addObject("list", list);
			mv.addObject("hasPrevious",pagePrevious);
			mv.addObject("hasNext",pageNext);	
		}
		else if(request.getRequestURI().equals("/head/view/next")) {

			pageNo++;
			Pageable pageable = PageRequest.of(pageNo, 6);
			Page<Ticket> page = tService.findAll(pageable);
//			System.out.println(page.getSize());
//			System.out.println(page.hasNext());
			if(pageNext) {
				List<Ticket> list =page.getContent().stream().filter(ticket->ticket.getStatus().equalsIgnoreCase("Pending")).sorted(Comparator.comparing(Ticket::getDate)).collect(Collectors.toList());
//				System.out.println("####################"+list.size());
				mv.addObject("hasNext",page.hasNext());
				mv.addObject("hasPrevious",page.hasPrevious());
				pageNext=page.hasNext();
				pagePrevious=page.hasPrevious();
				
				mv.addObject("list", list);
			}
			else {
				 pageable = PageRequest.of(0, 6);
				 pageNo=0;
				page = tService.findAll(pageable);
				List<Ticket> list =page.getContent().stream().filter(ticket->ticket.getStatus().equalsIgnoreCase("Pending")).sorted(Comparator.comparing(Ticket::getDate)).collect(Collectors.toList());
				mv.addObject("hasNext",page.hasNext());
				mv.addObject("hasPrevious",page.hasPrevious());
				pageNext=page.hasNext();
				pagePrevious=page.hasPrevious();
				mv.addObject("list", null);
				mv.addObject("list", list);
				System.out.println("Here here " + page.hasNext()+page.getTotalPages());
				
			}
		}
		else if(request.getRequestURI().equals("/head/view/previous")) {

			pageNo--;
			if(pageNo>=0) {
			Pageable pageable = PageRequest.of(pageNo,6);
			Page<Ticket> page = tService.findAll(pageable);
			
			 if(pagePrevious) {
				pageNext = page.hasNext();
				List<Ticket> list =page.stream().filter(ticket->ticket.getStatus().equalsIgnoreCase("Pending")).sorted(Comparator.comparing(Ticket::getDate)).collect(Collectors.toList());
				mv.addObject("hasPrevious",page.hasPrevious());
				mv.addObject("hasNext",page.hasNext());	
				mv.addObject("list", list);
			}
			else {
				mv.addObject("hasPrevious",page.hasPrevious());	
			}
		}
			else {
				
				
				Pageable pageable = PageRequest.of(0,6);
				pageNo=0;
				Page<Ticket> page = tService.findAll(pageable);
				List<Ticket> list =page.stream().filter(ticket->ticket.getStatus().equalsIgnoreCase("Pending")).sorted(Comparator.comparing(Ticket::getDate)).collect(Collectors.toList());
				mv.addObject("hasPrevious",page.hasPrevious());
				mv.addObject("hasNext",page.hasNext());	
				mv.addObject("list", list);
			}
		}
		//Set View to HrViewTicket
		mv.setViewName("headViewTicket");
		return mv;
	}

	//	---------------------------------- User Data-----------------------------------
	//Save new user'
	@RequestMapping("/user/register")
	public String saveNewUser(UserBean bean,HttpServletRequest request) {
		HrHeadBean headBean = service.findByEmail(bean.getEmail());
		HrBean hrBean = hrService.findByEmail(bean.getEmail());
		UserBean userBean = userService.findByEmail(bean.getEmail());
		if(hrBean==null && userBean == null && headBean==null) {
			userService.save(bean);
			request.getSession().setAttribute("regMessage", "<script>alert('User added successfully!')</script>");
			request.getSession().setAttribute("user", userService.findAll());
			request.getSession().setAttribute("cUsers", userService.findAll().size());
			return "HrHeadUser";
		}
		else if(headBean !=null) {
			request.getSession().setAttribute("regMessage", "<script>alert('Entered email already present in \"Head\" database!')</script>");
			return "headreguser";
		}
		else if(hrBean!=null) {
			request.getSession().setAttribute("regMessage", "<script>alert('Entered email already present in \"HR\" database!')</script>");
			return "headreguser";
		}
		else {
			request.getSession().setAttribute("regMessage", "<script>alert('Entered email already present in \"USER\" database!')</script>");
			return "headreguser";
		}

	}

	//Mapping for the user details 
	@RequestMapping("/user/{id}")
	public ModelAndView getUser(@PathVariable int id) {

		ModelAndView mv = new ModelAndView();
		mv.addObject("user",userService.getById(id));
		mv.setViewName("HeaddisplayUser");
		return mv;	
	}

	@Transactional
	@RequestMapping("/resolve/{ticketId}")
	public String resolve(@PathVariable int ticketId,Model model,HttpServletRequest request) {
		int res = tService.setTicketInfoById("Resolve", ticketId);
		reportService.deleteByTicketId(ticketId);
		if(res>0) {
			model.addAttribute("setUpdate", "Update is successful");

			System.out.println("Update is successful");
		}
		else {
			System.out.println("Update is unsuccessful");
		}
		return "redirect:/head/view";
	}
	@RequestMapping("/edit/{id}")
	public String editUser(@PathVariable int id,HttpServletRequest request) {
		System.out.println(id);
		request.getSession().setAttribute("user",userService.getById(id));

		return "HeadEditUser";
	}

	@Transactional
	@RequestMapping("/save")
	public String save(UserBean bean,HttpServletRequest request) {
		userService.setUserBeanInfoById(bean.getId(), bean.getEmail(), bean.getFirstname(), bean.getLastname(), bean.getPassword());
		request.getSession().setAttribute("save", "Saved successfully!");
		System.out.println(bean.getEmail());
		return "redirect:/head/edit/"+bean.getId();
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
	
		System.out.println("Line 286");
		tService.deleteAllByUserBean(id);
		System.out.println("Line 288");
		userService.deleteById(id);
		return "redirect:/head/view";
	}

	@RequestMapping("/user")
	public String user(HttpServletRequest request) {
		request.getSession().setAttribute("user", userService.findAll());
		request.getSession().setAttribute("cUsers", userService.findAll().size());
		//Size of list in hr table
		request.getSession().setAttribute("cHr",hrService.findAll().size() );

		//add hr object
		request.getSession().setAttribute("hr",hrService.findAll());
		return "HrHeadUser";
	}

	@RequestMapping("/listdelete/{id}")
	public String deleteUserReturnList(@PathVariable int id,HttpServletRequest request) {
		tService.deleteAllByUserBean(id);
		flagRepo.deleteByUserBeanId(id);
		userService.deleteById(id);
		request.getSession().setAttribute("user", userService.findAll());
		request.getSession().setAttribute("cUsers", userService.findAll().size());
		request.getSession().setAttribute("deleteMessage", " \"<script>alert('User deleted successfully!')</script>");
		return "HrHeadUser";
	}

	@RequestMapping("/edit2/{id}")
	public String editUser2(@PathVariable int id,HttpServletRequest request) {
		//System.out.println(id);
		request.getSession().setAttribute("user",userService.getById(id));
		request.getSession().setAttribute("cUsers", userService.findAll().size());
		request.getSession().setAttribute("editMessage", " \"<script>alert('User saved successfully!')</script>");
		return "HeadEditUser2";
	}



	@Transactional
	@RequestMapping("/save2")
	public String save2(UserBean bean,HttpServletRequest request) {


		userService.setUserBeanInfoById(bean.getId(), bean.getEmail(), bean.getFirstname(), bean.getLastname(), bean.getPassword());
		request.getSession().setAttribute("save", "<script>alert('Saved successfully!')</script>");
		//System.out.println(bean.getEmail());
		return "redirect:/head/edit2/"+bean.getId();

	}

	@RequestMapping("/home")
	public String returnHome() {
		return "HrHeadWelcome";
	}

	@RequestMapping("/addUser")
	public String returnAddUser() {
		return "headreguser";
	}
	//	-------------------------------Hr data------------------------------

	@RequestMapping("/addHr")
	public String addNewHr() {
		return "reghr";
	}

	@RequestMapping("/hr2")
	public String viewHr(HttpServletRequest request) {

		//Size of list in hr table
		request.getSession().setAttribute("cHr",hrService.findAll().size() );

		//add hr object
		request.getSession().setAttribute("hr",hrService.findAll());

		return "HrHeadHr";
	}

	//Create new hr object
	@RequestMapping("/register")
	public String addHr(HrBean hr,HttpServletRequest request,Model model)
	{

		HrBean bean1 = hrService.findByEmail(hr.getEmail());
		UserBean bean2 = userService.findByEmail(hr.getEmail());

		if(bean1==null && bean2==null) {
			hrService.save(hr);

			//Size of list in hr table
			request.getSession().setAttribute("cHr",hrService.findAll().size() );

			//add hr object
			request.getSession().setAttribute("hr",hrService.findAll());

			//send message
			request.getSession().setAttribute("hrMail", "<script>alert('mail is saved successfully " + hr.getName()+"')</script>");
			return "HrHeadHr";
		}
		else {
			if(bean1!=null) {
				request.getSession().setAttribute("hrMail", "<script>alert('mail is already registered with name " + bean1.getName()+"')</script>");
				return "reghr";
			}
			else {
				request.getSession().setAttribute("hrMail", "<script>alert('This mail is already registered as named " + bean2.getFirstname() + " " + bean2.getLastname()+"')</script>");
				return "reghr";
			}
		}
	}

	//hr edit page request
	@RequestMapping("/edit3/{id}")
	public String editPageHr(@PathVariable int id, HttpServletRequest request) {
		//add hr object to session get object by Id
		request.getSession().setAttribute("hr", hrService.getById(id));

		return "HeadEdithr";
	}

	//Hr edited object saving
	@Transactional
	@RequestMapping("/hredit")
	public String editHr(HrBean bean, HttpServletRequest request) {
		//save edited hr bean
		hrService.setHrInfoById(bean.getId(), bean.getName(), bean.getPassword());
		//after saving hr again add bean object to session
		request.getSession().setAttribute("hr", hrService.getById(bean.getId()));
		//send a message after saving
		request.getSession().setAttribute("Edithr", "<script>alert('Hr "+bean.getName()+" edited success')</script>");
		return "HeadEdithr";
	}

	//Hr Delete
	@RequestMapping("/listdelete2/{id}")
	public String deleteHr(@PathVariable int id,HttpServletRequest request) {
		String hrName = hrService.getById(id).getName();
		hrService.deleteById(id);
		//Display the list
		request.getSession().setAttribute("hrDelete", "<script>alert(' "+ hrName+" is deleted successfully!')</script>");
		return "redirect:/head/hr2";
	}

	/**********************************Reports***************************************/	
	//Reporting  
	@RequestMapping("/report/{ticketId}/{timediff}")
	public String reportByUser(@PathVariable int ticketId, @PathVariable long timediff,Model model,HttpServletRequest request) {
		Ticket ticket = tService.getById(ticketId);
		UserReport report = new UserReport(ticket, timediff);
		//Size of reports
		request.getSession().setAttribute("rCount", reportService.findAll().size());
		reportService.save(report);
		System.out.println(report);
		return "welcome";
	}

	//displayReports
	@RequestMapping("displayReports")
	public String displayReportsByUser(HttpServletRequest request) {
		//Size of reports
		request.getSession().setAttribute("rCount", reportService.findAll().size());
		List<UserReport> report = reportService.findAll();
		List<TicketDate> tDate = new ArrayList<TicketDate>();
		report.forEach(userreport -> {
			Ticket ticket = tService.getById(userreport.getTicket().getTicketId());
			TicketDate tsave = new  TicketDate(ticket.getTicketId(), ticket.getUser(), ticket.getDate(), ticket.getType(), ticket.getStatus(), userreport.getTicketdiff(), ticket.getDescription());
			tDate.add(tsave);
		});
		request.getSession().setAttribute("reportList", tDate);
		return "HeadUserReport";
	}

	//	------------------------Logout---------------------------

	//	@RequestMapping("/logout")
	//	public String checkLogout(HttpServletRequest request, HttpServletResponse response) {
	//		
	//		Authentication authn = SecurityContextHolder.getContext().getAuthentication();
	//		if(authn!=null) {
	//			new SecurityContextLogoutHandler().logout(request, response, authn);
	//		}
	//		return "redirect:/head/";
	//	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hrhead");
		mv.addObject("logout","<script>alert('You was successfully logged out')"
				+ ""
				+ "</script>");
		System.out.println("Head session id "+request.getSession().getId());
		request.getSession().invalidate();
		return mv;
	}
}

