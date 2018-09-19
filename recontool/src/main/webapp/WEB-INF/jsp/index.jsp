<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <!--  <link rel="stylesheet" href="css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/recon.js"></script>
  <link rel="stylesheet" href="css/recon.css">
  <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
  <script  src="js/jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<span>Recon Resolution Tool</span>
	</div>
	<div id="logout">
		<span class="glyphicon glyphicon-user"><a href="/recontool/logout" id="logoutMain">LogOut</a></span>
	</div>
	<div class="greeting">${username}</div>
	<div class="jumbotron">
		<!-- <form>
		  <div class="form-group">
		    <label for="reconFile">Recon File</label>
		     <div class="autocomplete" style="width:300px;">
    			<input id="reconSearchId" type="text" name="reconSearch" placeholder="recons">
  			</div>
  			<button type="button" id="submitId" class="btn btn-default">Submit</button>
		  </div>
		</form> -->
		
		<form>
		    <label for="reconFile">Recon File</label>
  			<input list="browsers" name="browser" id="reconSearchId" placeholder="type to search recons file">
			  <datalist id="browsers">
			    <c:forEach var="recon" items="${recons}">
	  				<option value="${recon.name}">
	  			</c:forEach>
			  </datalist>
  			<button type="button" id="submitId">Submit</button>
		</form>
		<!-- <form>
		  <label for="reconFile">Recon File</label>
		  <div class="autocomplete" style="width:300px;">
		    <input id="reconSearchId" type="text" name="reconSearch" placeholder="type to search recons file">
		  </div>
		  <button type="button" id="submitId">Submit</button>
		</form> -->
	</div>
	<div id="view" class="content">
	</div>
	<div id="breakView" class="content">
	</div>
</div>

</body>
</html>
