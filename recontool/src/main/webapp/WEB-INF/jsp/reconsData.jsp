<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<div class="panel panel-success" style="background-color: #a7c6eb">
<div class="panel-heading" style="background-color: #e9bb43">Recons</div>
  <div class="panel-body">
  <p>${message}</p>
  <table class="table table-bordered" id="reconTableId">
    <thead>
      <tr>
        <th>ReconName</th>
        <th>RecievedDate</th>
        <th>Source</th>
      </tr>
    </thead>
    <tbody>
   	 	<c:forEach items="${recons}" var="recon">
   	 	 <tr>
   	 	 	<td>
            <c:out value="${recon.reconFileName}"></c:out>
            </td>
            <td>
            <c:out value="${recon.recievedDate}"></c:out>
            </td>
            <td>
            <c:out value="${recon.source}"></c:out>
            </td>
           </tr>
        </c:forEach>
     <!--  <tr>
        <td>xyz</td>
        <td>23/07/2018</td>
        <td>ABC</td>
      </tr>
      <tr>
        <td>bcd</td>
        <td>23/07/2018</td>
        <td>DEG</td>
      </tr>
      <tr>
         <td>mef</td>
        <td>23/07/2018</td>
        <td>ABC</td>
      </tr> -->
    </tbody>
  </table>
  </div>
</div>
<script>
$(document).ready( function () {
    $('#reconTableId').DataTable();
} );
</script>

