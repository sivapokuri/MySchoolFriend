package com.myschoolfriend.service;

import java.util.List;

import com.myschoolfriend.model.Event;
import com.myschoolfriend.model.EventEntity;

public interface EventService {
	
	public List<EventEntity> findAll();
	
	public List<Event> findAllEvents();
	
	public void create(Event event);
	
	public Event find(int id);
	
	public void delete(Event event);
	
	public void update(Event event);

}
