package com.myschoolfriend.dao;

import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.Subject;

@Repository("asDao")
public class AddSubjectsDAOImpl extends AbstractDao<Integer, Subject> implements AddSubjectsDAO {

	@Override
	public void save(Subject subject) {
		persist(subject);
	}

}
