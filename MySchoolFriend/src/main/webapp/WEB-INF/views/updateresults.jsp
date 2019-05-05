<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Update Results</title>
<%@ include file="header.jsp"%>

<c:url var="findSectionsURL" value="/findsecwithclass" />

<c:url var="getStudentResults" value="/tstudresults" />

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 -->

<!-- <script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#sectionid')
								.change(
										function() {
											$
													.getJSON(
															'${getStudentResults}',
															{
																classid : $("#classid").val(),
																sectionid : $("#sectionid").val(),
																ajax : 'true'
															},
															function(data) {
																var html = '<div class="tablecontainer"><table class="table table-hover">'
																html +='<thead><tr> <th>Student ID</th><th>Subject Name</th><th>Score</th></tr></thead><tbody>';
																var len = data.length;
																for (var i = 0; i < len; i++) {
																	html += '<tr><td>'
																			+ data[i].studentId
																			+ '</td><td>'
																			+ data[i].subjectName
																			+ '</td><td>'
																			+ '<input type="text" class="form-control" id="score" path="score" value='
																	+ data[i].score
																	+ ' />'
																			+ '</td></tr>';
																}
																html += '</tbody></table>';

																$('#resultContainer').html(html);
															});
										});
					});
</script> -->




<script type="text/javascript">
	$(document).ready(
			function() {
				$('#classid').change(
						function() {
							$.getJSON('${findSectionsURL}', {
								classId : $(this).val(),
								ajax : 'true'
							}, function(data) {
								var html = '<option value="">Select Section</option>';
								var len = data.length;
								for (var i = 0; i < len; i++) {
									html += '<option value="' + data[i].id + '">'
											+ data[i].sectionname + '</option>';
								}
								html += '</option>';

								$('#sectionid').html(html);
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
			<h1 class="nice">Update student results</h1>
		</div>
		<form:form method="POST" modelAttribute="tgetstudentslist" action="/MySchoolFriend/tresults"
			class="form-horizontal">



			<c:if test="${not empty updatestatus}">
				<div class="alert alert-success">${updatestatus}</div>
			</c:if>



			<div class="container-fluid bg-2 text-center">

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
							<label class="col-md-6 control-label" for="sectionid">Section
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
				


<div class="form-group">

					<div class="col-md-8">
						<button type="submit" class="btn btn-success">Update</button>
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