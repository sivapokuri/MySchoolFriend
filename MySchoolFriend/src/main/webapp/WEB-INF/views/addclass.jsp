<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Add New class</title>
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
					<li><a href="student.html">Student Portal</a></li>
					<li><a href="#">Parent Portal</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="Management.html">Management
							Portal</a>

						<ul class="dropdown-menu">
							<li class="active"><a href="#">Students</a></li>
							<li><a href="#">Employees</a></li>
							<li><a href="AddStudent.html">Add Student</a></li>
							<li><a href="AddEmployee.html">Add Employee</a></li>
							<li><a href="CollegeCalendar.html">College Calendar</a></li>
							<li><a href="Payments.html">Payments</a></li>
						</ul></li>


					<li><a href="#">Teacher Portal</a></li>
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
		<div class="text-center">
			<h1 class="nice">Add Class</h1>
		</div>
		<form:form method="POST" modelAttribute="addclass"
			class="form-horizontal">



			<c:if test="${not empty message}">
				<div class="alert alert-success">${message}</div>
			</c:if>



			<div class="container-fluid bg-2 text-center">

				<form:input type="hidden" path="id" id="id" />

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="name">Class
								Name</label>
							<div class="col-md-6">
								<form:input type="text" path="name" id="name"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="name" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-6">
						<div class="col-md-6">
							<button type="submit" class="btn btn-success">Create</button>
							<a id="cancel" name="cancel" class="btn btn-danger" href="#">
								Cancel</a>
						</div>
					</div>
				</div>

			</div>
		</form:form>
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>