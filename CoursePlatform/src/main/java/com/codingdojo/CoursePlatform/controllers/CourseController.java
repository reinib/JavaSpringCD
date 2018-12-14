package com.codingdojo.CoursePlatform.controllers;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.CoursePlatform.models.Course;
import com.codingdojo.CoursePlatform.models.User;
import com.codingdojo.CoursePlatform.services.CourseService;
import com.codingdojo.CoursePlatform.services.HomeService;


@Controller
public class CourseController {
    private final HomeService homeService;
    private final CourseService courseService;
    
    public CourseController(HomeService homeService, CourseService courseService) {
        this.homeService = homeService;
        this.courseService = courseService;
    }
    
	@RequestMapping("/dashboard")
	public String index(HttpSession session, Model model, @ModelAttribute("course")Course course) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		else {
			Long userId = (Long) session.getAttribute("userId");
		   	User user = homeService.findUserById(userId);
	    	model.addAttribute("user", user);
			List<Course> courses = courseService.findAllCourses();
			model.addAttribute("courses", courses);
			return "course.jsp";	
		}
	}
	
	@RequestMapping("/courses/new")
	public String newCourse(Model model, @ModelAttribute("course") Course course) {
		return "new.jsp";
	}
	
    @RequestMapping(value="/dashboard", method=RequestMethod.POST)
    public String create(Model model, HttpSession session, @Valid @ModelAttribute("course") Course course, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
    	   	courseService.createCourse(course);
            return "redirect:/dashboard";
        }
    }
    @RequestMapping("/courses/{id}/join")
    public String join(@PathVariable("id") Long id, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	Course course = courseService.findCourseById(id);
    	List<User> joining = course.getUsers();
        joining.add(user);
        course.setUsers(joining);
        homeService.update(user);
    	return "redirect:/dashboard";
    }
    @RequestMapping("/courses/{id}/leave")
    public String bail(@PathVariable("id") Long id, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	Course course = courseService.findCourseById(id);
    	List<User> joining = course.getUsers();
        for(int i=0; i<joining.size(); i++) {
            if(joining.get(i).getId() == user.getId()) {
            	joining.remove(i);
            }
        }
        course.setUsers(joining);
        homeService.update(user);
    	return "redirect:/dashboard";
    }
    
    @RequestMapping("/courses/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("course") Course course) {
    	Course courseToEdit = courseService.findCourseById(id);
        model.addAttribute("editCourse", courseToEdit);
        return "edit.jsp";
    }
    @RequestMapping(value="/editCourse/{id}", method=RequestMethod.POST)
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("editCourse") Course editCourse, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
    	   	editCourse.setId(id);
        	courseService.updateCourse(editCourse);
            return "redirect:/dashboard";
        }
    }
    @RequestMapping("/courses/{id}")
    public String show(HttpSession session, Model model, @PathVariable("id") Long id) {
    	Course course = courseService.findCourseById(id);
        model.addAttribute("course", course);
        List<User> students = course.getUsers();
        model.addAttribute("students", students);
        model.addAttribute("date", new Date());
        Long userId = (Long) session.getAttribute("userId");
	   	User user = homeService.findUserById(userId);
    	model.addAttribute("user", user);
        return "show.jsp";
    }
        
    @RequestMapping("/courses/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
    	courseService.delete(id);
    	return "redirect:/dashboard";
    }
}
