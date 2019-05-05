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
@Table(name = "schoolcalendar")
public class SchoolCalendar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty
	@Column(name = "name", nullable = false)
	private String name;

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	@Column(name = "startdate", nullable = false)
	private Date startdate;

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	@Column(name = "enddate", nullable = false)
	private Date enddate;

	@NotEmpty
	@Column(name = "description", nullable = false)
	private String description;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

}
