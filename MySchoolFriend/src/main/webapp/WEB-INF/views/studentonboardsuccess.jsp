<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Student onboard status</title>
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
					<li class="active"><a href="/">Home</a></li>
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

		<c:if test="${not empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>
		<div class="row content">
			<div class="col-sm-12">
				<div class="container-fluid bg-3 text-center">
					<div class="row">
						<div class="col-sm-12">
							<p>Student ${student.firstName} ${student.lastName} on board
								successful!</p>

							<a href="<c:url value='/upload-studoc-${student.id}' />">Click
								Here</a> to upload student documents.
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>


</body>
<%@ include file="footer.jsp"%>
</html>