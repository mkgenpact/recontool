<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<style>
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 75%;
}

th, td {
    padding: 15px;
}


</style>
</head>
<body>

<table>
  <tr>
    <th colspan="2" align="center">Recon file information</th>
  </tr>
  <tr>
    <td>Name</td>
    <td><c:out value="${recon.name}"></c:out></td>
  </tr>
  <tr>
    <td>Path</td>
    <td><c:out value="${recon.information}"></c:out></td>
  </tr>
  <tr>
    <td>RUN Schedule</td>
    <td><c:out value="${recon.runschedule}"></c:out></td>
  </tr>
  <tr>
    <td>Description</td>
    <td><c:out value="${recon.description}"></c:out></td>
  </tr>
</table>

</body>
</html>
