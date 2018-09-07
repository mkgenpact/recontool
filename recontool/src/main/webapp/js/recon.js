$(function(){
	var context ="/recontool"
	$("#submitId").click(function(){
		var fileName = $('#reconFileId').val();
		var tradeId = $('#tradeId').val();
		var cpId = $('#counterPartyId').val();
		var filterObj = new Object();
		filterObj.fileName = fileName;
		filterObj.tradeId = tradeId;
		filterObj.cpId = cpId;
		$.get(context+'/loadReconReports',filterObj,function(data,status){
			$('#view').html(data);
		})
});
	
});
