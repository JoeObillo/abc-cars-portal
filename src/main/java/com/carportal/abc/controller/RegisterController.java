package com.carportal.abc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carportal.abc.dao.User;
import com.carportal.abc.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
//    @RequestMapping(value = "/register")
//	public String showForm (Model model) {
//		
//    	User user = new User();
//		model.addAttribute(user);
//		return "registrationForm";
//	}
    
    @GetMapping("/registration")
    public String showRegistrationForm(@ModelAttribute("user") User user) {
    	return "registrationForm";
    }
    
    @PostMapping("/register")
    public String registerNewUser(@ModelAttribute("user") User user, Model model) {
    	
    	userService.save(user);
    	
    	String success_register = "Registeration Successful! ";
    	model.addAttribute("success_register", success_register);
    	
    	return "registrationForm";
    }

}
