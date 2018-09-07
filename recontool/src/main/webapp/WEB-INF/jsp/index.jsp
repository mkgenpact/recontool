<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/recon.js"></script>
  <link rel="stylesheet" href="css/recon.css">
  <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
  <script  src="js/jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
	<span style="font-size: 20px">Recon Tool</span>
	</div>
	<div class="jumbotron">
		<form>
		  <div class="form-group">
		    <label for="reconFile">Recon File</label>
		    <select id="reconFileId">
		    	<option>File1</option>
		    	<option>File2</option>
		    	<option>File2</option>
		    </select>
		  </div>
		  <div class="form-group">
		    <label for="tradeId">Trade Id:</label>
		    <input type="text" class="form-control" id="tradeId">
 		  </div>
 		   <div class="form-group">
		    <label for="cpId">Counterparty Id:</label>
		    <input type="text" class="form-control" id="counterPartyId">
 		  </div>
		  <button type="button" id="submitId" class="btn btn-default">Submit</button>
		</form>
	</div>
	<div id="view" class="content">
	</div>
	<div id="breakView" class="content">
	</div>
</div>

</body>
</html>
