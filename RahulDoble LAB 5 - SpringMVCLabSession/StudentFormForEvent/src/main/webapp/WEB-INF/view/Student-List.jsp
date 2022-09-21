<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Student List</title>
<style>
.container {
	padding: 15px;
}

.container .search-container {
	float: right;
}

a {
	margin: 0 15px 0;
}
</style>

</head>

<body>

	<div class="container">

		<h3>Student List</h3>
		<hr>

		<!--for search option and add student button -->
		<div class="search-container">
			<form action="/StudentFormForEvent/studentsdetails/search"
				class="form-inline">
				<input type="text" name="name" placeholder="Search Name...."
					class="form-control-sm ml-5 mr-2 mb-3" />
				<button type="submit" class="btn btn-primary btn-sm mb-3">Search</button>
				<a href="/StudentFormForEvent/studentsdetails/showFormForAdd"
					class="btn btn-primary btn-sm mb-3">Add Student</a>

			</form>

			<!-- for list table contains all details -->
		</div>

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Student Id</th>
					<th>Name</th>
					<th>Department</th>
					<th>Country</th>
					<th>Action</th>

				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Student}" var="tempStudent">

					<tr>
						<td><c:out value="${tempStudent.id}" /></td>
						<td><c:out value="${tempStudent.name}" /></td>
						<td><c:out value="${tempStudent.department}" /></td>
						<td><c:out value="${tempStudent.country}" /></td>

						<!-- for update and delete button -->

						<td><a
							href="/StudentFormForEvent/studentsdetails/showFormForUpdate?studentId=${tempStudent.id}"
							class="btn btn-info btn-sm">Update</a> <a
							href="/StudentFormForEvent/studentsdetails/delete?studentId=${tempStudent.id}"
							class="btn btn-danger btn-sm"
							onclick="if(!(confirm('Are you want to delete this entry?'))) return false">Delete></a>

						</td>
					</tr>
				</c:forEach>


			</tbody>
		</table>



	</div>




</body>
</html>