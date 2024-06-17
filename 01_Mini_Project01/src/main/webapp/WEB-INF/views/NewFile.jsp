<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="df" %>

<html>

<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
<body>
<div class="container"></div>
<h3 class="pb-3 pb-3">Report Application</h3>
<div>
<form:form action="search" modelAttribute="search" method="POST">
	<table>
	<tr>
	<td>Plan Name:</td>
	<td>
	<form:select path="planName">
	<form:option value="">-Select-</form:option> 
	<form:options items="${names}"/>
	</form:select>
	</td>
	<td>Plan Status:</td>
	
	<td>
	<form:select path="planStatus">
	<form:option value="">-Select</form:option>
	<form:options items="${status}"/>
	</form:select>
	</td>
<td>Gender:	</td>
<td>
<form:select path="gender">
<form:option value="">-Select-</form:option>
<form:option value="Male">male</form:option>
<form:option value="Fe-Male">Fe-Male</form:option>
</form:select></td> 
</tr>
<tr>
<td>Start Date</td>
<td><form:input type="date" path="startDate"/></td>
<td>End Date:</td>
<td><form:input type="date" path="endDate"/></td>
</tr>
<tr>
<td><a href="/show" class="btn btn-Secondary">Reset</a></td></tr>


<tr>
<td>
<input type="submit" value="Search" class="btn btn-primary"/>
</td></tr>

	
	</table>
 
</form:form>
<hr/>
<table class="table table-striped table-hover">
<thead>
<tr>
<th>S/No </th>
<th>Holder Name</th>
<th>Gender</th>
<th>Plan Name</th>
<th>Plan Status</th>
<th>Start Date</th>
<th>End Date</th>
<th>Benefit Amt</th>
</tr>
</thead>
<tbody>
<df:forEach items="${plans}" var="plan" varStatus="index">
<tr>
<td>${index.count}</td>
<td>${plan.citizenName }</td>
<td>${plan.gender }
<td>${plan.planNames }</td>
<td>${plan.planStatus }</td>
<td>${plan.planStartDate }</td>
<td>${plan.planEndDate }</td>
<td>${plan.benifiAmmount }
</tr>
</df:forEach>
<tr>
<df:if test="${empty plans}">
<td colspan="8" style="text-align:center">No Records Found</td>
</df:if>

</tbody>


 
</table>
<hr/>
Export : <a  class="btn btn-primary" href="test">Excel</a>  <a class="btn btn-primary" href="pdf">Pdf</a>
</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
 integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
 crossorigin="anonymous"></script>
  </body>
</html>