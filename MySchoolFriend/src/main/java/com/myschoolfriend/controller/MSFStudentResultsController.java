package com.myschoolfriend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.myschoolfriend.model.ClassName;
import com.myschoolfriend.model.StuSubReportCard;
import com.myschoolfriend.model.StuSubReportCardForm;
import com.myschoolfriend.model.TGetStudentsList;
import com.myschoolfriend.service.UserService;

@Controller
@RequestMapping("/")
public class MSFStudentResultsController {

	@Autowired
	UserService userService;

	/**
	 * This method will allow to present class adding page.
	 */
	@RequestMapping(value = { "/tresults" }, method = RequestMethod.GET)
	public String updateStuResults(ModelMap model) {

		Map<String, String> classNamesMap = new HashMap<String, String>();

		List<ClassName> listClassNames = userService.getClassNamesList();

		Iterator<ClassName> classeNames = listClassNames.iterator();

		while (classeNames.hasNext()) {

			ClassName classDet = classeNames.next();
			classNamesMap.put(classDet.getId().toString(), classDet.getName());
		}

		System.out.println("Get Classes list");

		model.addAttribute("tgetstudentslist", new TGetStudentsList());

		model.addAttribute("classeslist", classNamesMap);

		return "updateresults";
	}

	@RequestMapping(value = "/tresults", method = RequestMethod.POST)
	public String getStudents(@Valid TGetStudentsList sSelection, BindingResult result, ModelMap model) {

		System.out.println("Getting the students to update their results for " + sSelection.getClassid() + " and"
				+ sSelection.getSectionid());

		List<StuSubReportCard> studentsReportList = new ArrayList<StuSubReportCard>();

		StuSubReportCard ssReportCard1 = new StuSubReportCard();
		StuSubReportCard ssReportCard2 = new StuSubReportCard();

		ssReportCard1.setStudentId("1");
		ssReportCard1.setSubjectName("English");
		ssReportCard1.setScore("80");

		ssReportCard2.setStudentId("2");
		ssReportCard2.setSubjectName("English");
		ssReportCard2.setScore("75");

		studentsReportList.add(ssReportCard1);
		studentsReportList.add(ssReportCard2);

		StuSubReportCardForm ssReportCardForm = new StuSubReportCardForm();

		ssReportCardForm.setStudentReports(studentsReportList);

		model.addAttribute("sectionid", sSelection.getSectionid());
		model.addAttribute("classid", sSelection.getClassid());

		model.addAttribute("ssReportCardForm", ssReportCardForm);

		return "updatestudentres";

	}

	@RequestMapping(value = "/updateresults", method = RequestMethod.POST)
	public String updateResults(@Valid StuSubReportCardForm stuSubReportCardForm, BindingResult result,
			ModelMap model) {

		List<StuSubReportCard> studentMarks = stuSubReportCardForm.getStudentReports();

		System.out.println("size" + studentMarks.size());

		Iterator<StuSubReportCard> litr = studentMarks.listIterator();
		System.out.println("Elements in forward directiton");
		while (litr.hasNext()) {
			StuSubReportCard studRep = litr.next();

			System.out.println(studRep.getSubjectName());
			System.out.println(studRep.getScore());
		}

		Map<String, String> classNamesMap = new HashMap<String, String>();

		List<ClassName> listClassNames = userService.getClassNamesList();

		Iterator<ClassName> classeNames = listClassNames.iterator();

		while (classeNames.hasNext()) {

			ClassName classDet = classeNames.next();
			classNamesMap.put(classDet.getId().toString(), classDet.getName());
		}

		System.out.println("Get Classes list");

		model.addAttribute("tgetstudentslist", new TGetStudentsList());

		model.addAttribute("classeslist", classNamesMap);

		model.addAttribute("updatestatus", "Results Uploaded successfully");

		return "updateresults";
	}

}
