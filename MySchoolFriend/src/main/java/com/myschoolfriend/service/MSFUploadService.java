package com.myschoolfriend.service;

import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.StudentDocuments;

public interface MSFUploadService {

	Student findById(int id);

	void saveDocument(StudentDocuments sDocument);

}
