<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Staff Onboard</title>
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
			<h1 class="nice">Create event</h1>
		</div>
		<form:form method="POST" modelAttribute="event"
			class="form-horizontal">
			
			 <c:if test="${not empty message}">
				<div class="alert alert-success">
  				${message}
  				</div>
			</c:if>
			<div class="container-fluid bg-2 text-center">

				<form:input type="hidden" path="id" id="id" />

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="name">Name</label>
							<div class="col-md-6">
								<form:input type="text" path="name" id="name"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="name" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="description">Description</label>
							<div class="col-md-6">
								<form:input type="textarea" path="description" id="description"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="description" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="startDate">Start
								Date</label>
							<div class="col-md-6">
								<form:input type="text" path="startDate" id="startDate"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="startDate" class="help-inline" />
								</div>
							</div>
						</div>
					</div>


					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="endDate">End
								Date</label>
							<div class="col-md-6">
								<form:input type="text" path="endDate" id="endDate"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="endDate" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

				</div>







				<div class="form-group">
					<label class="col-md-6 control-label" for="button1id"></label>

					<div class="col-md-4">
						<button type="submit" class="btn btn-success">Save</button>
						<a id="cancel" name="cancel" class="btn btn-danger" href="#">
							Cancel</a>
					</div>
				</div>

			</div>
		</form:form>
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>