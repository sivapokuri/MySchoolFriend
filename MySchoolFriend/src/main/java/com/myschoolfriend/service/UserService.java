package com.myschoolfriend.service;

import java.util.List;
import java.util.Map;

import com.myschoolfriend.model.ClassName;
import com.myschoolfriend.model.Qualification;
import com.myschoolfriend.model.SchoolBranches;
import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Staff;
import com.myschoolfriend.model.StaffTypes;
import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.User;


public interface UserService {
	
	User findById(int id);
	
	User findBySSO(String sso);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteUserBySSO(String sso);

	List<User> findAllUsers(); 
	
	boolean isUserSSOUnique(Integer id, String sso);

	User findStudentDetails(String sso);

	void saveStudent(Student student);

	List<Student> findStudent(String seatchTxt);

	List<SchoolBranches> getBranches();

	void saveStaff(Staff staff);

	List<StaffTypes> getStaffTypesList();

	List<Qualification> getQualificationsList();

	List<SchoolBranches> getSchoolBranches();

	void addClassName(ClassName cName);

	void addSectionName(SectionName sName);

	List<ClassName> getClassNamesList();


}