<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@ page isErrorPage="true" %> 

<!DOCTYPE html>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Edit an Order</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>
<body style ="background: url('/edit2.png')no-repeat center center fixed;  background-size: cover;">

<form:form method="POST" action="/jobs/edit/${id}" modelAttribute="job">
    <form:label path="customer_name" cssClass = "h5 ml-5 mt-5 "><p class="text-black font-weight-bold">Name:</p>
        <form:errors path="customer_name"/>
        <form:input path="customer_name" cssClass="form-control ml-3 border border-secondary"/>
    </form:label>

    <form:label path="date_placed" cssClass = "h5 ml-5 mt-5"><p class="text-black font-weight-bold">Order Date:</p>
        <form:errors path="date_placed"/>
        <form:input path="date_placed"  cssClass="form-control ml-3 border border-secondary" type="date"/>
    </form:label>
	<br>
    <form:label path="job_type" cssClass = "h5 ml-5 mt-5"><p class="text-black font-weight-bold">Type of Job:</p>
        <form:errors path="job_type"/>
        <form:input path="job_type" cssClass="form-control ml-3 border border-secondary"/>
    </form:label>
  	
    <form:label path="order_description" cssClass = "h5 ml-5 mt-5"><p class="text-black font-weight-bold">Order Description:</p>
        <form:errors path="order_description"/>
        <form:input path="order_description" cssClass="form-control ml-3 border border-secondary"/>
    </form:label>
 	<br>
    <form:label path="material_status" cssClass = "h5 ml-5 mt-5"><p class="text-black font-weight-bold">Material Status:</p>
        <form:errors path="material_status"/>
        <form:input path="material_status" cssClass="form-control ml-3 border border-secondary"/>
    </form:label>
 	
    <form:label path="due_date" cssClass = "h5 ml-5 mt-5"><p class="text-black font-weight-bold">Due Date:</p>
        <form:errors path="due_date"/>
        <form:input path="due_date"  cssClass="form-control ml-3 border border-secondary" type="date"/>
    </form:label>
 	<br>
    <form:label path="status" cssClass = "h5 ml-5 mt-5"><p class="text-black font-weight-bold">Status:</p>
        <form:errors path="status"/>
        <form:input path="status" cssClass="form-control ml-3 border border-secondary"/>
    </form:label>
    <form:hidden value="false" path="completedStatus"/>
    <br>
    <br>
    <button input type="submit" value="Submit" class="btn btn-secondary ml-5">Edit Order</button>
    
</form:form>

<br>
<a href="/jobs"><button class="btn btn-secondary ml-5">Back</button>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>