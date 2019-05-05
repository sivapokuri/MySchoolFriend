package com.myschoolfriend.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.myschoolfriend.model.ClassName;
import com.myschoolfriend.model.FileBucket;
import com.myschoolfriend.model.Qualification;
import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Staff;
import com.myschoolfriend.model.StaffTypes;
import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.StudentSearch;
import com.myschoolfriend.model.User;
import com.myschoolfriend.model.UserDocument;
import com.myschoolfriend.service.MailService;
import com.myschoolfriend.service.UserDocumentService;
import com.myschoolfriend.service.UserService;
import com.myschoolfriend.util.FileValidator;

@Controller
@RequestMapping("/")
@SessionAttributes({ "stafftypes", "qualification", "classeslist" })
public class AppController {

	@Autowired
	UserService userService;

	@Autowired
	UserDocumentService userDocumentService;

	@Autowired
	MessageSource messageSource;

	@Autowired
	FileValidator fileValidator;
	
	@Autowired
    MailService mailService;

	@InitBinder("fileBucket")
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(fileValidator);
	}

	/**
	 * This method will get the existing student details.
	 */
	@RequestMapping(value = { "/preparequestionpaper" }, method = RequestMethod.GET)
	public String prepareQuestionPaper(Model model) {

		System.out.println("Going to prepare question paper");
		return "PrepareQuestionPaper";
	}

	/**
	 * This method will get the existing student details.
	 */
	@RequestMapping(value = { "/searchstudent" }, method = RequestMethod.POST)
	public String searchStudentByID(@Valid StudentSearch studentsearch, ModelMap model) {

		System.out.println("ID to search in database :: " + studentsearch.getSearchTxt());
		List<Student> student = userService.findStudent(studentsearch.getSearchTxt());
		// if (null != student)
		// System.out.println("Search details from database : " +
		// student.getEmail());
		model.addAttribute("student", student);
		return "SearchStudent";
	}

	/**
	 * This method will get the existing student details.
	 */
	@RequestMapping(value = { "/searchstudent" }, method = RequestMethod.GET)
	public String searchStudent(ModelMap model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		
		System.out.println("currently authenticated user :: " + currentPrincipalName);

		System.out.println("search the student");
		return "SearchStudent";
	}

	/**
	 * This method will allow to present class adding page.
	 */
	@RequestMapping(value = { "/addclass" }, method = RequestMethod.GET)
	public String addClass(ModelMap model) {

		model.addAttribute("addclass", new ClassName());

		System.out.println("Adding class");
		return "addclass";
	}

	/**
	 * This method will allow to present class adding page.
	 */
	@RequestMapping(value = { "/addclass" }, method = RequestMethod.POST)
	public String addClass(@Valid ClassName cName, BindingResult result, ModelMap model) {

		System.out.println("Got details from admin to register new class");

		if (result.hasErrors()) {
			return "addclass";
		}

		System.out.println("class name to add :: " + cName.getName());

		userService.addClassName(cName);
		model.addAttribute("message", "Class added successfully");

		model.addAttribute("addclass", new ClassName());
		return "addclass";
	}

	/**
	 * This method will allow to present section adding page.
	 */
	@RequestMapping(value = { "/addsection" }, method = RequestMethod.GET)
	public String addSection(Model model) {

		//
		// Add the pre-populate classes in add section form.

		Map<String, String> classNamesMap = new HashMap<String, String>();

		List<ClassName> listClassNames = userService.getClassNamesList();

		Iterator<ClassName> classeNames = listClassNames.iterator();

		while (classeNames.hasNext()) {

			ClassName classDet = classeNames.next();
			classNamesMap.put(classDet.getId().toString(), classDet.getName());
		}
		//
		System.out.println("Adding section");

		model.addAttribute("addsection", new SectionName());

		model.addAttribute("classeslist", classNamesMap);

		return "addsection";
	}

	/**
	 * This method will allow to present section adding page.
	 */
	@RequestMapping(value = { "/addsection" }, method = RequestMethod.POST)
	public String addSection(@Valid SectionName sName, BindingResult result, ModelMap model) {

		System.out.println("Got details from admin to register new section");

		if (result.hasErrors()) {
			return "addsection";
		}
		
		//mailService.sendEmail();
		
		System.out.println("Message sent successfully");

		System.out.println("Section to add :: " + sName.getSectionname());

		userService.addSectionName(sName);
		model.addAttribute("message", "Section added successfully");

		model.addAttribute("addsection", new SectionName());
		return "addsection";
	}

	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {

		System.out.println("In list ");
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "userslist";
	}

	/**
	 * This method will list all existing users.
	 */
	@RequestMapping(value = { "/","/administrator" }, method = RequestMethod.GET)
	public String administratorconsole(ModelMap model) {

		System.out.println("In list ");
		return "Management";
	}
	
	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		return "registration";
	}

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/student" }, method = RequestMethod.GET)
	public String newStudent(ModelMap model) {

		// List<SchoolBranches> branches = userService.getBranches();

		model.addAttribute("student", new Student());

		System.out.println("About to get the branches");

		return "student";
	}

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/student" }, method = RequestMethod.POST)
	public String newStudentRegistration(@Valid Student student, BindingResult result, ModelMap model) {

		System.out.println("In POST to create student");

		if (result.hasErrors()) {
			return "student";
		}

		System.out.println("Email opt details  :: " + student.isOptemailcomm());

		userService.saveStudent(student);
		System.out.println("ID generated for user  :: " + student.getId());
		model.addAttribute("student", student);
		return "studentonboardsuccess";
	}

	/**
	 * This method will provide the medium to add a new staff member.
	 */
	@RequestMapping(value = { "/staffonboard" }, method = RequestMethod.GET)
	public String newStaffOnboard(Model model) {

		// List<SchoolBranches> branches = userService.getBranches();
		Map<String, String> stafftypes = new HashMap<String, String>();
		Map<String, String> qualifications = new HashMap<String, String>();

		List<StaffTypes> stafftypesfrmdb = userService.getStaffTypesList();

		List<Qualification> qualification = userService.getQualificationsList();

		Iterator<Qualification> qual = qualification.iterator();

		// System.out.println("Count of the Staff types " + stafftypes.size());

		while (qual.hasNext()) {

			Qualification qualification2 = qual.next();
			qualifications.put(qualification2.getQualification(), qualification2.getQualification());
		}

		System.out.println("final count of Qualifications :: " + qualifications.size());

		System.out.println("count of the list " + stafftypesfrmdb.size());

		Iterator<StaffTypes> iterator = stafftypesfrmdb.iterator();

		// System.out.println("Count of the Staff types " + stafftypes.size());

		try {

			while (iterator.hasNext()) {

				StaffTypes sTypes = iterator.next();
				stafftypes.put(sTypes.getAbbrev(), sTypes.getName());
			}

			System.out.println("final count of stafftypes :: " + stafftypes.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("After staff type loaded");

		model.addAttribute("staff", new Staff());
		model.addAttribute("stafftypes", stafftypes);
		model.addAttribute("qualification", qualifications);

		System.out.println("About to redirect to Staff onboard page");

		// System.out.println("Count of branches" + branches.size());
		// Student student = new Student();
		// model.addAttribute("user", student);
		// model.addAttribute("edit", false);
		return "staffonboard";
	}

	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/staffonboard" }, method = RequestMethod.POST)
	public String newStaffOnboard(@Valid Staff staff, BindingResult result, ModelMap model) {

		// List<SchoolBranches> branches = userService.getBranches();

		if (result.hasErrors()) {
			return "staffonboard";
		}

		System.out.println("Qualification details  :: " + staff.getQualification());

		userService.saveStaff(staff);

		model.addAttribute("staff", staff);

		// System.out.println("Count of branches" + branches.size());
		// Student student = new Student();
		// model.addAttribute("user", student);
		// model.addAttribute("edit", false);
		return "staffonboardsuccess";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be
		 * implementing custom @Unique annotation and applying it on field [sso]
		 * of Model class [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you
		 * can fill custom errors outside the validation framework as well while
		 * still using internationalized messages.
		 * 
		 */
		if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
			FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId",
					new String[] { user.getSsoId() }, Locale.getDefault()));
			result.addError(ssoError);
			return "registration";
		}

		userService.saveUser(user);

		model.addAttribute("user", user);
		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
		// return "success";
		return "registrationsuccess";
	}

	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		return "registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "registration";
		}

		userService.updateUser(user);

		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
		return "registrationsuccess";
	}

	/**
	 * This method will delete an user by it's SSOID value.
	 */
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/list";
	}

	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.GET)
	public String addDocuments(@PathVariable int userId, ModelMap model) {
		User user = userService.findById(userId);
		model.addAttribute("user", user);

		FileBucket fileModel = new FileBucket();
		model.addAttribute("fileBucket", fileModel);

		List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
		model.addAttribute("documents", documents);

		return "managedocuments";
	}

	@RequestMapping(value = { "/download-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int userId, @PathVariable int docId, HttpServletResponse response)
			throws IOException {
		UserDocument document = userDocumentService.findById(docId);
		response.setContentType(document.getType());
		response.setContentLength(document.getContent().length);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + document.getName() + "\"");

		FileCopyUtils.copy(document.getContent(), response.getOutputStream());

		return "redirect:/add-document-" + userId;
	}

	@RequestMapping(value = { "/delete-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int userId, @PathVariable int docId) {
		userDocumentService.deleteById(docId);
		return "redirect:/add-document-" + userId;
	}

	@RequestMapping(value = { "/add-document-{userId}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model,
			@PathVariable int userId) throws IOException {

		if (result.hasErrors()) {
			System.out.println("validation errors");
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
			model.addAttribute("documents", documents);

			return "managedocuments";
		} else {

			System.out.println("Fetching file");

			User user = userService.findById(userId);
			model.addAttribute("user", user);

			saveDocument(fileBucket, user);

			return "redirect:/add-document-" + userId;
		}
	}

	private void saveDocument(FileBucket fileBucket, User user) throws IOException {

		UserDocument document = new UserDocument();

		MultipartFile multipartFile = fileBucket.getFile();

		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setUser(user);
		userDocumentService.saveDocument(document);
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {

		// Code to read and display notice board START

		// Code to read and display notice board STOP
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
