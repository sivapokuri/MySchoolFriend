package com.myschoolfriend.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.Qualification;

@Repository("quaDao")
public class QualificationsDAOImpl extends AbstractDao<Integer, Qualification> implements QualificationsDAO {

	@Override
	public List<Qualification> getQualificationList() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("qualification"));
		// criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To
		// avoid
		// duplicates.
		List<Qualification> staffTypes = (List<Qualification>) criteria.list();

		return staffTypes;

	}

}
