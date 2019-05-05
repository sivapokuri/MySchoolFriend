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
@Table(name = "student")
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty
	@Column(name = "firstname", nullable = false)
	private String firstName;

	@NotEmpty
	@Column(name = "lastname", nullable = false)
	private String lastName;

	@NotNull
	@Column(name = "age", nullable = false)
	private Integer age;

	@NotEmpty
	@Column(name = "sex", nullable = false)
	private String sex;

	@NotEmpty
	@Column(name = "email", nullable = false)
	private String email;

	@Column(name = "dateofbirth", nullable = false)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date dateofbirth;

	@NotNull
	@Column(name = "cellphone", nullable = true)
	private Integer cellphone;

	@NotNull
	@Column(name = "homephone", nullable = true)
	private Integer homephone;

	@NotEmpty
	@Column(name = "homeaddress", nullable = false)
	private String homeaddress;

	@NotEmpty
	@Column(name = "currentaddress", nullable = false)
	private String currentaddress;

	@NotEmpty
	@Column(name = "fathername", nullable = false)
	private String fathername;

	@NotEmpty
	@Column(name = "mothername", nullable = false)
	private String mothername;

	@NotNull
	@Column(name = "fathercellphone", nullable = true)
	private Integer fathercellphone;

	@NotNull
	@Column(name = "mothercellphone", nullable = true)
	private Integer mothercellphone;

	@NotEmpty
	@Column(name = "fatheroccupation", nullable = true)
	private String fatheroccupation;

	@NotEmpty
	@Column(name = "motheroccupation", nullable = true)
	private String motheroccupation;

	@NotEmpty
	@Column(name = "fatherofficeaddress", nullable = true)
	private String fatherofficeaddress;

	@NotEmpty
	@Column(name = "motherofficeaddress", nullable = true)
	private String motherofficeaddress;

	@Column(name = "optemailcomm", nullable = true)
	private boolean optemailcomm;

	@Column(name = "optmobilecomm", nullable = true)
	private boolean optmobilecomm;
	
	@NotEmpty
	@Column(name = "classid", nullable = true)
	private String classid;
	
	@NotEmpty
	@Column(name = "sectionid", nullable = true)
	private String sectionid;

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getSectionid() {
		return sectionid;
	}

	public void setSectionid(String sectionid) {
		this.sectionid = sectionid;
	}

	public boolean isOptemailcomm() {
		return optemailcomm;
	}

	public void setOptemailcomm(boolean optemailcomm) {
		this.optemailcomm = optemailcomm;
	}

	public boolean isOptmobilecomm() {
		return optmobilecomm;
	}

	public void setOptmobilecomm(boolean optmobilecomm) {
		this.optmobilecomm = optmobilecomm;
	}

	public Integer getCellphone() {
		return cellphone;
	}

	public void setCellphone(Integer cellphone) {
		this.cellphone = cellphone;
	}

	public Integer getHomephone() {
		return homephone;
	}

	public void setHomephone(Integer homephone) {
		this.homephone = homephone;
	}

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}

	public String getCurrentaddress() {
		return currentaddress;
	}

	public void setCurrentaddress(String currentaddress) {
		this.currentaddress = currentaddress;
	}

	public String getFathername() {
		return fathername;
	}

	public void setFathername(String fathername) {
		this.fathername = fathername;
	}

	public String getMothername() {
		return mothername;
	}

	public void setMothername(String mothername) {
		this.mothername = mothername;
	}

	public Integer getFathercellphone() {
		return fathercellphone;
	}

	public void setFathercellphone(Integer fathercellphone) {
		this.fathercellphone = fathercellphone;
	}

	public Integer getMothercellphone() {
		return mothercellphone;
	}

	public void setMothercellphone(Integer mothercellphone) {
		this.mothercellphone = mothercellphone;
	}

	public String getFatheroccupation() {
		return fatheroccupation;
	}

	public void setFatheroccupation(String fatheroccupation) {
		this.fatheroccupation = fatheroccupation;
	}

	public String getMotheroccupation() {
		return motheroccupation;
	}

	public void setMotheroccupation(String motheroccupation) {
		this.motheroccupation = motheroccupation;
	}

	public String getFatherofficeaddress() {
		return fatherofficeaddress;
	}

	public void setFatherofficeaddress(String fatherofficeaddress) {
		this.fatherofficeaddress = fatherofficeaddress;
	}

	public String getMotherofficeaddress() {
		return motherofficeaddress;
	}

	public void setMotherofficeaddress(String motherofficeaddress) {
		this.motherofficeaddress = motherofficeaddress;
	}

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

}
