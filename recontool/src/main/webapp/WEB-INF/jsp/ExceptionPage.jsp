<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
  <table class="table table-bordered table-striped">
    <thead>
      <tr class="success">
       <c:if test="${excCategoryId != 0}">
        <th></th>
        </c:if>
        <th>Trade ID</th>
        <th>Counter Party</th>
        <th>Status</th>
        <th>Attribute Name</th>
        <th>Attribute Value</th>
        <th>Exception Category</th>
        <th>Sub Category</th>
        <c:if test="${excCategoryId == 0}"><th>Action</th></c:if>
        <th>Acknowledgement Comments</th>
      </tr>
    </thead>
    <tbody id="myTable">
    <c:forEach items="${exceptions}" var="exception">
      <tr class="info">
       <c:if test="${excCategoryId != 0}">
       	<c:if test="${exception.comment ne '' && exception.comment != null}">
      		<td><input type="checkbox" disabled="disabled" alt="${exception.fileRowId}" id="checkBox" onclick="validateCategory('${exception.tradeid}','${exception.category}')"  name="${exception.tradeid}" /></td>
      	</c:if>
      	<c:if test="${exception.comment eq '' || exception.comment == null}">
      		<td><input type="checkbox" alt="${exception.fileRowId}" id="checkBox" onclick="validateCategory('${exception.tradeid}','${exception.category}')"  name="${exception.tradeid}" /></td>
      	</c:if>
      	</c:if>
      	<c:if test="${exception.comment ne '' && exception.comment != null}">
        	<td bgcolor="#808080"><font color="#FF0000"> <c:out value="${exception.tradeid}"></c:out> </font></td>
        </c:if>
        <c:if test="${exception.comment eq '' || exception.comment == null}">
        	<td><c:out value="${exception.tradeid}"></c:out></td>
        </c:if>
        <td><c:out value="${exception.counterpartyName}"></c:out></td>
        <td><c:out value="${exception.status}"></c:out></td>
        <td><c:out value="${exception.attributeName}"></c:out></td>
        <td><c:out value="${exception.attributeValue}"></c:out></td>
        <td><c:out value="${exception.category}"></c:out></td>
        <td><c:out value="${exception.subcat1}"></c:out><br /><c:out value="${exception.subcat2}"></c:out></td>
       <c:if test="${excCategoryId == 0}">
       	<td>
	       	<c:if test="${exception.comment ne '' && exception.comment != null}">
	       		<input type="button" disabled="disabled" alt="${exception.fileRowId}" id="${exception.tradeid}" name="${exception.action1}" value="${exception.action1}"/><br/>
	        	<input type="button" disabled="disabled" alt="${exception.fileRowId}" id="${exception.tradeid}" name="${exception.action2}" value="${exception.action2}"/>
	        </c:if>
	        <c:if test="${exception.comment eq '' || exception.comment == null}">
	       		<input type="button" alt="${exception.fileRowId}" id="${exception.tradeid}" name="${exception.action1}" value="${exception.action1}"/><br/>
	        	<input type="button" alt="${exception.fileRowId}" id="${exception.tradeid}" name="${exception.action2}" value="${exception.action2}"/>
	        </c:if>
        </td>
       </c:if>
       <td><c:out value="${exception.comment}"></c:out></td>
      </tr>
     </c:forEach>
     <c:if test="${excCategoryId != 0}">
     <tr class="warning" id="comulativeAction">
      	<td colspan="9"><input type="button" id="multi" value="${action1}" /> 
      	<input type="button" id="multi" value="${action2}" /></td>
      </tr>
      </c:if>
    </tbody>
  </table>
</div>