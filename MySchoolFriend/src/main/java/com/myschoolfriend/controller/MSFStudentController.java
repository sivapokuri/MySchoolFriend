package com.myschoolfriend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myschoolfriend.model.Student;
import com.myschoolfriend.service.StudentService;

@Controller
@RequestMapping("/")
@SessionAttributes({ "student", "edit" })
public class MSFStudentController {

	@Autowired
	StudentService msfStudentService;

	/**
	 * This method will get the existing student details.
	 */
	@RequestMapping(value = { "/studentportal" }, method = RequestMethod.GET)
	public String searchStudent() {

		System.out.println("About to launch student portal");
		return "studentportal";
	}

	/**
	 * This method will get the existing student details.
	 */
	@RequestMapping(value = { "/studenteditprofile" }, method = RequestMethod.GET)
	public String editStudentProfile(ModelMap model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		System.out.println("currently authenticated user :: " + currentPrincipalName);

		Student student = msfStudentService.getStudentProfile(currentPrincipalName);

		System.out.println("About to launch edit student profile page with user details for " + student.getEmail());

		model.addAttribute("student", student);
		model.addAttribute("edit", true);

		return "studentprofileedit";
	}

	@RequestMapping(value = { "/studenteditprofile" }, method = RequestMethod.POST)
	public String updateStudentProfile(@Valid Student student, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "studentprofileedit";
		}

		msfStudentService.updateStudentProfile(student);

		System.out.println("Profile update successfully");

		model.addAttribute("success",
				"User " + student.getFirstName() + " " + student.getLastName() + " profile updated successfully");

		// model.addAttribute("student", student);

		return "studentprofileedit";
	}
}
