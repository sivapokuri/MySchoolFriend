package com.myschoolfriend.dao;

import java.util.List;

import com.myschoolfriend.model.StudentDocuments;

public interface StudentDocumentsDAO {

	List<StudentDocuments> findAllByUserId(int id);

	void save(StudentDocuments sDocument);

}
