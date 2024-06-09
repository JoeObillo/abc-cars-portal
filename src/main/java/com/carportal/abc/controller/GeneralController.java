package com.carportal.abc.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carportal.abc.dao.Car;
import com.carportal.abc.dao.CarBidding;
import com.carportal.abc.dao.User;
import com.carportal.abc.service.CarService;
import com.carportal.abc.service.UserService;

@Controller
public class GeneralController {

	@Autowired
	UserService userService;
	
	@Autowired
	CarService carService;
	
    @GetMapping("/home")
	public String home () {
		return "home";
	}
    
	@GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("user",new User());
        return "login";
    }

	@GetMapping("/login_error")
    public String onLoginError(Model model) {
        String error_msg = "Incorrect user or password. Please re-enter.";
        model.addAttribute("error_string", error_msg);
        return "login";
	}
	
	@GetMapping("profile")
    public String showProfile(Model model, Principal principal) {
    	
    	//Get User name
    	String uname = principal.getName();
    	System.out.println(uname);
    	
    	User userdata = userService.findLoginUser(uname);
    	
    	long uid = userdata.getId();
    	
    	List<User> user = new ArrayList<User>();
    	
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	return "profile";
    }
	
	@GetMapping("users")
    public ModelAndView showAllUser() {
    	
    	List<User> user = userService.showAllUser();
    	
    	return new ModelAndView ("viewUsers", "user", user);
    }
	
	@PostMapping("update")
    public String updateUser(Principal principal, 
    		@ModelAttribute("user") User u) {
    	
    	//Get User name
    	String username = principal.getName();
    	
    	User user = userService.findLoginUser(username);
    	user.setFirstName(u.getFirstName());
    	user.setLastName(u.getLastName());
    	user.setUserName(u.getUserName());
    	user.setPhoneNumber(u.getPhoneNumber());
    	
    	userService.update(user);
    	System.out.println("Update User Successful");
    	System.out.println(user);
    	
    	return "redirect:profile";
    }
	
	
	@GetMapping("view")
    public String userProfile(@RequestParam long uid, Model model) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User userdata = user_info.get();
    	
    	List<User> user = new ArrayList<User>();
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	return "profile";	
    }
	
	@GetMapping("delete")
    public String deleteUser(@RequestParam long uid) {
    	
    	userService.deleteUser(uid);
    	
    	return "redirect:users";
    }
	
	@PostMapping("edit")
    public String editUser(@RequestParam long uid,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    	
    	user.setFirstName(u.getFirstName());
    	user.setLastName(u.getLastName());
    	user.setUserName(u.getUserName());
    	user.setPhoneNumber(u.getPhoneNumber());
    	
    	userService.update(user);
    	System.out.println("Edit User Successful");
    	System.out.println(user);
    	
    	return "redirect:users";
    }
	
	@PostMapping("assign_role")
    public String assignRole(@RequestParam long uid,
    		@RequestParam("name") String role,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    
    	userService.assignNewRole(user, role);
    	System.out.println(user);
    	 return "redirect:users";
    }





    
}
