<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Prepare Question Paper for 10th class Physics</title>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				var date_input = $('input[name="startdate"]'); //our date input has the name "date"
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

	$(document).ready(
			function() {
				var date_input = $('input[name="enddate"]'); //our date input has the name "date"
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
<script type="text/javascript">
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
</script>
</head>
<body>

<div class="container">
    <table id="myTable" class=" table order-list">
    <thead>
        <tr>
            <td>Question</td>
            <td>Option1</td>
            <td>Option2</td>
            <td>Option3</td>
            <td>Option4</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="col-sm-4">
                <input type="text" name="question" class="form-control" />
            </td>
            <td class="col-sm-4">
                <input type="text" name="option1"  class="form-control"/>
            </td>
            <td class="col-sm-3">
                <input type="text" name="option2"  class="form-control"/>
            </td>
             <td class="col-sm-3">
                <input type="text" name="option3"  class="form-control"/>
            </td>
             <td class="col-sm-3">
                <input type="text" name="option4"  class="form-control"/>
            </td>
            <td class="col-sm-2"><a class="deleteRow"></a>

            </td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="5" style="text-align: left;">
                <input type="button" class="btn btn-lg btn-block " id="addrow" value="Add Row" />
            </td>
        </tr>
        <tr>
        </tr>
    </tfoot>
</table>
</div>
</body>
</html>