package com.myschoolfriend.service;

import java.util.Set;

import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Subject;

public interface MSFSubjectService {

	Set<SectionName> findSectionsFromClass(String classid);

	void addSubject(Subject subject);

}
