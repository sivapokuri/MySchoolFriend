<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration Form</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
<script>
	$(document).ready(function() {
		$('#memployboxes-1').change(function() {
			$('#motherdiv').fadeIn();
		});
		$('#memployboxes-0').change(function() {
			$('#motherdiv').fadeOut();
		});
		$('#femployboxes-1').change(function() {
			$('#fatherdiv').fadeIn();
		});
		$('#femployboxes-0').change(function() {
			$('#fatherdiv').fadeOut();
		});

	});

	$(document).ready(
			function() {
				var date_input = $('input[name="dateofbirth"]'); //our date input has the name "date"
				var container = $('.bootstrap-iso form').length > 0 ? $(
						'.bootstrap-iso form').parent() : "body";
				var options = {
					format : 'mm/dd/yyyy',
					container : container,
					todayHighlight : true,
					autoclose : true,
				};
				date_input.datepicker(options);
			})
</script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>

<style>
@import url(http://fonts.googleapis.com/css?family=Montserrat:400,700);

@import url('https://fonts.googleapis.com/css?family=Lobster');

h1.nice {
	font-family: 'Lobster', cursive;
}

body {
	background-color: #ffffff;
	font-family: 'Montserrat', sans-serif;
	font-weight: 400;
	font-size: 14px;
	color: #555;
	-webkit-font-smoothing: antialiased;
	-webkit-overflow-scrolling: touch;
}

input[type='number'] {
	-moz-appearance: textfield;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	display: none;
	-webkit-appearance: none;
	margin: 0;
}

body, html {
	height: 100%;
}

.bg { /* The image used */
	/* Full height */
	background-url: url("sac_de_cours_Vector_Clipart.png") height:       auto;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
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
					<li><a href="student.html">Student Portal</a></li>
					<li><a href="#">Parent Portal</a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="Management.html">Management Portal</a>
					
					<ul class="dropdown-menu">
						        <li class="active"><a href="#">Students</a></li>
						        <li><a href="#">Employees</a></li>
						        <li><a href="AddStudent.html">Add Student</a></li>
								<li><a href="AddEmployee.html">Add Employee</a></li>
								<li><a href="CollegeCalendar.html">College Calendar</a></li>
								<li><a href="Payments.html">Payments</a></li>
						      </ul>
					
					</li>
					
					
					<li><a href="#">Teacher Portal</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value='/logout' />"><span class="glyphicon glyphicon-log-in"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="text-center">
			<h1 class="nice">Student Registration Form</h1>
		</div>
		<form:form method="POST" modelAttribute="student"
			class="form-horizontal">
			<div class="container-fluid bg-2 text-center">

				<form:input type="hidden" path="id" id="id" />

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="firstName">First
								Name</label>
							<div class="col-md-6">
								<form:input type="text" path="firstName" id="firstName"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="firstName" class="help-inline" />
								</div>
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
									name="dateofbirth" path="dateofbirth" placeholder="MM/DD/YYY"
									type="text" />
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
							<label class="col-md-6 control-label" for="fathername">Father Name</label>
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
								<form:input type="text" path="mothername"
									id="mothername" class="form-control input-md" />
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
							<label class="col-md-6 control-label" for="fathercellphone">Father Cell Phone</label>
							<div class="col-md-6">
								<form:input type="text" path="fathercellphone" id="fathercellphone"
									class="form-control input-md" />
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
							<label class="col-md-6 control-label" for="fatheroccupation">Father Occupation</label>
							<div class="col-md-6">
								<form:input type="text" path="fatheroccupation" id="fatheroccupation"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="fatheroccupation" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="motheroccupation">Mother Occupation</label>
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
							<label class="col-md-6 control-label" for="fatherofficeaddress">Father Office Address</label>
							<div class="col-md-6">
								<form:input type="text" path="fatherofficeaddress" id="fatherofficeaddress"
									class="form-control input-md" />
								<div class="has-error">
									<form:errors path="fatherofficeaddress" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-md-6 control-label" for="motherofficeaddress">Mother Office Address</label>
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
						<label class="col-md-6 control-label" for="optemailcomm">Opt Email communication</label>
							<div class="col-md-6">
								<form:radiobutton path="optemailcomm" value="true"/>YES
								<form:radiobutton path="optemailcomm" value="false"/>NO
								<div class="has-error">
									<form:errors path="optemailcomm" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="form-group">
						<label class="col-md-6 control-label" for="optmobilecomm">Opt Phone communication</label>
							<div class="col-md-6">
								<form:radiobutton path="optmobilecomm" value="true"/>YES
								<form:radiobutton path="optmobilecomm" value="false"/>NO
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
						<button type="submit" class="btn btn-success">Save</button>
						<a id="cancel" name="cancel" class="btn btn-danger" href="#">
							Cancel</a>
					</div>
				</div>

			</div>
		</form:form>
	</div>

</body>
<%@ include file="footer.jsp" %>  
</html>