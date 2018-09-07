<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>

<h2>Exception category split</h2>

<table>
  <tr>
    <th>Total Number of breaks</th>
    <th>Count</th>
  </tr>
  <tr>
    <td>Exception Category split</td>
    <td><c:out value="${total}"></c:out></td>
  </tr>
  <tr>
    <td>SM Count</td>
    <td><c:out value="${smcount}"></c:out></td>
  </tr>
  <tr>
    <td>ST Count</td>
    <td><c:out value="${stcount}"></c:out></td>
  </tr>
  <tr>
    <td>AM Count</td>
    <td><c:out value="${amcount}"></c:out></td>
  </tr>
</table>

</body>
</html>