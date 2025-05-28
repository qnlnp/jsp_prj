<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import url="${ url }/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
 
<script type="text/javascript">
$(function(){

	$("#btnQuery").click(function(){
		//web parameter를 QueryString 형식으로 만들어 전송
		//매개변수명은 HTML Form Control과 같지 않아도 상관 없다.
		var param="name="+$("#name").val()+"&myAge="+$("#age").val();
		
		$.ajax({
			url:"ajax_param_process.jsp",
			type:"GET",
			data : param,
			dataType:"JSON",
			error:function( xhr ){
				console.log( xhr.status );
			},
			success : function( jsonObj ){
				$("#output").html( jsonObj.msg+"<br>태어난 해 : "+jsonObj.birth);
			}
		});//ajax
	});//click
	
	$("#btnJson").click(function(){
		//web parameter를 JSONObject 형식으로 만들어 전송
		
	});//click
	
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${ url }/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">

<input type="text" name="name" id="name" placeholder="이름"/>
<input type="text" name="age" id="age" placeholder="나이"/><br>
<input type="button" value="QueryString" id="btnQuery" class="btn btn-success"/>
<input type="button" value="JSONObject" id="btnJson" class="btn btn-info"/>

<div id="output"></div>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="${ url }/common/jsp/footer.jsp"/>
</footer>


</body>
</html>