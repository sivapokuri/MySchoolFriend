<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>School Friend</title>
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

	<div class="container-fluid text-center">
		<div class="row content">
			<br> <br>
			<div class="col-sm-6">
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
							<p>Staff OnBoard</p>
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
							<p>Add/Edit new class</p>
							<a href="<c:url value='//addclass' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/classes-icon.png">
							</a>
						</div>
						<div class="col-sm-4">
							<p>Add/Edit new section</p>
							<a href="<c:url value='/addsection' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/class-section.png">
							</a>
						</div>
						<div class="col-sm-4">
							<p>Add new event</p>
							<a href="<c:url value='/addcalevent' />"> <img
								class="img-responsive margin" style="width: 100%" alt="Image"
								src="static/images/newevent.png">
							</a>
						</div>

					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="row">
					<div class="col-sm-4">
						<p>Search/Edit Employee</p>
						<img class="img-responsive margin" style="width: 100%" alt="Image"
							src="static/images/teacherOnboard.png">
					</div>
					<div class="col-sm-4">
						<p>College Calendar</p>
						<a href="<c:url value='/orgcal' />"> <img
							class="img-responsive margin" style="width: 100%" alt="Image"
							src="static/images/collegecalendar.png">
						</a>
					</div>
					<div class="col-sm-4">
						<p>Notice Board</p>
						<img class="img-responsive margin" style="width: 100%" alt="Image"
							src="static/images/noticeboard.png">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-4">
						<p>Add Subject</p>
						<a href="<c:url value='/addsubject' />"> <img
							class="img-responsive margin" style="width: 100%" alt="Image"
							src="static/images/subject.png">
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>

</html>