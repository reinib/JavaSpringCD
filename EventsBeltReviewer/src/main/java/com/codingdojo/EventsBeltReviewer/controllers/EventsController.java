package com.codingdojo.EventsBeltReviewer.controllers;

import java.util.ArrayList;
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

import com.codingdojo.EventsBeltReviewer.models.Event;
import com.codingdojo.EventsBeltReviewer.models.Message;
import com.codingdojo.EventsBeltReviewer.models.User;
import com.codingdojo.EventsBeltReviewer.services.EventService;
import com.codingdojo.EventsBeltReviewer.services.HomeService;
import com.codingdojo.EventsBeltReviewer.services.MessageService;

@Controller
public class EventsController {
    private final HomeService homeService;
    private final EventService eventService;
    private final MessageService messageService;
    
    public EventsController(HomeService homeService, EventService eventService, MessageService messageService) {
        this.homeService = homeService;
        this.eventService = eventService;
        this.messageService = messageService;
    }
    
    @RequestMapping("/events")
    public String home(HttpSession session, Model model, @Valid @ModelAttribute("event") Event event) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	model.addAttribute("user", user);
        List<Event> events = eventService.findAllEvents();
        List<Event> inState = new ArrayList<Event>();
        List<Event> outState = new ArrayList<Event>();
        model.addAttribute("today", new Date());
        for(Event gathering: events) {
        	if(gathering.getState().equals(user.getState())) {
        		inState.add(gathering);
        	}
        	else {
        		outState.add(gathering);
        	}
        }
        model.addAttribute("inState", inState);
        model.addAttribute("outState", outState);
        return "events.jsp";
    } 
    
    @RequestMapping(value="/event/create",  method=RequestMethod.POST)
    public String createEvent(HttpSession session,@Valid @ModelAttribute("event") Event event, Model model, BindingResult result) {
        if(result.hasErrors()) {
        	
            return "events.jsp";
        }
        else {
        	Date today = new Date();
        	if(event.getDate() == null || event.getDate().before(today)) {
        		event.setDate(today);
        	}
        	Long userId = (Long) session.getAttribute("userId");
        	User user = homeService.findUserById(userId);
        	model.addAttribute("user", user);
            event.setCreator(user);
            List<User> joining = new ArrayList<User>();
            joining.add(user);
            event.setAttendingUsers(joining);
            eventService.create(event);
            return "redirect:/events";
        }
    }
    @RequestMapping("/events/{id}/join")
    public String join(@PathVariable("id") Long id, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	Event event = eventService.findEventById(id);
    	List<User> joining = event.getAttendingUsers();
        joining.add(user);
        event.setAttendingUsers(joining);
        homeService.update(user);
    	return "redirect:/events";
    }
    @RequestMapping("/events/{id}/leave")
    public String bail(@PathVariable("id") Long id, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	Event event = eventService.findEventById(id);
    	List<User> joining = event.getAttendingUsers();
        for(int i=0; i<joining.size(); i++) {
            if(joining.get(i).getId() == user.getId()) {
            	joining.remove(i);
            }
        }
        event.setAttendingUsers(joining);
        homeService.update(user);
    	return "redirect:/events";
    }	
    @RequestMapping("/events/{id}")
    public String show(@PathVariable("id") Long id, HttpSession session, Model model, @Valid @ModelAttribute("msg") Message msg, BindingResult result) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	Event event = eventService.findEventById(id);
        model.addAttribute("event", event);
        model.addAttribute("user", user);
        model.addAttribute("users", event.getAttendingUsers());
        model.addAttribute("messages", event.getMessages());
        return "show.jsp";
    }
    @RequestMapping(value="/events/{id}/addmsg",  method=RequestMethod.POST)
    public String message(@PathVariable("id") Long id, @Valid @ModelAttribute("msg") Message msg, BindingResult result, HttpSession session, Model model) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
    	Event event = eventService.findEventById(id);
        model.addAttribute("event", event);
        model.addAttribute("user", user);
        model.addAttribute("users", event.getAttendingUsers());
        List<Message> messages = event.getMessages();
        model.addAttribute("messages", messages);
    	if(result.hasErrors()) {
    		System.out.println(result.getAllErrors());
            return "show.jsp";
        }
        else {
        	messageService.create(msg);
        	msg.setUser(user);
        	msg.setEvent(event);
            messageService.update(msg);
            messages.add(msg);
            event.setMessages(messages);
            user.setMessages(messages);
            return "redirect:/events/{id}";
        }
    }
    @RequestMapping("/events/{id}/edit")
    public String edit(@PathVariable("id") Long id, HttpSession session, Model model, @Valid @ModelAttribute("emptyevent") Event emptyevent, BindingResult result) {
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
        model.addAttribute("event", eventService.findEventById(id));
        model.addAttribute("user", user);
        return "edit.jsp";
    }
    @RequestMapping(value="/events/{id}/edit", method=RequestMethod.POST)
    public String update(Model model, @PathVariable("id") Long id, @Valid @ModelAttribute("emptyevent") Event emptyevent, BindingResult result, HttpSession session) {
//    	model.addAttribute("states", states);
    	Event event = eventService.findEventById(id);
    	Long userId = (Long) session.getAttribute("userId");
    	User user = homeService.findUserById(userId);
        model.addAttribute("event", event);
        model.addAttribute("user", user);
    	if(result.hasErrors()) {
    		return "edit.jsp";
        }
        else {
            emptyevent.setCreator(event.getCreator());
            emptyevent.setAttendingUsers(event.getAttendingUsers());
            emptyevent.setCreatedAt(event.getCreatedAt());
            if(emptyevent.getDate() == null) {
            	emptyevent.setDate(event.getDate());
            }
            eventService.update(emptyevent);
            return "redirect:/events";
        }
    }
    @RequestMapping("/events/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
    	Event event = eventService.findEventById(id);
    	for(User user: event.getAttendingUsers()) {
    		List<Event> myevents= user.getEvents();
    		myevents.remove(event);
    		user.setEvents(myevents);
    		homeService.update(user);
    	}
    	for(Message message: messageService.findAllMessage()) {
    		if(message.getEvent() == event) {
    			messageService.delete(message.getId());
    		}
    	}
    	eventService.delete(id);
    	return "redirect:/events";
    }

}
