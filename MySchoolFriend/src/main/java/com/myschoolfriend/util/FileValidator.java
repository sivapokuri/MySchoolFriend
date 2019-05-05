package com.myschoolfriend.util;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.myschoolfriend.model.FileBucket;



@Component
public class FileValidator implements Validator {
		
	public boolean supports(Class<?> clazz) {
		return FileBucket.class.isAssignableFrom(clazz);
	}

	public void validate(Object obj, Errors errors) {
		
		System.out.println("In File Validator class");
		FileBucket file = (FileBucket) obj;
			
		if(file.getFile()!=null){
			if (file.getFile().getSize() == 0) {
				errors.rejectValue("file", "missing.file");
			}
		}
	}
}

