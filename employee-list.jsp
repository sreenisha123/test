<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setHeader("Cache-Control","no-cache, no-store");
%>
<html>
<head>
<title>Employee Skill Application</title>
	<meta http-equiv="cache-control" content="max-age=0, must-revalidate, no-cache, no-store, private">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		var pagLoaded = '<%=request.getAttribute("listPage") %>';
		<% session.setAttribute("formPage", "null"); %>
		if (pagLoaded === null) {
			pagLoaded = "loaded";
			location.reload(true);
		}
		$(function(){ // jQuery for handling onclick event
			document.getElementById('addLink').onclick =
					function () {
						//alert($("#addLink").href);
						document.getElementById('addLink').href = '<%=request.getContextPath()%>/new';
					};
		});
	</script>
	<script src="../WebContent/empskill.js"></script>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			 style="background-color: blue">
			<div>
				<a href="#" class="navbar-brand"> Bosch Employee Skill Application </a>
			</div>

		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<c:if test="${listEmployee != null}">
			<h3 class="text-center">List of Employees</h3>
			<hr>
			</c:if>
			<div class="container text-left">

				<a href="#" id="addLink" class="btn btn-success">Add
					New Employee</a>
			</div>
			<c:if test="${listEmployee == null}">
			&nbsp;
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/list" id="" class="btn btn-success">List
					All Employees</a>
			</div>
			</c:if>
			<c:if test="${listEmployee != null}">
				&nbsp;
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>"  class="btn btn-success">Home</a>
			</div>
			</c:if>
			<br>
			<c:if test="${listEmployee != null}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Employee Number</th>
						<th>Name</th>
						<th>Department</th>
						<th>Years of Experience</th>
						<th>Qualifications</th>
						<th>Certifications</th>
						<th>Technical Skills</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="employee" items="${listEmployee}">

						<tr>
							<td><c:out value="${employee.empNo}" /></td>
							<td><c:out value="${employee.name}" /></td>
							<td><c:out value="${employee.department}" /></td>
							<td><c:out value="${employee.exp_years}" /></td>
							<td><c:out value="${employee.qualifications}" /></td>
							<td><c:out value="${employee.certifications}" /></td>
							<td><c:out value="${employee.tech_skills}" /></td>
							<td><a href="edit?empNo=<c:out value='${employee.empNo}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?empNo=<c:out value='${employee.empNo}' />">Delete</a></td>
						</tr>
					</c:forEach>
		
				</tbody>

			</table>
			</c:if>
		</div>
	</div>
</body>
</html>