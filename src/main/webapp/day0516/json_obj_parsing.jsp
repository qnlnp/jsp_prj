<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0516/json_obj_parsing.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px }
 th{width: auto}
 a{ text-decoration: none; font-weight: bold}
</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$.ajax({
// 			url:"http://localhost:80/jsp_prj/day0515/json_obj2.jsp", 
			url:"http://192.168.10.88/jsp_prj/day0515/json_obj2.jsp", 
			type:"GET",
			dataType:"JSON",
			error:function( xhr ){
				alert("문제발생 잠시 후 다시시도");
				console.log( xhr.status );
			},
			success: function( jsonObj ){
				//부가적인 정보
				$("#deptCnt").html( jsonObj.dataLength );
				$("#createDate").html( jsonObj.pubDate );
				
				$("#deptTab > #body").empty();
				//데이터 
				if( !jsonObj.resultFlag ){
					$("#deptTab > #body").append(
				"<tr><td colspan='3'>부서정보가 존재하지 않습니다.</td></tr>")
				}//end if
				
				$.each( jsonObj.data, function( i, jsonTemp ){
					createTr="<tr><td><a href='javascript:searchEmp("+
					jsonTemp.deptno+")'>"+jsonTemp.deptno+"</a></td><td>"+
					jsonTemp.deptname+
					"</td><td>"+jsonTemp.loc+"</td></tr>";
					
					$("#deptTab > #body").append( createTr );
				} );
				
			}
		});//ajax
	});//click
});//ready

function searchEmp( deptno ){
	var param={ deptno: deptno };
	
	$.ajax({
		url:"ajax_emp_json.jsp",
		type:"POST",
		data: param,
		dataType: "JSON",
		error: function( xhr ){
			alert("잠시 후 다시 시도");
			console.log( xhr.status+", "+xhr.statusText );
		},//error
		success: function( jsonObj ){ 
			$("#deptnoId").html( deptno );//html
			$("#deptnoId").css("color", "blue");//css
			
			$("#empTab > #body").empty();//empty
			
			if( !jsonObj.resultFlag ){
				$("#empTab > #body")
				.append("<tr><td colspan='6'>사원이 존재하지 않습니다.</td></tr>");
			}//end if
			
			var createTr;
			$.each(jsonObj.data,function(i, jsonTemp){
				createTr="<tr><td>"+(i+1)+"</td><td>"+jsonTemp.empno
				+"</td><td>"+jsonTemp.ename+"</td><td>"
				+jsonTemp.job+"</td><td>"+jsonTemp.hiredate+"</td><td>"+
				jsonTemp.sal+"</td></tr>";
				
				$("#empTab > #body").append(createTr);
			});//each
		}//success
	});//ajax
	
}//searchEmp

</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<input type="button" value="부서정보 조회하기" class="btn btn-dark" id="btn">
<hr>
<div>
<h2><span id=""></span>부서 정보</h2>
<strong>부서수</strong>: <span id="deptCnt"></span><br>
<strong>데이터생성일</strong> : <span id="createDate"></span><br>
</div>
<div style="width: 360px">
<table id="deptTab" class="table table-hover table-bordered">
	<thead class="table table-secondary">
	<tr>
	<th style="width:60px">번호</th>
	<th style="width:150px">부서번호</th>
	<th style="width:150px">위치</th>
	</tr>
	</thead>
	<tbody id="body"></tbody>
</table> 
</div>
<hr><!-- 02-3411-5181, 010-2461-5633 피싱범 -->
<div style="height: 400px">
<!-- 	<h2>[<span id="deptno"></span>]번 부서의,,, 사원 정보</h2> -->
	<h2>해당 부서( where deptno=<span id="deptnoId"></span> )의,,, 사원 정보</h2>
	<div style="width: 900px">
		<table id="empTab" class="table table-hover table-bordered">
		<thead class="table table-secondary">
		<tr>
		<th>번호</th>
		<th>사원번호(empno)</th>
		<th>사원명(ename)</th>
		<th>직무(job)</th>
		<th>입사일(hiredate)</th><!-- 입사일: 백엔드에서 처리 잘해줘야 한다~ -->
		<th>연봉(sal)</th>
		</tr>
		</thead>
		<tbody id="body"></tbody>
		</table>
	</div>
</div>
<hr>
<!-- 그리고,,, 백엔드 프로그래밍 잘 하면 된다~~ -->
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>