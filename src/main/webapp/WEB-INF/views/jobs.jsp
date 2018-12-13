<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>Takotsubo Order List</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    

</head>


<body>
<a href="/logout"><button type="button" class="btn btn-dark btn-sm ml-2 mt-2">Logout</button></a>
<div>
<img style="position: relative; display: inline-block; left: 47%; transform: translate(-50%);" src ="/tako1.jpg" />
</div>
<h3 class ="ml-3">Welcome ${user.firstName}!</h3>
<h4 class ="ml-2"><img src="/tako2.jpg" width="40">ORDERS</h4>

<table class="table">
  <thead class="thead-dark">
    <tr class>
    	<th>Customer Name</th>
    	<th>Order Date</th>
    	<th>Type of Job</th>
    	<th>Order Description</th>
    	<th>Material Status</th>
    	<th>Due Date</th>
    	<th>Status/Notes </th>
    	<th>Actions</th>
    	
    </tr>
    
    <c:forEach items="${jobsFalse}" var="joby" varStatus="loop">
        <tr>

            <td><p class ="ml-3">${joby.customer_name}</p></td>
            <td><fmt:formatDate pattern = "MM-dd-yy" dateStyle = "short" value = "${joby.date_placed}" /></td>
            <td>${joby.job_type}</td>
            <td>${joby.order_description}</td>
            <td>${joby.material_status}</td>
            <td><fmt:formatDate pattern = "MM-dd-yy" dateStyle = "short" value = "${joby.due_date}" /></td>
            <td>${joby.status}</td>
            <td>
            	<a href="/jobs/delete/${joby.id}"><button class="btn btn-danger btn-sm">Delete</button></a> 
            	<a href="/jobs/edit/${joby.id}"><button class="btn btn-warning btn-sm">Edit</button></a> 
            	<form action="/complete" method="POST" class="d-inline-block">
            		<input type="hidden" name="complete" value="Complete">
            		<input type="hidden" name="orderId" value="${joby.id}">
            		<button type="submit" class="btn btn-success btn-sm">Complete</button>
            	</form>
            
            </td>
            
        </tr>
    </c:forEach>
    
</table>

<a href="/jobs/add/" class="btn btn-dark ml-2" role="button" aria-pressed="true">Add an Order</a>
<br>
<br>
<br>

<h3 class ="ml-2"><img src="/tako2.jpg" width="40">COMPLETED ORDERS</h3>
<table class="table">
  <thead class="thead-dark">
    <tr>
    	<th>Customer Name</th>
    	<th>Order Date</th>
    	<th>Type of Job</th>
    	<th>Order Description</th>
    	<th>Due Date</th>
    	<th>Status/Notes </th>
    	<th>Actions</th>
    	
    </tr>
    
    <c:forEach items="${jobsTrue}" var="joby" varStatus="loop">
        <tr>
            <td><p class ="ml-3">${joby.customer_name}</p></td>
            <td><fmt:formatDate pattern = "MM-dd-yy" dateStyle = "short" value = "${joby.date_placed}" /></td>
            <td>${joby.job_type}</td>
            <td>${joby.order_description}</td>
            <td><fmt:formatDate pattern = "MM-dd-yy" dateStyle = "short" value = "${joby.due_date}" /></td>
            <td>${joby.status}</td>
            <td>
            	<a href="/jobs/delete/${joby.id}"><button class="btn btn-danger btn-sm">Delete</button></a> 
            	<a href="/jobs/completeedit/${joby.id}"><button class="btn btn-warning btn-sm">Edit</button></a> 
            	<form action="/complete" method="POST" class="d-inline-block">
            		<input type="hidden" name="complete" value="Complete">
            		<input type="hidden" name="orderId" value="${joby.id}">
            		
            	</form>
            
            </td>
        </tr>
    </c:forEach>
    
</table>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>