package com.myschoolfriend.dao;

import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.SectionName;

@Repository("addSectionDao")
public class SectionNamesDAOImpl extends AbstractDao<Integer, SectionName> implements SectionNamesDAO {

	@Override
	public void addSection(SectionName sName) {

		persist(sName);

	}

}
