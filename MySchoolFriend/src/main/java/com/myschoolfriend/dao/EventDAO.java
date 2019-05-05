package com.myschoolfriend.dao;

import java.util.List;

import com.myschoolfriend.model.Event;
import com.myschoolfriend.model.EventEntity;

public interface EventDAO {

	public List<EventEntity> findAll();

	public List<Event> findAllEvents();

	public Event find(int id);

	public void create(Event event);

	public void delete(Event event);

	public void update(Event event);

}
