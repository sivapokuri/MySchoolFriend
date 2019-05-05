<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>Student profile edit</title>
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
					<li class="active"><a href="<c:url value='/studentportal' />">Home</a></li>
					<li><a href="<c:url value='/studenteditprofile' />">My
							Profile</a></li>
					<li><a href="<c:url value='/studentprogress' />">Progress</a></li>
					<li><a href="<c:url value='/studentmaterial' />">My
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

	<div class="container">
		<div class="text-center">
			<h1 class="nice">Student profile edit</h1>
		</div>
		<form:form method="POST" modelAttribute="student"
			class="form-horizontal">

			<c:if test="${not empty success}">
				<div class="alert alert-success">${success}</div>
			</c:if>

			<div class="container-fluid bg-2 text-center">

				<form:input type="hidden" path="id" id="id" />

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="firstName">First
								Name</label>
							<div class="col-md-6">
								<c:choose>
									<c:when test="${edit}">
										<form:input type="text" path="firstName" id="firstName"
											class="form-control input-md" disabled="true" />
									</c:when>
									<c:otherwise>
										<form:input type="text" path="firstName" id="firstName"
											class="form-control input-md" />
										<div class="has-error">
											<form:errors path="firstName" class="help-inline" />
										</div>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="lastName">Last
								Name</label>
							<div class="col-md-6">
								<form:input type="text" path="lastName" id="lastName"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="lastName" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="age">Age</label>
							<div class="col-md-6">
								<form:input type="text" path="age" id="age"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="age" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="age">Gender</label>
							<div class="col-md-6">
								<form:input type="text" path="sex" id="sex"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="sex" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="dateofbirth">Date
								of Birth</label>
							<div class="col-md-6">
								<form:input class="form-control" id="dateofbirth"
									name="dateofbirth" path="dateofbirth" type="text" />
								<div class="has-error">
									<form:errors path="dateofbirth" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="age">Email</label>
							<div class="col-md-6">
								<form:input type="text" path="email" id="email"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="email" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

				</div>
				<div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="cellphone">Cell
								Phone</label>
							<div class="col-md-6">
								<form:input type="text" path="cellphone" id="cellphone"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="cellphone" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="homephone">Home
								Phone</label>
							<div class="col-md-6">
								<form:input type="text" path="homephone" id="homephone"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="homephone" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="homeaddress">Home
								Address</label>
							<div class="col-md-6">
								<form:input type="text" path="homeaddress" id="homeaddress"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="homeaddress" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="currentaddress">Current
								Address</label>
							<div class="col-md-6">
								<form:input type="text" path="currentaddress"
									id="currentaddress" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="currentaddress" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="fathername">Father
								Name</label>
							<div class="col-md-6">
								<form:input type="text" path="fathername" id="fathername"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="fathername" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="mothername">Mother
								Name</label>
							<div class="col-md-6">
								<form:input type="text" path="mothername" id="mothername"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="mothername" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="fathercellphone">Father
								Cell Phone</label>
							<div class="col-md-6">
								<form:input type="text" path="fathercellphone"
									id="fathercellphone" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="fathercellphone" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="mothercellphone">Mother
								Cell Phone</label>
							<div class="col-md-6">
								<form:input type="text" path="mothercellphone"
									id="mothercellphone" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="mothercellphone" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="fatheroccupation">Father
								Occupation</label>
							<div class="col-md-6">
								<form:input type="text" path="fatheroccupation"
									id="fatheroccupation" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="fatheroccupation" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="motheroccupation">Mother
								Occupation</label>
							<div class="col-md-6">
								<form:input type="text" path="motheroccupation"
									id="motheroccupation" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="motheroccupation" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="fatherofficeaddress">Father
								Office Address</label>
							<div class="col-md-6">
								<form:input type="text" path="fatherofficeaddress"
									id="fatherofficeaddress" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="fatherofficeaddress" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="motherofficeaddress">Mother
								Office Address</label>
							<div class="col-md-6">
								<form:input type="text" path="motherofficeaddress"
									id="motherofficeaddress" class="form-control input-md" />
								<div class="has-error">
									<form:errors path="motherofficeaddress" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="optemailcomm">Opt
								Email communication</label>
							<div class="col-md-6">
								<form:radiobutton path="optemailcomm" value="true" />
								YES
								<form:radiobutton path="optemailcomm" value="false" />
								NO
								<div class="has-error">
									<form:errors path="optemailcomm" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="optmobilecomm">Opt
								Phone communication</label>
							<div class="col-md-6">
								<form:radiobutton path="optmobilecomm" value="true" />
								YES
								<form:radiobutton path="optmobilecomm" value="false" />
								NO
								<div class="has-error">
									<form:errors path="optmobilecomm" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-6 control-label" for="button1id"></label>

					<div class="col-md-4">
						<button type="submit" class="btn btn-success">update</button>
						<a id="cancel" name="cancel" class="btn btn-danger"
							href="<c:url value='/studentportal' />"> Cancel</a>
					</div>
				</div>

			</div>
		</form:form>
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>