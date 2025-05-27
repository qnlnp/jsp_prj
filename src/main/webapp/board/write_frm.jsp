<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/jsp/login_chk.jsp" %>

<%--
LoginResultDTO ld = new LoginResultDTO();
ld.setId("kim1234");
session.setAttribute("userData", ld);//DB에서 꺼내와서,,, 세션에서 활용하는 관점
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/write_frm.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold }
 
 td{padding-top:10px; padding-bottom:20px}
</style>
<script type="text/javascript">

$(function(){
	$('#summernote').summernote({
	  placeholder: '싸질러보아요~~',
      tabsize: 2,
      height: 240,
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['picture']]
      ]
	});
	
	$("#btnWrite").click(function(){
		//제목, 내용 등 필수 입력사항에 대한,,,
		//혹독한 유효성 검증을 거치고,,,
		var subject=$("#subject").val()
		if( subject.trim() == "" ){
			// trim없었을때는,,,
			//subject.replace(/ /g,)==""
			//이렇게 정규식 썼다~~
			alert("제목은,,, 필수입력!!!!!!!!");
			return;
		}//end if
		$("#writeFrm").submit();//submit
	});//click
	
});//ready

</script>

<!-- 250520_0936) https://summernote.org/getting-started/ : summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>

</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">글 작성하기</span></div><hr>
<div id="container">
<div id="writeWrap" style="width: 620px; margin:0 auto">
<div>
<!-- <form action="write_process.jsp" method="get" id="writeFrm"> -->
<form action="write_process.jsp" method="POST" id="writeFrm">

<table>
<tr><th colspan="2" style="text-align: center">
<h3>글작성</h3>
</th></tr>
<tr><th colspan="2" style="text-align: center; color: red">
<h5>작성 이후, 제목은 수정할 수 없습니다.</h5>
</th></tr>
<tr style="height:40px">
<td>제목</td>
<td><input type="text" name="subject" id="subject" style="width:520px; boarder: 1px solid #CDCDCD"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea id="summernote" name="content"></textarea></td>
</tr>
<tr>
<td>작성자 ID: </td>
<td><strong>lee1234</strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center">
<input type="button" value="글쓰기" id="btnWrite" class="btn btn-success btn-sm"/>
<a href="javascript:history.back()" class="btn btn-info btn-sm">뒤로</a>
</td>
</tr>
</table>

</form>
</div>

</div><!-- writeWrap -->
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>