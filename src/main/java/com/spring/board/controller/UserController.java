package com.spring.board.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.HomeController;
import com.spring.board.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/user/register.do", method = RequestMethod.GET)
	public String userRegister(Model model) throws Exception{
		
		
		return "user/userRegister";
	}
	@RequestMapping(value = "/user/login.do", method = RequestMethod.GET)
	public String userLogin(Model model) throws Exception{
		
		
		return "user/userLogin";
	}
}
