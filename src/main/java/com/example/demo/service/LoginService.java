package com.example.demo.service;



import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.repo.UserRepo;


public class LoginService {

	@Autowired
	static UserRepo service;
	public static void checkPassword(String email,String password) {
		
		System.out.println(email + " " + password);
		//UserBean bean = service.getById("rajajada18@gmail.com");
		//System.out.println(bean);
//		if(email!=null) {
//		Object bean = (service.findById(email));
//		if(bean!=null) {
//			if(password.equals(((UserBean) bean).getPassword())) {
//			}
//		}
//		}
//		
	}
}
