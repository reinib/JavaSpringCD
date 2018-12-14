package com.codingdojo.EventsBeltReviewer.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.EventsBeltReviewer.models.Message;
import com.codingdojo.EventsBeltReviewer.repositories.MessageRepository;



@Service
public class MessageService {
	private final MessageRepository messageRepo;
	
	public MessageService(MessageRepository messageRepo) {
		this.messageRepo = messageRepo;
	}
	public void create(Message message) {
		messageRepo.save(message);
	}
    public Message findMessageById(Long id) {
    	Optional<Message> m = messageRepo.findById(id);
    	
    	if(m.isPresent()) {
            return m.get();
    	} else {
    	    return null;
    	}
    }
    public List<Message> findAllMessage(){
    	return (List<Message>) this.messageRepo.findAll();
    }
    public void update(Message message) {
    	messageRepo.save(message);
    }
    public void delete(Long id) {
    	messageRepo.deleteById(id);
    }
}
