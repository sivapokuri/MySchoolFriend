package com.myschoolfriend.dao;

import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.ClassName;

@Repository("addClassDao")
public class AddClassDAOImpl extends AbstractDao<Integer, ClassName> implements AddClassDAO {

	@Override
	public void addClass(ClassName cName) {
		persist(cName);
	}

}
