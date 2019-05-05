package com.myschoolfriend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myschoolfriend.dao.StudentDocumentsDAO;
import com.myschoolfriend.model.StudentDocuments;

@Service("msfStuDocsService")
@Transactional
public class MSFStudentDocsServiceImpl implements MSFStudentDocsService {

	@Autowired
	StudentDocumentsDAO sDocumentsdao;

	@Override
	public List<StudentDocuments> findAllDocsById(int id) {

		return sDocumentsdao.findAllByUserId(id);

	}

	@Override
	public void saveDocument(StudentDocuments sDocument) {
		
		sDocumentsdao.save(sDocument);
		// TODO Auto-generated method stub
		
	}

}
