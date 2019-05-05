package com.myschoolfriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myschoolfriend.model.ClassName;

@Controller
public class MSFExamResultsController {
	

	/**
	 * This method will allow to present class adding page.
	 */
	@RequestMapping(value = { "/submitexamresults" }, method = RequestMethod.GET)
	public String submitExamResults(ModelMap model) {
		
		

		model.addAttribute("submitexamresults", new ClassName());

		System.out.println("Adding class");
		return "addclass";
	}


}
