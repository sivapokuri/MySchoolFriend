package com.myschoolfriend.controller;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myschoolfriend.model.Question;
import com.myschoolfriend.model.QuestionsList;

@Controller
@RequestMapping("/")
public class MSFTQuestionPaperController {

	/**
	 * This method will get the existing student details.
	 *//*
		 * @RequestMapping(value = { "/preparequestionpaper" }, method =
		 * RequestMethod.GET) public String prepareQuestionPaper(ModelMap model)
		 * {
		 * 
		 * Authentication authentication =
		 * SecurityContextHolder.getContext().getAuthentication(); String
		 * currentPrincipalName = authentication.getName();
		 * System.out.println("currently authenticated user :: " +
		 * currentPrincipalName);
		 * 
		 * 
		 * //model.addAttribute("student", student);
		 * //model.addAttribute("edit", true);
		 * 
		 * return "studentprofileedit"; }
		 */

	@RequestMapping(value = { "/preparequespaper" }, method = RequestMethod.GET)
	public String loadQuesPaperPage(ModelMap map) {
		// for( Person p : personListContainer.getPersonList() ) {
		// System.out.println("Name: " + p.getName());
		// System.out.println("Age: " + p.getAge());
		// }

		// Add dummy question first
		Question ques = new Question();

		QuestionsList qList = new QuestionsList();

		List<Question> lQuestions = new LinkedList<Question>();

		qList.setlQuestions(lQuestions);

		ques.setQ("Question here");
		ques.setA("Option A");
		ques.setB("Option B");
		ques.setC("Option C");
		ques.setD("Option D");
		ques.setAns("Correct option");

		lQuestions.add(ques);

		qList.setlQuestions(lQuestions);

		System.out.print("Ready to load question paper page");
		map.addAttribute("preparequestionpaper", qList);
		System.out.print("welcome2");
		return "questionpaper";
	}

	@RequestMapping(value = { "/preparequespaper" }, method = RequestMethod.POST)
	public String saveQuestionPaper(@Valid QuestionsList questionList, BindingResult result, ModelMap map) {
		// for( Person p : personListContainer.getPersonList() ) {
		// System.out.println("Name: " + p.getName());
		// System.out.println("Age: " + p.getAge());
		// }

		System.out.println("Question list from the teacher  " + questionList.lQuestions.size());

		Iterator<Question> itr = questionList.lQuestions.iterator();

		while (itr.hasNext()) {
			Question que = itr.next();

			String question = que.getQ();
			String optionA = que.getA();
			String optionB = que.getB();
			String optionC = que.getC();
			String optionD = que.getD();
			String answer = que.getAns();

			System.out.println("Question :::" + question + "Options " + optionA + " " + optionB + " " + optionC + " "
					+ optionD + " " + answer);
		}

		// List<Question> queList = (List<Question>) questionList;

		// Add dummy question first
		Question ques = new Question();

		QuestionsList qList = new QuestionsList();

		List<Question> lQuestions = new LinkedList<Question>();

		qList.setlQuestions(lQuestions);

		/*
		 * ques.setQ("Question here"); ques.setA("Option A");
		 * ques.setB("Option B"); ques.setC("Option C"); ques.setD("Option D");
		 * ques.setAns("Correct option");
		 */

		lQuestions.add(ques);

		qList.setlQuestions(lQuestions);

		System.out.print("Ready to load question paper page");
		map.addAttribute("preparequestionpaper", qList);
		System.out.print("welcome2");
		return "questionpaper";
	}
}
