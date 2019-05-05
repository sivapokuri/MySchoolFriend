package com.myschoolfriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MSFTeacherController {
	
	/**
	 * This method will get the existing student details.
	 */
	@RequestMapping(value = { "/teacherportal" }, method = RequestMethod.GET)
	public String searchStudent() {

		System.out.println("About to launch teacher portal");
		return "teacherportal";
	}

}
