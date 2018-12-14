package com.codingdojo.EventsBeltReviewer.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.EventsBeltReviewer.models.Event;
import com.codingdojo.EventsBeltReviewer.repositories.EventRepository;

@Service
public class EventService {
	private final EventRepository eventRepo;
	
	public EventService(EventRepository eventRepo) {
		this.eventRepo = eventRepo;
	}
	public void create(Event event) {
		eventRepo.save(event);
	}
    public Event findEventById(Long id) {
    	Optional<Event> e = eventRepo.findById(id);
    	
    	if(e.isPresent()) {
            return e.get();
    	} else {
    	    return null;
    	}
    }
    public List<Event> findAllEvents(){
    	return (List<Event>) this.eventRepo.findAll();
    }
    public void update(Event event) {
    	eventRepo.save(event);
    }
    public void delete(Long id) {
    	eventRepo.deleteById(id);
    }
}
