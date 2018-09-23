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
      	<th>Recon Id</th>
        <th>Recon Name</th>
        <th>Description</th>
        <th>Runschedule</th>
        <th>Information</th>
      </tr>
    </thead>
    <tbody>
   	 	<c:forEach items="${recons}" var="recon">
   	 	 <tr>
   	 	 	<td><a id="recondId"><c:out value="${recon.reconId}"></c:out></a></td>
   	 	 	<td>
             <button id="recondName"><c:out value="${recon.name}"></c:out></button>
            </td>
            <td>
            <c:out value="${recon.description}"></c:out>
            </td>
            <td>
            <c:out value="${recon.runschedule}"></c:out>
            </td>
            <td>
            <c:out value="${recon.information}"></c:out>
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
    $("#recondName").click(function(){
		var id ={id : $("#recondId").text()};
		$.get('/recontool/mainPage',id,function(data,status){
			$('#breakView').html(data);
		});
	});
} );
</script>

