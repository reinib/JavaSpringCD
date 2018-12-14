package com.codingdojo.EventsBeltReviewer.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.codingdojo.EventsBeltReviewer.models.User;
import com.codingdojo.EventsBeltReviewer.repositories.MessageRepository;
import com.codingdojo.EventsBeltReviewer.repositories.UserRepository;



@Service
public class HomeService {
    private final UserRepository userRepo;
    private final MessageRepository messageRepo;
    
    public HomeService(UserRepository userRepo, MessageRepository messageRepo) {
        this.userRepo = userRepo;
        this.messageRepo = messageRepo;
    }
    
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    // find user by email
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    public void update(User user) {
    	userRepo.save(user);
    }
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    public List<User> allUsers(){
    	return (List<User>) userRepo.findAll();
    }
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
    
}
