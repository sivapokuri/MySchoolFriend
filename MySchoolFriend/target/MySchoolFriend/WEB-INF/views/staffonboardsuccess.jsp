<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Student On Board status</title>
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
				<li><a href="#">Contact</a></li>
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
			<div class="col-sm-12">
				<br>
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					Staff on board successful!
				</div>

				<div class="container-fluid bg-3 text-center">
					<div class="row">
						<div class="col-sm-4">
							<p>Student OnBoard</p>
							<a href="<c:url value='/student' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/StudentOnBoard.png">
							</a>
						</div>
						<div class="col-sm-4">
							<p>Employee OnBoard</p>
							<a href="<c:url value='/staffonboard' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/teacherOnboard.png">
							</a>
						</div>
						<div class="col-sm-4">
							<p>Search/Edit Student</p>
							<a href="<c:url value='/searchstudent' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/StudentOnBoard.png">
							</a>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-sm-4">
							<p>Search/Edit Employee</p>
							<img class="img-responsive margin" style="width: 100%"
								alt="Image" src="static/images/teacherOnboard.png">
						</div>
						<div class="col-sm-4">
							<p>College Calendar</p>
							<img class="img-responsive margin" style="width: 100%"
								alt="Image" src="static/images/collegecalendar.png">
						</div>
						<div class="col-sm-4">
							<p>Notice Board</p>
							<img class="img-responsive margin" style="width: 100%"
								alt="Image" src="static/images/noticeboard.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<%@ include file="footer.jsp"%>
</html>