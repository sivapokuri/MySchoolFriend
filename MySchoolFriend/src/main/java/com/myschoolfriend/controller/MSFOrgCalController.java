package com.myschoolfriend.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myschoolfriend.model.Event;
import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.service.EventService;

@Controller
public class MSFOrgCalController {

	@Autowired
	private EventService eventService;

	@RequestMapping(value = "eventlist", method = RequestMethod.GET)
	public String list(ModelMap modelMap) {
		modelMap.put("events", eventService.findAllEvents());
		return "event/list";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		eventService.delete(eventService.find(id));
		return "redirect:../list.html";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("event", eventService.find(id));
		return "event/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("event") Event event, HttpServletRequest request, ModelMap modelMap) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			Event currentEvent = eventService.find(event.getId());
			currentEvent.setDescription(event.getDescription());
			currentEvent.setStartDate(simpleDateFormat.parse(request.getParameter("startDate")));
			currentEvent.setEndDate(simpleDateFormat.parse(request.getParameter("endDate")));
			currentEvent.setName(event.getName());
			eventService.update(currentEvent);
			return "redirect:../event.html";
		} catch (Exception e) {
			modelMap.put("event", event);
			return "event/index";
		}
	}

	@RequestMapping(value = "addcalevent", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("event", new Event());
		return "addcalevent";
	}

	@RequestMapping(value = "addcalevent", method = RequestMethod.POST)
	public String add(@ModelAttribute("event") Event event, HttpServletRequest request, ModelMap modelMap) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			event.setStartDate(simpleDateFormat.parse(request.getParameter("startDate")));
			event.setEndDate(simpleDateFormat.parse(request.getParameter("endDate")));
			eventService.create(event);
			
			modelMap.addAttribute("message", "Event added successfully");

			modelMap.addAttribute("event", new Event());
			return "addcalevent";
		} catch (Exception e) {
			modelMap.put("event", event);
			return "calendar";
		}
	}

}
