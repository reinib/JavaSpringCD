package com.codingdojo.CoursePlatform.repositories;



import org.springframework.data.repository.CrudRepository;

import com.codingdojo.CoursePlatform.models.Course;

public interface CourseRepository extends CrudRepository<Course, Long>{
	
}
