<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Update Results</title>
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
					<li><a href="<c:url value='/orgcal' />">Calendar</a></li>
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
			<h1 class="nice">Update student results</h1>
		</div>
		<form:form method="POST" modelAttribute="ssReportCardForm"
			class="form-horizontal" action="/MySchoolFriend/updateresults">



			<c:if test="${not empty message}">
				<div class="alert alert-success">${message}</div>
			</c:if>

			<label> Updating exam results of Section ${sectionid} of
				class ${classid} </label>


			<div class="generic-container-student-table">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<span class="lead">Student Scores </span>
					</div>
					<div class="tablecontainer">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Roll Number.</th>
									<th>Subject Name</th>
									<th>Score</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ssReportCardForm.studentReports}"
									var="StuSubReportCard" varStatus="status">
									<tr>
										<td><input
											name="studentReports[${status.index}].studentId"
											value="${StuSubReportCard.studentId}" /></td>
										<td><input
											name="studentReports[${status.index}].subjectName"
											value="${StuSubReportCard.subjectName}" /></td>
										<td><input
											name="studentReports[${status.index}].score"
											value="${StuSubReportCard.score}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="form-group">

				<div class="col-md-8">
					<button type="submit" class="btn btn-success">Update</button>
					<a id="cancel" name="cancel" class="btn btn-danger" href="#">
						Cancel</a>
				</div>
			</div>

		</form:form>
	</div>




</body>
<%@ include file="footer.jsp"%>
</html>