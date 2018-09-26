<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<body>

<div class="container">
  <br />
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Trade ID</th>
        <th>Counter Party ID</th>
        <th>Exception Category</th>
        <th>Sub Category</th>
        <th>Action</th>
        <th>Acknowledgement Comments</th>
      </tr>
    </thead>
    <tbody id="myTable">
    <c:forEach items="${exceptions}" var="exception">
      <tr>
        <td><c:out value="${exception.tradeid}"></c:out></td>
        <td><c:out value="${exception.counterpartyid}"></c:out></td>
        <td><c:out value="${exception.category}"></c:out></td>
        <td><c:out value="${exception.subcat1}"></c:out><br /><c:out value="${exception.subcat2}"></c:out></td>
	       
        <td><a><c:out value="${exception.action1}"></c:out></a> <br /> <a><c:out value="${exception.action2}"></c:out></a></td>
        
        <td>{Comments to be added by UI Path}</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</body>
</html>
