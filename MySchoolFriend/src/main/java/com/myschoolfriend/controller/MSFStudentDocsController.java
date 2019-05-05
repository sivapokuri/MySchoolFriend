package com.myschoolfriend.controller;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.myschoolfriend.model.FileBucket;
import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.StudentDocuments;
import com.myschoolfriend.model.User;
import com.myschoolfriend.model.UserDocument;
import com.myschoolfriend.service.MSFStudentDocsService;
import com.myschoolfriend.service.StudentService;
import com.myschoolfriend.util.FileValidator;

@Controller
@RequestMapping("/")
public class MSFStudentDocsController {
	@Autowired
	StudentService msfStudentService;

	@Autowired
	MSFStudentDocsService msfStuDocsService;

	@Autowired
	FileValidator fileValidator;

	@InitBinder("fileBucket")
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(fileValidator);
	}

	@RequestMapping(value = { "/upload-studoc-{id}" }, method = RequestMethod.GET)
	public String addDocuments(@Valid FileBucket fileBucket, BindingResult result, @PathVariable int id,
			ModelMap model) {
		Student student = msfStudentService.getStudentProfile(Integer.toString(id));
		model.addAttribute("student", student);

		model.addAttribute("fileBucket", new FileBucket());

		List<StudentDocuments> sDocuments = msfStuDocsService.findAllDocsById(id);
		model.addAttribute("documents", sDocuments);

		/*
		 * try { saveDocument(fileBucket, student); } catch (IOException e) { //
		 * TODO Auto-generated catch block e.printStackTrace(); }
		 */

		return "managestudentdocs";
	}

	@RequestMapping(value = { "/upload-studoc-{id}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model,
			@PathVariable int id) throws IOException {

		if (result.hasErrors()) {
			System.out.println("validation errors");
			Student student = msfStudentService.getStudentProfile(Integer.toString(id));
			model.addAttribute("student", student);

			List<StudentDocuments> sDocuments = msfStuDocsService.findAllDocsById(id);
			model.addAttribute("documents", sDocuments);

			return "managestudentdocs";
		} else {

			System.out.println("Fetching file");

			Student student = msfStudentService.getStudentProfile(Integer.toString(id));
			model.addAttribute("student", student);

			saveDocument(fileBucket, student);

			return "redirect:/upload-studoc-" + id;
		}
	}

	private void saveDocument(FileBucket fileBucket, Student student) throws IOException {

		StudentDocuments sDocument = new StudentDocuments();

		MultipartFile multipartFile = fileBucket.getFile();

		System.out.println("File Name :: " + multipartFile.getOriginalFilename());

		sDocument.setName(multipartFile.getOriginalFilename());
		sDocument.setDescription(fileBucket.getDescription());
		sDocument.setType(multipartFile.getContentType());
		sDocument.setContent(multipartFile.getBytes());
		sDocument.setUserid(student.getId());
		msfStuDocsService.saveDocument(sDocument);
	}
}
