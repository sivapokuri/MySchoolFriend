package com.myschoolfriend.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.SchoolBranches;
import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.User;

@Repository("studentDao")
public class StudentDAOImpl extends AbstractDao<Integer, Student> implements StudentDAO {

	@Override
	public Student findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Student findBySSO(String sso) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(Student student) {

		persist(student);
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBySSO(String sso) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Student> findAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveStudent(Student student) {
		persist(student);
		// TODO Auto-generated method stub

	}

	@Override
	public List<Student> findStudent(String searchTxt) {
		System.out.println("Search Text : " + searchTxt);

		Criteria crit = createEntityCriteria();
		
		Criterion cr1 = Restrictions.eq("firstName", searchTxt);
		Criterion cr2 = Restrictions.eq("lastName", searchTxt);
		crit.add(Restrictions.or(cr1, cr2));
		List<Student> student = (List<Student>) crit.list();

		System.out.println("Student details from DAO " + student);

		// System.out.println("Student ID " + student.getId());

		return student;
	}

	@Override
	public List<SchoolBranches> getBraches() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("branchname"));
		// criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To
		// avoid
		// duplicates.
		List<SchoolBranches> branches = (List<SchoolBranches>) criteria.list();

		return branches;
	}

}
