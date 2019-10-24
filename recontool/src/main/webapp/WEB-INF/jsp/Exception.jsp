<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
<div>
	<div class="panel panel-default">
	  <div class="panel-body">
		<form class="form-inline" action="/action_page.php">
	     <div class="form-group">
	      <label for="sel1">Exception Category:</label>
	      <select class="form-control" id="exceptionId">
	       <option value="0">ALL</option>
	       <c:forEach items="${breakActions}" var="exp">
	        <option value="${exp.id}"><c:out value="${exp.name}"></c:out></option>
	       </c:forEach>
	      </select>
	      <button type="button" id="exceptionFilter" class="btn btn-info">Submit</button>
		</div>
	    <div class="form-group">
	    	<label for="sel1">Search:</label>
	    	<input class="form-control warning" id="myInput" type="text" placeholder="Search..">
	    </div>
	  </form>
	  </div>
	</div>
</div>
<div id="exceptionTable">
</div>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  $("#exceptionFilter").click(function(){
  	var category ={category : $("#exceptionId").val(),
  				   id : $("#recondId").text()};
  	  $.get('/recontool/loadException',category,function(data,status){
  			$('#exceptionTable').html(data);
  		});
    });
  $("#exceptionFilter").click();
});
var tradeids =[];
function validateCategory(tradeId, categroy){
	if($("#"+tradeId).prop('checked') == true){
		tradeids.push(tradeId);
	}else{
		tradeids.splice(tradeids.indexOf(tradeId),1);
	}
}
function validateChecked(){
	if(tradeids.length ==0){
		alert("please select minimum one checkbox to proceed");
	}
}

</script>
