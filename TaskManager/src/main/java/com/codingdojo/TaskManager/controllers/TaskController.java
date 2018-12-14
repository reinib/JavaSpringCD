package com.codingdojo.TaskManager.controllers;

import java.util.ArrayList;
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

import com.codingdojo.TaskManager.models.Task;
import com.codingdojo.TaskManager.models.User;
import com.codingdojo.TaskManager.services.HomeService;
import com.codingdojo.TaskManager.services.TaskService;

@Controller
public class TaskController {
    private final HomeService homeService;
    private final TaskService taskService;
    
    public TaskController(HomeService homeService, TaskService taskService) {
        this.homeService = homeService;
        this.taskService = taskService;
    }
    
	@RequestMapping("/dashboard")
	public String index(HttpSession session, Model model, @ModelAttribute("task")Task task) {
		Long userId = (Long) session.getAttribute("userId");
	   	User user = homeService.findUserById(userId);
    	model.addAttribute("user", user);
		List<Task> tasks = taskService.findAllTasks();
		model.addAttribute("tasks", tasks);
		return "task.jsp";
	}
	
	@RequestMapping("/tasks/new")
	public String newTask(Model model, @ModelAttribute("task") Task task) {
		List<User> users = homeService.allUsers();
		List<User> longUser = new ArrayList<User>();
		for(User dude: users) {
			if(dude.getAssigned().size() >= 3) {
				System.out.println(dude);
				longUser.add(dude);
			}
		}
		users.removeAll(longUser);
		model.addAttribute("workers", users);
		return "new.jsp";
	}
	
    @RequestMapping(value="/dashboard", method=RequestMethod.POST)
    public String create(Model model, HttpSession session, @Valid @ModelAttribute("task") Task task, BindingResult result) {
        if (result.hasErrors()) {
        	List<User> users = homeService.allUsers();
        	model.addAttribute("workers", users);
            return "new.jsp";
        } else {
    		Long userId = (Long) session.getAttribute("userId");
    	   	User user = homeService.findUserById(userId);
    	   	task.setCreator(user);
        	taskService.createTask(task);
            return "redirect:/dashboard";
        }
    }
    @RequestMapping("/tasks/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("task") Task task) {
    	Task taskToEdit = taskService.findTaskById(id);
        model.addAttribute("editTask", taskToEdit);
		List<User> users = homeService.allUsers();
		List<User> longUser = new ArrayList<User>();
		for(User dude: users) {
			if(dude.getAssigned().size() > 3) {
				longUser.add(dude);
			}
		}
		users.removeAll(longUser);
		model.addAttribute("workers", users);
        return "edit.jsp";
    }
    @RequestMapping(value="/editTask/{id}", method=RequestMethod.POST)
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("editTask") Task editTask, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
    	   	editTask.setId(id);
        	taskService.updateTask(editTask);
            return "redirect:/dashboard";
        }
    }
    @RequestMapping("/tasks/{id}")
    public String show(Model model, @PathVariable("id") Long id) {
        Task task = taskService.findTaskById(id);
        model.addAttribute("task", task);
        return "show.jsp";
    }
        
    @RequestMapping("/tasks/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
    	taskService.delete(id);
    	return "redirect:/dashboard";
    }
    @RequestMapping("/tasks/{id}/complete")
    public String complete(@PathVariable("id") Long id) {
    	taskService.delete(id);
    	return "redirect:/dashboard";
    }
}
