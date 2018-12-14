package com.codingdojo.CoursePlatform.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.CoursePlatform.models.Course;
import com.codingdojo.CoursePlatform.repositories.CourseRepository;


@Service
public class CourseService {
	private final CourseRepository courseRepo;
	
	public CourseService(CourseRepository courseRepo) {
		this.courseRepo = courseRepo;
	}
	public Course createCourse(Course course) {
		return courseRepo.save(course);
	}
    public Course findCourseById(Long id) {
    	Optional<Course> c = courseRepo.findById(id);
    	
    	if(c.isPresent()) {
            return c.get();
    	} else {
    	    return null;
    	}
    }
    public List<Course> findAllCourses(){
    	return (List<Course>) this.courseRepo.findAll();
    }
    public void updateCourse(Course course) {
    	courseRepo.save(course);
    }
    public void delete(Long id) {
    	courseRepo.deleteById(id);
    }
}
