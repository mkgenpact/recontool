<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <br />
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>LE ID</th>
        <th>Trade ID</th>
        <th>Exception Category</th>
        <th>Sub Category</th>
        <th>Action</th>
        <th>Acknowledgement Comments</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td><c:out value="${exception.counterPartyId}"></c:out></td>
        <td><c:out value="${exception.tradeId}"></c:out></td>
        <td><c:out value="${exception.category}"></c:out></td>
        <td>Inactive in FO <br /> Active in Ref Data</td>
        <td><a>Update FO</a> <br /> <a>Update ref Data</a></td>
        <td>'Y/N' update in ref system</td>
      </tr>
      <tr>
            <td>ABC</td>
            <td>123</td>
            <td>SM</td>
            <td>Inactive in FO <br /> Active in Ref Data</td>
            <td><a>Update FO</a> <br /> <a>Update ref Data</a></td>
            <td>'Y/N' update in ref system</td>
          </tr>
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
