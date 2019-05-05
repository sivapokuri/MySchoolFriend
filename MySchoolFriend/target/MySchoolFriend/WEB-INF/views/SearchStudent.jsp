<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Student Registration Form</title>
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
					<li class="active"><a href="<c:url value='/administrator' />">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/logout' />"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col-md-4 col-md-offset-3">
				<form:form method="POST" class="search-form"
					modelAttribute="studentsearch">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" name="searchTxt"
							id="search"
							placeholder="Search Student by Firstname (OR) Lastname">
						<span class="glyphicon glyphicon-search form-control-feedback"></span>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<div class="generic-container-student-table">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">List of Users </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th width="100"></th>
							<th width="100"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${student}" var="student">
							<c:if test="${student.id !=null}">
								<tr>
									<td>${student.id}</td>
									<td>${student.firstName}</td>
									<td>${student.lastName}</td>
									<td>${student.email}</td>
									
									<td><a href="<c:url value='/upload-studoc-${student.id}' />"
										class="btn btn-success custom-width">docs</a></td>
									<td><a href="<c:url value='/edit-user-${student.id}' />"
										class="btn btn-success custom-width">edit</a></td>
									<td><a href="<c:url value='/delete-user-${student.id}' />"
										class="btn btn-danger custom-width">delete</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="well">
			<a href="<c:url value='/student' />">Add New User</a>
		</div>
	</div>

</body>

<%@ include file="footer.jsp"%>
</html>