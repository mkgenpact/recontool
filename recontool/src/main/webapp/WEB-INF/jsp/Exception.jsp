<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
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
	       
<%--         <td><a><c:out value="${exception.action1}"></c:out></a> <br /> <a><c:out value="${exception.action2}"></c:out></a></td> --%>
        <td><input type="button" alt="${exception.fileRowId}" id="${exception.tradeid}" name="${exception.action1}" value="${exception.action1}"/><br/>
        <input type="button" alt="${exception.fileRowId}" id="${exception.tradeid}" name="${exception.action2}" value="${exception.action2}"/></td>
        <td><c:out value="${exception.comment}"></c:out></td>
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
