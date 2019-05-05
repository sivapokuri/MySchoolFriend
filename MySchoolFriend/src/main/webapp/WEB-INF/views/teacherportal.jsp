<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>My School Friend</title>
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
					<li class="active"><a href="<c:url value='/teacherportal' />">Home</a></li>
					<li><a href="<c:url value='/teachereditprofile' />">My
							Profile</a></li>
					<li><a href="<c:url value='/takeattendance' />">Take Attendance</a></li>
					<li><a href="<c:url value='/searchstudentprofile' />">My
							Material</a></li>
					<li><a href="<c:url value='/studentcontactusform' />">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/logout' />"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<br> <br>
			<div class="col-sm-6">
				<div class="container-fluid bg-3 text-center">
					<div class="row">
						<div class="col-sm-4">
							<p>My Profile</p>
							<a href="<c:url value='/teachereditprofile' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/editprofile.png">
							</a>
						</div>
						<div class="col-sm-4">
							<p>Submit exam results</p>
							<a href="<c:url value='/tresults' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/attendance.png">
							</a>
						</div>
						<div class="col-sm-4">
							<p>Contact parent</p>
							<a href="<c:url value='/searchstudentprofile' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/searchstudent.png">
							</a>
						</div>
					</div>
					<br> <br>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="container-fluid bg-3 text-center">
					<div class="row">
						<div class="col-sm-4">
							<p>Prepare Question Paper</p>
							<a href="<c:url value='/preparequespaper' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/question-paper-icon.png">
							</a>
						</div>
						
					</div>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>

</html>