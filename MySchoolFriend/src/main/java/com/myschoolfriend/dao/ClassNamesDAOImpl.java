package com.myschoolfriend.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.ClassName;

@Repository("classNamesDao")
public class ClassNamesDAOImpl extends AbstractDao<Integer, ClassName> implements ClassNamesDAO {

	@Override
	public List<ClassName> getClassNamesList() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("id"));
		// criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To
		// avoid
		// duplicates.
		List<ClassName> classNamesObject = (List<ClassName>) criteria.list();

		return classNamesObject;
	}

}
