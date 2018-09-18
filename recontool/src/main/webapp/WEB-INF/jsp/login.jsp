<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/recon.css">
  <script src="js/query.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
</head>

<body style="background-color: rgb(255, 255, 255)">
<div class="container">
   <div class="logindiv">
    <form:form method="POST" modelAttribute="login">
   		 <h2 class="form-heading">Log in</h2>
   		<p><span style="background-color: green;">${message}</span></p>
    	<table  style="border-collapse: separate;border-spacing: 15px 20px;">
    	<tr>
    		<td><form:label path = "username">username</form:label></td>
    		<td><form:input path="username" class="form-control"/></td>
    	</tr>
    	<tr>
    		<td><form:label path = "password">password</form:label></td>
    		<td><form:password path="password"  class="form-control"/></td>
    	</tr>
    	<tr>
    	<td colspan="2">
    		<span style="background-color: red">${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    	</td>
    	</tr>
    	<tr>
    	<td>
    		<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
    	</td>
    	</tr>   
		</table>
    </form:form>
</div>
</div>
</body>
</html>




