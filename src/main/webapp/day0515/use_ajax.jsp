<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import url="${url}/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #output { font-size:30px; font-weight: bold; width: 1200px; height: auto; min-height: 300px;
 			border:1px solid #333; padding: 10px; padding-bottom: 10px}
 #outputPrev { font-size:24px; font-weight: bold; height: 40px; }
 #url { color: blue}
</style>
<script type="text/javascript">
$(function(){
	var data = "$.ajax({ ,,, }) url: ";
	
	$("#txt").click(function(){
		
		$.ajax({
			url:"http://localhost:80/jsp_prj/day0515/ajax.txt",
			type : "GET",
			
			dataType : "text",
			error:function( xhr ){
				$("#output").html("에러코드: "+ xhr.status+", 에러메시지: "+ xhr.statusText );
			},
			success: function( textData ){
				$("#detail").html( data );
				$("#url").html( "ajax.txt" );
				$("#output").html( "<strong>"+ textData+"</strong>" );
			}
		});//ajax
		
	});//click
	
	$("#html").click(function(){
		
		$.ajax({
			url:"http://localhost:80/jsp_prj/day0515/ajax.html",
			type : "GET",
			
			dataType : "html",
			error:function( xhr ){
				$("#output").html("에러코드: "+ xhr.status+", 에러메시지: "+ xhr.statusText );
			},
			success: function( htmlData ){
				$("#detail").html( data );
				$("#url").html( "ajax.html" );
				$("#output").html( htmlData );
			}
		});//ajax
		
	});//click
	$("#xml").click(function(){
		
		$.ajax({
			url:"http://localhost:80/jsp_prj/day0515/ajax.xml",
			type : "GET",
			
			dataType : "text", //서버에서 흘려보내는 데이터의 dataType
			error:function( xhr ){
				$("#output").html("에러코드 : "+ xhr.status+", 에러메시지 : "+ xhr.statusText );
			},
			success: function( xmlData ){ // [object XMLDocument]를,,, xml파싱해서 써야한다~~~~
				//xml파싱해보자~~~~~(dataType을 통해,,, 파서준비하겠지)
// 				$("#output").html();//html

				$("#detail").html( data );
				$("#url").html( "ajax.xml" );
				$("#output").html(
						"이름(ajax.xml의 name): "+$(xmlData).find("name").text()
						+"<br>"
						+"메시지(ajax.xml의 msg): "+$(xmlData).find("msg").text()
				);//html
			}
		});//ajax
		
	});//click
	
	$("#json").click(function(){
		$.ajax({
			url:"http://localhost:80/jsp_prj/day0515/ajax.json", 
			type:"GET",
			
			dataType:"JSON",
			error:function( xhr ){
				console.log( xhr.status );
			},
			success: function( jsonObj ){
				$("#detail").html( data );
				$("#url").html( "ajax.json" );
				//JSONObject을 Parsing
				$("#output").html(
						"xml파싱보다 간편하다~!"
						+"<br>"
						+jsonObj.name
						+", "
						+jsonObj.addr
						);//html
				/*
				$("#name").val( jsonObj.name );//val
				$("#addr").val( jsonObj.addr );//val
				*/
			}
			
		});
	});//click
});//ready

</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${url}/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
	<div>
	<input type="button" value="TEXT" class="btn btn-lg btn-outline-dark" id="txt"/>
	<input type="button" value="HTML" class="btn btn-lg btn-outline-dark" id="html"/>
	<input type="button" value="XML" class="btn btn-lg btn-dark" id="xml"/>
	<input type="button" value="JSON" class="btn btn-lg btn-dark" id="json"/>
	</div>
	<div id="outputPrev"><span id="detail"></span><span id="url"></span></div>
	<div id="output"></div>
	<!--
	<input type="text" name="name" id="name"/><br>
	<input type="text" name="addr" id="addr"/><br>
	 -->
	
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="${url}/common/jsp/footer.jsp"/>
</footer>
</body>
</html>