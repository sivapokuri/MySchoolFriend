
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="static/js/dynamic_list_helper.js" type="text/javascript"></script>
<title>Prepare Question paper</title>
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

	<div class="generic-container-student-table">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Set question paper </span>
			</div>
			
			<form:form modelAttribute="preparequestionpaper" method="POST"
				id="questionsListForm">

				<div class="tablecontainer">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Question</th>
								<th>Option A</th>
								<th>Option B</th>
								<th>Option C</th>
								<th>Option D</th>
								<th>Answer</th>


								<th></th>
							</tr>
						</thead>
						<tbody id="preparequestionpaper">
							<c:forEach items="${preparequestionpaper.lQuestions}"
								var="question" varStatus="i" begin="0">
								<tr class="question">
									<td><form:textarea path="lQuestions[${i.index}].q"
											id="q${i.index}" rows="5" cols="25" /></td>
									<td><form:input path="lQuestions[${i.index}].a"
											id="a${i.index}" /></td>
									<td><form:input path="lQuestions[${i.index}].b"
											id="b${i.index}" /></td>
									<td><form:input path="lQuestions[${i.index}].c"
											id="c${i.index}" /></td>
									<td><form:input path="lQuestions[${i.index}].d"
											id="d${i.index}" /></td>
									<td><form:input path="lQuestions[${i.index}].ans"
											id="ans${i.index}" size="1" /></td>

									<%--
                            <td><input type="text" name="personList[].name" value="${Person.name}" /></td>
                            <td><input type="text" name="personList[].age" value="${Person.age}" /></td>
                            --%>
									<td><a href="#" class="removeQuestion">Remove Question
									</a></td>
								</tr>
							</c:forEach>
							<%-- 
                        IMPORTANT 
                        There must always be one row.
                        This is to allow the JavaScript to clone the row.
                        If there is no row at all, it cannot possibly add a new row.
                    
                        If this 'default row' is undesirable 
                            remove it by adding the class 'defaultRow' to the row
                        I.e. in this case, class="person" represents the row.
                        Add the class 'defaultRow' to have the row removed.
                        This may seem weird but it's necessary because 
                        a row (at least one) must exist in order for the JS to be able clone it.
                        <tr class="person"> : The row will be present
                        <tr class="person defaultRow"> : The row will not be present
                    --%>

						</tbody>
					</table>
				</div>
				<input type="submit" value="Save" id="submit" class="btn btn-success" style="margin-left: 500px;"/>&nbsp;&nbsp;
            <a href="#" id="addQuestion">Add Question</a>&nbsp;&nbsp;
            <a href="?f=">Reset List</a>
			</form:form>
		</div>
	</div>

	<script type="text/javascript">
		function rowAdded(rowElement) {
			//clear the imput fields for the row
			$(rowElement).find("input").val('');
			//may want to reset <select> options etc

			//in fact you may want to submit the form
			saveNeeded();
		}
		function rowRemoved(rowElement) {
			saveNeeded();
			alert("Removed Row HTML:\n" + $(rowElement).html());
		}

		function saveNeeded() {
			$('#submit').css('color', 'red');
			$('#submit').css('font-weight', 'bold');
			if ($('#submit').val().indexOf('!') != 0) {
				$('#submit').val('!' + $('#submit').val());
			}
		}

		function beforeSubmit() {
			alert('submitting....');
			return true;
		}

		$(document).ready(function() {
			var config = {
				rowClass : 'question',
				addRowId : 'addQuestion',
				removeRowClass : 'removeQuestion',
				formId : 'questionsListForm',
				rowContainerId : 'preparequestionpaper',
				indexedPropertyName : 'lQuestions',
				indexedPropertyMemberNames : 'q,a,b,c,d,ans',
				rowAddedListener : rowAdded,
				rowRemovedListener : rowRemoved,
				beforeSubmit : beforeSubmit
			};
			new DynamicListHelper(config);
		});
	</script>

</body>
</html>
