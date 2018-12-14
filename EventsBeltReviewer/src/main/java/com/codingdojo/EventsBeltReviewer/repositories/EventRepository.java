package com.codingdojo.EventsBeltReviewer.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.EventsBeltReviewer.models.Event;

@Repository
public interface EventRepository extends CrudRepository<Event, Long>{
    Event findByName(String name);
}
