package com.myschoolfriend.dao;

import java.util.List;
import java.util.Map;

import com.myschoolfriend.model.SchoolBranches;
import com.myschoolfriend.model.Student;

public interface StudentDAO {

	Student findById(int id);

	Student findBySSO(String sso);

	void save(Student user);

	void deleteBySSO(String sso);

	List<Student> findAllUsers();
	
	void saveStudent(Student student);
	
	List<Student> findStudent(String searchTxt);

	List<SchoolBranches> getBraches();
}
