package com.codingdojo.CoursePlatform.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.CoursePlatform.models.User;
import com.codingdojo.CoursePlatform.services.HomeService;
import com.codingdojo.CoursePlatform.validator.UserValidator;




@Controller
public class HomeController {
    private final HomeService homeService;
    private final UserValidator userValidator;
    
    public HomeController(HomeService homeService, UserValidator userValidator) {
        this.homeService = homeService;
        this.userValidator = userValidator;
    }
    @RequestMapping("/")
    public String registerForm(@ModelAttribute("user") User user) {
        return "loginRegistration.jsp";
    }
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        // if result has errors, return the registration page (don't worry about validations just now)
    	userValidator.validate(user, result);
    	if(result.hasErrors()) {
    		return "loginRegistration.jsp";
    	}
        // else, save the user in the database, save the user id in session, and redirect them to the /home route
    	else {
    		User u = homeService.registerUser(user);
    		session.setAttribute("userId", u.getId());
    		return "redirect:/dashboard";
    	}
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@Valid @ModelAttribute("user") User loginUser, BindingResult result, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        // if the user is authenticated, save their user id in session
    	if(result.hasErrors()) {
    		return "loginRegistration.jsp";
    	}
    	boolean isAuthenticated = homeService.authenticateUser(email, password);
    	if(isAuthenticated) {
    		User user = homeService.findByEmail(email);
    		Long userId = user.getId();
    		session.setAttribute("userId", userId);
    		return "redirect:/dashboard";
    	}
        // else, add error messages and return the login page
    	else {
    		model.addAttribute("error", "Invalid Credentials. Please try again.");
    		return "loginRegistration.jsp";
    	}
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, @ModelAttribute("user") User user) {
        // invalidate session
    	session.invalidate();
        // redirect to login page
    	return "loginRegistration.jsp";
    }
}
