package com.myschoolfriend.service;

import com.myschoolfriend.model.Student;

public interface StudentService {

	Student getStudentProfile(String currentPrincipalName);

	void updateStudentProfile(Student student);

}
