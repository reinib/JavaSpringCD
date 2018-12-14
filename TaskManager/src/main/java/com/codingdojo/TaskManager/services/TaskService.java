package com.codingdojo.TaskManager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.TaskManager.models.Task;
import com.codingdojo.TaskManager.repositories.TaskRepository;


@Service
public class TaskService {
	private final TaskRepository taskRepo;
	
	public TaskService(TaskRepository taskRepo) {
		this.taskRepo = taskRepo;
	}
	public Task createTask(Task task) {
		return taskRepo.save(task);
	}
    public Task findTaskById(Long id) {
    	Optional<Task> t = taskRepo.findById(id);
    	
    	if(t.isPresent()) {
            return t.get();
    	} else {
    	    return null;
    	}
    }
    public List<Task> findAllTasks(){
    	return (List<Task>) this.taskRepo.findAll();
    }
    public void updateTask(Task task) {
    	taskRepo.save(task);
    }
    public void delete(Long id) {
    	taskRepo.deleteById(id);
    }
}
