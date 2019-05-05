package com.myschoolfriend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myschoolfriend.dao.MSFStudentProfileDao;
import com.myschoolfriend.model.Student;

@Service("msfStudentService")
@Transactional
public class StudentServiceImpl implements StudentService {

	@Autowired
	private MSFStudentProfileDao msfStudentProfileDAO;

	@Override
	public Student getStudentProfile(String currentPrincipalName) {

		Student student = msfStudentProfileDAO.getStudentProfile(currentPrincipalName);
		return student;
	}

	@Override
	public void updateStudentProfile(Student student) {
		System.out.println("User ID about to update :: " + student.getId());
		Student entity = msfStudentProfileDAO.getStudentProfile(student.getId().toString());
		if (entity != null) {
			entity.setEmail(student.getEmail());
			entity.setLastName(student.getLastName());
			entity.setEmail(student.getEmail());
		}

	}

}
