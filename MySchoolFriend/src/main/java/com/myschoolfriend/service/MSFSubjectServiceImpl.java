package com.myschoolfriend.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myschoolfriend.dao.AddSubjectsDAO;
import com.myschoolfriend.dao.SectionsDAO;
import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Subject;

@Service("msfSubjectService")
@Transactional
public class MSFSubjectServiceImpl implements MSFSubjectService {

	@Autowired
	private SectionsDAO gsDao;

	@Autowired
	private AddSubjectsDAO asDao;

	@Override
	public Set<SectionName> findSectionsFromClass(String classid) {

		// TODO Auto-generated method stub
		return gsDao.getSectionsFromClassID(classid);
	}

	@Override
	public void addSubject(Subject subject) {
		asDao.save(subject);

	}
}
