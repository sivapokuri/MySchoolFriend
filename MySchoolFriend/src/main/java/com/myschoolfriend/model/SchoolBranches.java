package com.myschoolfriend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "schoolbranches")
public class SchoolBranches {
	
	@NotEmpty
	@Column(name = "branchid", nullable = false)
	private Integer branchid;
	
	@Id
	@NotEmpty
	@Column(name = "branchcode", nullable = false)
	private String branchcode;
	
	public Integer getBranchid() {
		return branchid;
	}

	public void setBranchid(Integer branchid) {
		this.branchid = branchid;
	}

	public String getBranchcode() {
		return branchcode;
	}

	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}

	public String getBranchname() {
		return branchname;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	@NotEmpty
	@Column(name = "branchname", nullable = false)
	private String branchname;

}
