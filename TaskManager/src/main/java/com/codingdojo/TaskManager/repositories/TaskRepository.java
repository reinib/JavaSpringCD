package com.codingdojo.TaskManager.repositories;



import org.springframework.data.repository.CrudRepository;

import com.codingdojo.TaskManager.models.Task;

public interface TaskRepository extends CrudRepository<Task, Long>{
	
}
