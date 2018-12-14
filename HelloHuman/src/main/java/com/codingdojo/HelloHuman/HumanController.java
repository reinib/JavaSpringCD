package com.codingdojo.HelloHuman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HumanController {
    @RequestMapping("/")
    public String index(@RequestParam(value="name", required=false) String searchQuery) {
    	if (searchQuery == null) {
    		return "<h1>Hello Human</h1><br><br><p>Welcome to SpringBoot!</p>";
    	}
    	else {
    		return "<h1>Hello " + searchQuery + "</h1><br><br><p>Welcome to SpringBoot!</p>";
    	}
    }
	
	
//	@RequestMapping("/")
//	public String human() {
//		return "<h1>Hello Human</h1><br><br><p>Welcome to SpringBoot!</p>";
//	}
}
