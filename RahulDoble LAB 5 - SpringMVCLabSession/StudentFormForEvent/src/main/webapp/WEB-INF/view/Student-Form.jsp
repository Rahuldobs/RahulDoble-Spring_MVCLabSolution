<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Student Forms</title>
<style>
label {
	padding: 12px 100px 12px 5px;
	display: inline-block;
}

input[type=text] {
	width: 50%;
	padding: 8px 12px;
	margin: 8px;
	box-sizing: border-box;
}

select[id=country] {
	border-style: inset;
	width: 25pc;
	padding: 8px 12px;
	margin: 8px;
}

.container {
	max-width: 50%;
	margin-top: 10px;
	border-radius: 10px;
	border-style: groove;
	background-color: aliceblue;
	padding: 20px;
}

button {
	margin-left: 200px;
}

input[type=reset] {
	margin-left: 75px;
}
</style>

</head>

<body>
	<!-- for for add new student -->
	<div class="container">
		<h1>Form</h1>
		<hr>
		<form action="/StudentFormForEvent/studentsdetails/save" method="post">

			<input type="hidden" id="id" name="id" value="${Student.id}" /> <label
				for="name">Name:</label> <input type="text" id="name" name="name"
				value="${Student.name}" placeholder="Enter Name" /><br> <br>
			<br> <label for="department">Department</label> <input
				type="text" id="department" name="department"
				value="${Student.department}" placeholder="Enter Department" /> <br>
			<br> <br> <label for="country" value="${Student.country}">Country:
			</label> <select id="country" name="country">
				<option value="India">India</option>
				<option value="Canada">Canada</option>
				<option value="NewZealand">NewZealand</option>
				<option value="USA">USA</option>
			</select> <br> <br> <br>
			
			<button type="submit" class="btn btn-info col-2">Save</button>
			<input type="reset" class="btn btn-info col-2" value="reset entry" />
		</form>
		
		<a href="/StudentFormForEvent/studentsdetails/list">Back to Books
			List</a>
	</div>
</body>
</html>