package com.myschoolfriend.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myschoolfriend.model.ClassName;
import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Subject;
import com.myschoolfriend.service.MSFSubjectService;
import com.myschoolfriend.service.UserService;

/**
 * 
 * @author pokuri
 *
 */
@Controller
@RequestMapping("/")
@SessionAttributes({ "classeslist" })
public class MSFSubjectController {

	@Autowired
	UserService userService;

	@Autowired
	MSFSubjectService msfSubjectService;

	/**
	 * This method will allow to present class adding page.
	 */
	@RequestMapping(value = { "/addsubject" }, method = RequestMethod.GET)
	public String getSubjectForm(ModelMap model) {

		Map<String, String> classNamesMap = new HashMap<String, String>();

		List<ClassName> listClassNames = userService.getClassNamesList();

		Iterator<ClassName> classeNames = listClassNames.iterator();

		while (classeNames.hasNext()) {

			ClassName classDet = classeNames.next();
			classNamesMap.put(classDet.getId().toString(), classDet.getName());
		}
		//
		System.out.println("Adding subject");

		model.addAttribute("addsubject", new Subject());

		model.addAttribute("classeslist", classNamesMap);

		return "addsubject";
	}

	/**
	 * This method will allow to present class adding page.
	 */
	@RequestMapping(value = { "/addsubject" }, method = RequestMethod.POST)
	public String addSubject(@Valid Subject subject, BindingResult result, ModelMap model) {

		System.out.println("About to add subject to class and related section");

		if (result.hasErrors()) {
			return "addsubject";
		}

		System.out.println("Add subject to section :  " + subject.getSubjectname());
		msfSubjectService.addSubject(subject);

		model.addAttribute("message", "Subject added successfully");

		model.addAttribute("addsubject", new Subject());

		return "addsubject";
	}

	@RequestMapping(value = "/findsecwithclass", method = RequestMethod.GET)
	public @ResponseBody Set<SectionName> citiesForState(
			@RequestParam(value = "classId", required = true) String classid) {
		System.out.println("finding sections for class " + classid);
		return msfSubjectService.findSectionsFromClass(classid);
	}

}
