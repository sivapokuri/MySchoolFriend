package com.myschoolfriend.dao;

import java.util.List;

import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.User;

public interface UserDao {

	User findById(int id);

	User findBySSO(String sso);

	void save(User user);

	void deleteBySSO(String sso);

	List<User> findAllUsers();


}
