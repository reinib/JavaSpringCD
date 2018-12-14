package com.codingdojo.DojoAndNinjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.DojoAndNinjas.models.Dojo;
import com.codingdojo.DojoAndNinjas.models.Ninja;
import com.codingdojo.DojoAndNinjas.services.HomeService;

@Controller
public class HomeController {
	private HomeService homeService;
	
	public HomeController(HomeService homeService) {
		this.homeService = homeService;
	}
	@RequestMapping("/dojos/new")
	public String newDojo(@ModelAttribute("dojo")Dojo dojo) {
		return "dojo.jsp";
	}
    @RequestMapping(value="/create/dojo", method=RequestMethod.POST)
    public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
        if (result.hasErrors()) {
            return "dojo.jsp";
        } else {
        	homeService.createDojo(dojo);
            return "redirect:/dojos/new";
        }
    }
    @RequestMapping("/ninjas/new")
    public String newNinja(Model model, @ModelAttribute("ninja") Ninja ninja) {
		List<Dojo> dojos = homeService.allDojos();
		model.addAttribute("dojos", dojos);
    	return "ninja.jsp";
    }
    @RequestMapping(value="/create/ninja", method=RequestMethod.POST)
    public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
        if (result.hasErrors()) {
            return "ninja.jsp";
        } else {
        	homeService.createNinja(ninja);
            return "redirect:/ninjas/new";
        }
    }
    @RequestMapping("/dojos/{id}")
    public String show(Model model, @PathVariable("id")Long id) {
    	Dojo dojo = homeService.findDojo(id);
    	model.addAttribute("dojo", dojo);
    	model.addAttribute("ninjas", dojo.getNinjas());
    	return "show.jsp";
    }
}
