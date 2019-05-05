package com.myschoolfriend.dao;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.StaffTypes;
import com.myschoolfriend.model.Subject;

@Repository("gsDao")
public class SectionsDAOImpl extends AbstractDao<Integer, SectionName> implements SectionsDAO {

	@Override
	public Set<SectionName> getSectionsFromClassID(String classid) {

		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("classid", Integer.parseInt(classid)));

		// avoid
		// duplicates.
		List<SectionName> secNames = (List<SectionName>) crit.list();

		Set<SectionName> sectionsSet = new HashSet<SectionName>(secNames);

		System.out.println("Set values .....");
		for (SectionName temp : sectionsSet) {
			System.out.println(temp.getSectionname());
		}

		return sectionsSet;

	}



}
