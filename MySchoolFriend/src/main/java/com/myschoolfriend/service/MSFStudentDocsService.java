package com.myschoolfriend.service;

import java.util.List;

import com.myschoolfriend.model.StudentDocuments;

public interface MSFStudentDocsService {

	List<StudentDocuments> findAllDocsById(int id);

	void saveDocument(StudentDocuments sDocument);

}
