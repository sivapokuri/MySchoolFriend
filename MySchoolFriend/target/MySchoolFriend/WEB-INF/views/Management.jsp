<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>School Friend</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<script type="text/javascript">
	$(document).ready(
			function() {
				$(document).on(
						'change',
						'.btn-file :file',
						function() {
							var input = $(this), label = input.val().replace(
									/\\/g, '/').replace(/.*\//, '');
							input.trigger('fileselect', [ label ]);
						});

				$('.btn-file :file').on(
						'fileselect',
						function(event, label) {

							var input = $(this).parents('.input-group').find(
									':text'), log = label;

							if (input.length) {
								input.val(log);
							} else {
								if (log)
									alert(log);
							}

						});
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();

						reader.onload = function(e) {
							$('#img-upload').attr('src', e.target.result);
						}

						reader.readAsDataURL(input.files[0]);
					}
				}

				$("#imgInp").change(function() {
					readURL(this);
				});
			});
</script>
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
				var date_input = $('input[name="date"]'); //our date input has the name "date"
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

/* Upload Image */
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}

#img-upload {
	width: 100%;
}

/* Upload Image */

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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="Management.html">Management
							Portal</a>

						<ul class="dropdown-menu">
							<li class="active"><a href="#">Students</a></li>
							<li><a href="#">Employees</a></li>
							<li><a href="AddStudent.html">Add Student</a></li>
							<li><a href="<c:url value='/staffonboard' />">Add
									Employee</a></li>
							<li><a href="CollegeCalendar.html">College Calendar</a></li>
							<li><a href="Payments.html">Payments</a></li>
						</ul></li>


					<li><a href="#">Teacher Portal</a></li>
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
		<br>
		<br>
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
						<a href="<c:url value='/preparequestionpaper' />"> <img
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
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>

</html>