package com.myschoolfriend.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myschoolfriend.dao.AddClassDAO;
import com.myschoolfriend.dao.ClassNamesDAO;
import com.myschoolfriend.dao.QualificationsDAO;
import com.myschoolfriend.dao.SchoolBranchesDAO;
import com.myschoolfriend.dao.SectionNamesDAO;
import com.myschoolfriend.dao.StaffDAO;
import com.myschoolfriend.dao.StaffTypesDAO;
import com.myschoolfriend.dao.StudentDAO;
import com.myschoolfriend.dao.UserDao;
import com.myschoolfriend.model.ClassName;
import com.myschoolfriend.model.Qualification;
import com.myschoolfriend.model.SchoolBranches;
import com.myschoolfriend.model.SectionName;
import com.myschoolfriend.model.Staff;
import com.myschoolfriend.model.StaffTypes;
import com.myschoolfriend.model.Student;
import com.myschoolfriend.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	@Autowired
	private StudentDAO sDao;

	@Autowired
	private StaffDAO staffDao;

	@Autowired
	private StaffTypesDAO staffTypesDao;

	@Autowired
	private QualificationsDAO quaDao;

	@Autowired
	private SchoolBranchesDAO schoolBranchesDao;

	@Autowired
	private AddClassDAO addClassDao;
	
	@Autowired
	private ClassNamesDAO classNamesDao;
	
	@Autowired
	private SectionNamesDAO addSectionDao;

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findBySSO(String sso) {
		User user = dao.findBySSO(sso);
		return user;
	}

	public void saveUser(User user) {
		dao.save(user);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate
	 * update explicitly. Just fetch the entity from db and update it with
	 * proper values within transaction. It will be updated in db once
	 * transaction ends.
	 */
	public void updateUser(User user) {

		System.out.println("User ID :: " + user.getId());
		User entity = dao.findById(user.getId());
		if (entity != null) {
			entity.setSsoId(user.getSsoId());
			entity.setFirstName(user.getFirstName());
			entity.setLastName(user.getLastName());
			entity.setEmail(user.getEmail());
			entity.setUserDocuments(user.getUserDocuments());
		}
	}

	public void deleteUserBySSO(String sso) {
		dao.deleteBySSO(sso);
	}

	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	public boolean isUserSSOUnique(Integer id, String sso) {
		User user = findBySSO(sso);
		return (user == null || ((id != null) && (user.getId() == id)));
	}

	@Override
	public User findStudentDetails(String sso) {
		User user = dao.findBySSO(sso);
		return user;
	}

	@Override
	public void saveStudent(Student student) {
		sDao.saveStudent(student);
	}

	@Override
	public List<Student> findStudent(String searchTxt) {
		List<Student> student = sDao.findStudent(searchTxt);
		return student;
	}

	@Override
	public List<SchoolBranches> getBranches() {

		return sDao.getBraches();
	}

	@Override
	public void saveStaff(Staff staff) {

		staffDao.saveStaff(staff);
	}

	@Override
	public List<StaffTypes> getStaffTypesList() {
		List<StaffTypes> stafftypes = staffTypesDao.getStaffType();
		return stafftypes;
	}

	@Override
	public List<Qualification> getQualificationsList() {

		List<Qualification> qualifications = quaDao.getQualificationList();
		return qualifications;

	}

	@Override
	public List<SchoolBranches> getSchoolBranches() {

		List<SchoolBranches> schoolBranches = schoolBranchesDao.getSchoolBranchesList();
		return schoolBranches;
	}

	@Override
	public void addClassName(ClassName cName) {

		addClassDao.addClass(cName);

	}

	@Override
	public void addSectionName(SectionName sName) {
		
		addSectionDao.addSection(sName);
	}

	@Override
	public List<ClassName> getClassNamesList() {
		
		List<ClassName> classNames = classNamesDao.getClassNamesList();
		return classNames;
	}

}
