package com.myschoolfriend.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.SchoolBranches;

@Repository("schoolBranchesDao")
public class SchoolBranchesDAOImpl extends AbstractDao<Integer, SchoolBranches> implements SchoolBranchesDAO {

	@Override
	public List<SchoolBranches> getSchoolBranchesList() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("branchname"));
		// criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To
		// avoid
		// duplicates.
		List<SchoolBranches> schoolBranches = (List<SchoolBranches>) criteria.list();

		return schoolBranches;
	}

}
