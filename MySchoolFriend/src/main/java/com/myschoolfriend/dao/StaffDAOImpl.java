package com.myschoolfriend.dao;

import org.springframework.stereotype.Repository;

import com.myschoolfriend.model.Staff;

@Repository("staffDao")
public class StaffDAOImpl extends AbstractDao<Integer, Staff> implements StaffDAO {

	@Override
	public void saveStaff(Staff staff) {
		// TODO Auto-generated method stub
		persist(staff);
	}

}
