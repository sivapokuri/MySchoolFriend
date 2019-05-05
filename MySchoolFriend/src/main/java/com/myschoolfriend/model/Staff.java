package com.myschoolfriend.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "staff")
public class Staff {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty
	@Column(name = "firstname", nullable = false)
	private String firstName;

	@NotEmpty
	@Column(name = "lastname", nullable = false)
	private String lastName;
	
	@NotEmpty
	@Column(name = "qualification", nullable = false)
	private String qualification;
	
	@NotNull
	@Column(name = "age", nullable = false)
	private Integer age;
	
	@NotEmpty
	@Column(name = "stafftype", nullable = false)
	private String staffType;
	
	@NotEmpty
	@Column(name = "currentaddress", nullable = false)
	private String currentaddress;
	
	@Column(name = "permanentaddress", nullable = true)
	private String permanentaddress;

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	@Column(name = "startdate", nullable = false)
	private Date startdate;
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	@Column(name = "enddate", nullable = false)
	private Date enddate;
	
	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getCurrentaddress() {
		return currentaddress;
	}

	public void setCurrentaddress(String currentaddress) {
		this.currentaddress = currentaddress;
	}

	public String getPermanentaddress() {
		return permanentaddress;
	}

	public void setPermanentaddress(String permanentaddress) {
		this.permanentaddress = permanentaddress;
	}

	

	public String getStaffType() {
		return staffType;
	}

	public void setStaffType(String staffType) {
		this.staffType = staffType;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	

}
