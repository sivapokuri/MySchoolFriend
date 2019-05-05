package com.myschoolfriend.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.StaffTypes;

@Repository("staffTypesDao")
public class StaffTypesDAOImpl extends AbstractDao<Integer, StaffTypes> implements StaffTypesDAO {

	@Override
	public List<StaffTypes> getStaffType() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
		//criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To
		// avoid
		// duplicates.
		List<StaffTypes> staffTypes = (List<StaffTypes>) criteria.list();

		return staffTypes;
	}
}
