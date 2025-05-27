<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ include file="../common/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0516/json_arr_parsing.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 
 #detailDiv { font-size:20px; margin-bottom: 10px}
 #info { font-weight: bold; height: 40px }
 #url { color: blue}
</style>
<script type="text/javascript">
$(function(){

	$("#btn").click(function(){
		$.ajax({
			url:"http://localhost:80/jsp_prj/day0515/json_array2.jsp", 
			type:"GET",
			dataType:"JSON",
			error:function( xhr ){
				alert(" id='btn' 오류~ ");
				console.log( xhr.status );
			},

			success:function( jsonArr ){
				
				
				var table=`
					<table class='table table-hover'>
					<thead>
					<tr><th>번호</th><th>부서번호</th><th>부서명</th><th>위치</th></tr>
					</thead>
					<tbody>`;
				
					
					$.each( jsonArr, function( i , jsonObj ){
						table+="<tr><td>"+ (i+1)+"</td><td>"+
							jsonObj.deptno+"</td><td>"+jsonObj.deptname+"</td><td>"
							+jsonObj.loc+"</td></tr>";
					} );
					
				table+=`</tbody>
					</table>`;
				$("#output").html( table );
			}		
			
		});//ajax
	});//click
	
	$("#btn2").click(function(){
		$.ajax({
			url:"http://localhost:80/jsp_prj/day0515/json_array2.jsp",
			dataType:"JSON",
			error:function( xhr ){
				alert(" id='btn2' 오류~  ");
				console.log( xhr.status );
			},
			success:function( jsonArr ){
				var createTr="";
				
				//기존의 행을 삭제 한 후 
				$("#deptTab > tbody").empty();
				
				//테이블의 tr을 채운다.
				$.each(jsonArr ,function( i, jsonObj){
					createTr="<tr><td>"+jsonObj.deptno+"</td><td>"+jsonObj.deptname+
					"</td><td>"+jsonObj.loc+"</td></tr>";
					
					$("#deptTab > tbody").append( createTr );
					
				});//each
			}
		});
	});//click
	
});//ready

</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div id="detailDiv"><span id="info">현재 site_config.jsp의 url: </span><span id="url">${ url }</span></div>
<input type="button" value="부서정보 조회하기" class="btn btn-primary" id="btn">
<input type="button" value="부서정보 조회하기" class="btn btn-dark" id="btn2">

<!--
1) 테이블자체를 만들어내는 관점 <div id="output">
2) 테이블에 데이터 출력하는 관점 
-->
<div id="output"></div>
<div style="width: 360px">
<table id="deptTab" class="table table-hover">
	<thead class="table table-light">
	<tr>
	<th style="width:60px">번호</th>
	<th style="width:150px">부서번호</th>
	<th style="width:150px">위치</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</div>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>