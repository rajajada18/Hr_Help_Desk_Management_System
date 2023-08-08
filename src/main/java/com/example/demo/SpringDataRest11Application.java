package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import com.example.demo.filter.LoginFilter;



@SpringBootApplication
public class SpringDataRest11Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringDataRest11Application.class, args);
	}

@Bean
FilterRegistrationBean<LoginFilter> specificLoginFilter(){

final FilterRegistrationBean<LoginFilter> filterRegisterationBean = new FilterRegistrationBean<LoginFilter>();
filterRegisterationBean.setFilter(new LoginFilter());
filterRegisterationBean.addUrlPatterns("/jsp/login");
filterRegisterationBean.addUrlPatterns("/head/login");
filterRegisterationBean.addUrlPatterns("/hr/login");
return filterRegisterationBean;
}
}
