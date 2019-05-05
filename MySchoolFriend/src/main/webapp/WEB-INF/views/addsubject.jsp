<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Add Section for a class</title>
<%@ include file="header.jsp"%>

<c:url var="findSectionsURL" value="/findsecwithclass" />

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#classid')
								.change(
										function() {
											$
													.getJSON(
															'${findSectionsURL}',
															{
																classId : $(
																		this)
																		.val(),
																ajax : 'true'
															},
															function(data) {
																var html = '<option value="">select</option>';
																var len = data.length;
																for (var i = 0; i < len; i++) {
																	html += '<option value="' + data[i].id + '">'
																			+ data[i].sectionname
																			+ '</option>';
																}
																html += '</option>';

																$('#sectionid')
																		.html(
																				html);
															});
										});
					});
</script>
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
			<h1 class="nice">Add Subject</h1>
		</div>
		<form:form method="POST" modelAttribute="addsubject"
			class="form-horizontal">



			<c:if test="${not empty message}">
				<div class="alert alert-success">${message}</div>
			</c:if>



			<div class="container-fluid bg-2 text-center">

				<form:input type="hidden" path="subjectid" id="subjectid" />

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="classid">Select
								Class</label>
							<div class="col-md-6">
								<form:select path="classid" style="width: 100%" id="classid"
									class="form-control input-md">
									<form:option value="NONE" label="Select Class"
										class="form-control input-md" />
									<form:options items="${classeslist}"
										class="form-control input-md" />
								</form:select>
							</div>
						</div>
					</div>

				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="name">Section
								Name</label>
							<div class="col-md-6">

								<form:select path="sectionid" style="width: 100%" id="sectionid"
									class="form-control input-md">
									<form:option value="NONE" label="Select Section" />
								</form:select>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="name">Subject
								Name</label>
							<div class="col-md-6">
								<form:input type="text" path="subjectname" id="subjectname"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="subjectname" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="form-group">

					<div class="col-md-8">
						<button type="submit" class="btn btn-success">Create</button>
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