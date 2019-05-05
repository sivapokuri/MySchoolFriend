package com.myschoolfriend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myschoolfriend.dao.EventDAO;
import com.myschoolfriend.model.Event;
import com.myschoolfriend.model.EventEntity;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	@Override
	public List<EventEntity> findAll() {
		return eventDAO.findAll();
	}

	@Override
	public void create(Event event) {
		eventDAO.create(event);
	}

	@Override
	public List<Event> findAllEvents() {
		return eventDAO.findAllEvents();
	}

	@Override
	public Event find(int id) {
		return eventDAO.find(id);
	}

	@Override
	public void delete(Event event) {
		eventDAO.delete(event);
	}

	@Override
	public void update(Event event) {
		eventDAO.update(event);
	}

}
