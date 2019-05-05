package com.myschoolfriend.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.StudentDocuments;

@Repository("sDocumentsdao")
public class StudentDocumentsDAOImpl extends AbstractDao<Integer, StudentDocuments> implements StudentDocumentsDAO {

	@Override
	public List<StudentDocuments> findAllByUserId(int id) {
		Criteria crit = createEntityCriteria();
		// Criteria userCriteria = crit.createCriteria("user");
		crit.add(Restrictions.eq("userid", id));
		return (List<StudentDocuments>) crit.list();
	}

	@Override
	public void save(StudentDocuments sDocument) {

		persist(sDocument);

	}

}
