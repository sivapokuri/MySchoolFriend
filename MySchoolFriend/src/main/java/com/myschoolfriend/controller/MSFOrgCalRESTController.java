package com.myschoolfriend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.myschoolfriend.service.EventService;

@Controller
@RequestMapping("/")
public class MSFOrgCalRESTController {

	@Autowired
	private EventService eventService;

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/orgcal" }, method = RequestMethod.GET)
	public String newUser() {

		return "calendar";
	}

	@RequestMapping(value = {"/findall"}, method = RequestMethod.GET)
	@ResponseBody
	public String findall() {
		Gson gson = new Gson();
		return gson.toJson(eventService.findAll());
	}

}
