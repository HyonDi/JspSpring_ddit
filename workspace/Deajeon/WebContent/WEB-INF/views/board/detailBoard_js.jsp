<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
	window.opener.location.reload(true);
	
	var formObj = $("form[role='form']");

	$('button#modifyBtn').on('click',function(evnet){
	
		formObj.attr("action", "modifyForm.do");
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
	
		formObj.attr("action","remove.do");
		formObj.attr("method","post");
		formObj.submit();
	});
	
	$("#listBtn").on("click", function(){
		window.opener.location.reload(true);
		window.close();
	});
</script>
