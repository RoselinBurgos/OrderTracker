<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="assets/css/.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Takotsubo Order Tracker</title>
</head>
<body style ="background: url('/takolog.jpg')no-repeat center center fixed;  background-size: cover;">
<div class="container text-center border-bottom border-dark">	
		<img src="/takotmain.png" width="300">
		<h4 class="font-weight-bold">Order Tracking System</h4>
</div>

			
	<br>
	<div class=container>
		<form:errors path="userReg.*" element="p" cssClass="alert alert-danger"/>
		<c:out value="${success}" escapeXml="false"/>
		<c:out value="${error}" escapeXml="false"/>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col">
				<h2 class="h2 border-bottom border-dark text-center">Register</h2>
				
				<form:form action="/register" method="POST" modelAttribute="userReg">
				
					<p>
						<form:label path="firstName" cssClass="h4 bg-dark text-white font-weight-bold">Name</form:label>
						<form:input path="firstName" cssClass="form-control border border-secondary col-8"/>
					</p>
					<p>
						<form:label path="lastName" cssClass="h4 bg-dark text-white font-weight-bold">Last Name</form:label>
						<form:input path="lastName" cssClass="form-control border border-secondary col-8"/>
					</p>
					<p>
						<form:label path="email" cssClass="h4 bg-dark text-white font-weight-normal font-weight-bold">E-Mail</form:label>
						<form:input path="email" cssClass="form-control border border-secondary col-8"/>
					</p>
					<p>
						<form:label path="password" cssClass="h4 bg-dark text-white font-weight-normal font-weight-bold">Password</form:label>
						<form:input path="password" type="password" cssClass="form-control border border-secondary col-8"/>
					</p>
					<p>
						<form:label path="passwordConfirmation" cssClass="h4 bg-dark text-white font-weight-normal font-weight-bold">Confirm Password</form:label>
						<form:input path="passwordConfirmation" type="password" cssClass="form-control border border-secondary col-8"/>
					</p>
					<br>
					
						<Button type="submit" class="btn btn-dark">Register</Button>
					
					
					
					
				</form:form>
			</div>
			<div class="col">
				<h2 class="h2 border-bottom border-dark text-center">Login</h2>
				<form method="POST" action="/Login">
					<p>
						<label class="h4 bg-dark text-white font-weight-bold">Email</label>
						<input class="h4 text-dark font-weight-normal form-control border border-secondary col-8" type="text" name="email">
					</p>
					<p>
						<label class="h4 bg-dark text-white font-weight-bold">Password</label>
						<input class="h4 text-dark font-weight-normal form-control border border-secondary col-8" type="password" name="password">
					</p>
					
						<Button type="submit" class="btn btn-dark">Login</Button>
					
				</form>
			</div>
			
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</body>
</html>