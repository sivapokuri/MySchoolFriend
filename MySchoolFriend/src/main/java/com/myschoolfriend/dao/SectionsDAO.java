package com.myschoolfriend.dao;

import java.util.Set;

import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Subject;

public interface SectionsDAO {

	Set<SectionName> getSectionsFromClassID(String classid);

	

}
