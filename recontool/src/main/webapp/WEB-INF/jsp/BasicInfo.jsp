<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<style>
/* table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 75%;
}

th, td {
    padding: 15px;
} */
</style>
<div>
<table class="table table-bordered table-striped">
  <tr class="success">
    <th colspan="2" align="center">Recon file information</th>
  </tr>
  <tr class="info">
    <td>Name</td>
    <td><c:out value="${recon.name}"></c:out></td>
  </tr>
  <tr class="warning">
    <td>Path</td>
    <td><c:out value="${recon.information}"></c:out></td>
  </tr>
  <tr class="info">
    <td>RUN Schedule</td>
    <td><c:out value="${recon.runschedule}"></c:out></td>
  </tr>
  <tr class="warning">
    <td>Description</td>
    <td><c:out value="${recon.description}"></c:out></td>
  </tr>
   <tr class="info">
    <td>Browser file</td>
    <td>
    	<form method="POST" action="upload" enctype="multipart/form-data" >
            File:
            <input type="file" name="file" id="file" /> <br />
            Destination:
            <input type="text" value="C:\\" name="destination"/>
            <br />
            <input type="submit" value="Upload" name="upload" id="upload" />
        </form>
     </td>
  </tr>
</table>
</div>