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
	<script src="../WebContent/empskill.js"></script>
	<script>
		var pagLoaded = '<%=session.getAttribute("formPage") %>';
		<% session.setAttribute("listPage", "null"); %>
		if (pagLoaded === "null") {
			<% session.setAttribute("formPage", "loaded"); %>
			location.reload(true);
		}
	</script>
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
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${employee != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${employee == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${employee != null}">
            			Edit Employee
            		</c:if>
						<c:if test="${employee == null}">
            			Add New Employee
            		</c:if>
					</h2>
				</caption>

				<c:if test="${employee != null}">
					<input type="hidden" name="empNo" value="<c:out value='${employee.empNo}' />" />
				</c:if>

					<c:if test="${employee == null}">
						<fieldset class="form-group">
							<label>Name</label> <input type="text"
															 value="<c:out value='${employee.name}' />" class="form-control"
															 name="name" required="required">
						</fieldset>
					</c:if>

				<fieldset class="form-group">
					<label>Department</label> <input type="text"
						value="<c:out value='${employee.department}' />" class="form-control"
						name="department" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Years of Experience</label> <input type="text"
						value="<c:out value='${employee.exp_years}' />" class="form-control"
						name="exp_years" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Qualifications</label> <input type="text"
						value="<c:out value='${employee.qualifications}' />" class="form-control"
						name="qualifications">
				</fieldset>

					<fieldset class="form-group">
						<label>Certifications</label> <input type="text"
															 value="<c:out value='${employee.certifications}' />" class="form-control"
															 name="certifications">
					</fieldset>

					<fieldset class="form-group">
						<label>Technical Skills</label> <input type="text"
															 value="<c:out value='${employee.tech_skills}' />" class="form-control"
															 name="tech_skills">
					</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>