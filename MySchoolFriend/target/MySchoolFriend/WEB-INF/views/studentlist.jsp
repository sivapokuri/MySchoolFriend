<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Students list</title>
<%@ include file="header.jsp"%>

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">SchoolFriend</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="Home.html">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="student.html">Student Portal</a></li>
					<li><a href="#">Parent Portal</a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="Management.html">Management Portal</a>
					
					<ul class="dropdown-menu">
						        <li class="active"><a href="#">Students</a></li>
						        <li><a href="#">Employees</a></li>
						        <li><a href="AddStudent.html">Add Student</a></li>
								<li><a href="AddEmployee.html">Add Employee</a></li>
								<li><a href="CollegeCalendar.html">College Calendar</a></li>
								<li><a href="Payments.html">Payments</a></li>
						      </ul>
					
					</li>
					
					
					<li><a href="#">Teacher Portal</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value='/logout' />"><span class="glyphicon glyphicon-log-in"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
    <br>
    <br>
    <div class="row">
        <div class="col-md-4 col-md-offset-3">
            <form:form method="POST" class="search-form" modelAttribute="studentsearch">
                <div class="form-group has-feedback">
            		<input type="text" class="form-control" name="id" id="search" placeholder="Search Student by ID">
              		<span class="glyphicon glyphicon-search form-control-feedback"></span>
            	</div>
            </form:form>
        </div>
    </div>
</div>

	<div class="generic-container-student-table">
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Users </span></div>
		  	<div class="tablecontainer">
				<table class="table table-hover">
		    		<thead>
			      		<tr>
					        <th>First Name</th>
					        <th>Last Name</th>
					        <th>Email</th>
					        <th width="100"></th>
					        <th width="100"></th>
						</tr>
			    	</thead>
		    		<tbody>
<%-- 					<c:forEach items="${student}" var="student"> --%>
						<c:if test="${student.id !=null}">
						<tr>
							<td>${student.firstName}</td>
							<td>${student.lastName}</td>
							<td>${student.email}</td>
							<td><a href="<c:url value='/edit-user-${student.id}' />" class="btn btn-success custom-width">edit</a></td>
							<td><a href="<c:url value='/delete-user-${student.id}' />" class="btn btn-danger custom-width">delete</a></td>
						</tr>
						</c:if>
<%-- 					</c:forEach> --%>
		    		</tbody>
		    	</table>
		    </div>
		</div>
	 	<div class="well">
	 		<a href="<c:url value='/student' />">Add New User</a>
	 	</div>
   	</div>
   	

</body>
<%@ include file="footer.jsp" %>  
</html>