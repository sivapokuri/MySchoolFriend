package com.myschoolfriend.dao;

import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.Student;

@Repository("msfStudentProfileDAO")
public class MSFStudentProfileDAOImpl extends AbstractDao<Integer, Student> implements MSFStudentProfileDao {

	@Override
	public Student getStudentProfile(String currentPrincipalName) {
		
		System.out.println("Search Text : " + currentPrincipalName);
		
		Student student = (Student) getByKey(Integer.parseInt(currentPrincipalName));

		/*Criteria crit = createEntityCriteria();
		
		Criterion cr1 = Restrictions.eq("id", Integer.parseInt(currentPrincipalName));
		//Criterion cr2 = Restrictions.eq("lastName", searchTxt);
		//crit.add(Restrictions.or(cr1, cr2));
		
		crit.add(cr1);
		Student student = (Student) crit.uniqueResult();

		System.out.println("Student details from DAO " + student);

		// System.out.println("Student ID " + student.getId());*/

		return student;
	}
	
	

}
