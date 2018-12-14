package com.codingdojo.EventsBeltReviewer.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.EventsBeltReviewer.models.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message, Long>{

}
