<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/member_process.jsp</title>
<jsp:include page="../common/jsp/external_file.jsp"/>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>

<script type="text/javascript">
$(function(){
	
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
  <jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
//1. 한글처리
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mDTO" class="kr.co.sist.member.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="mDTO"/>
<%
	mDTO.setIp(request.getRemoteAddr());

	MemberService ms = new MemberService();
	
	//비연결성인 웹에서는,,, 한정적인자원을,,, 먼저선점하는 접속자이외에는,,,
	// "해당자원을 다른접속자가 사용중입니다"를 제공해야한다.
	boolean resourceFlag = ms.searchId( mDTO.getId() );
	
	if( !resourceFlag ){
		pageContext.setAttribute("addResult", ms.addMemeber(mDTO));
// 	pageContext.setAttribute("addResult", true);

%>

<c:choose>
<c:when test="${ addResult }">
<%-- 회원가입 성공했을때,, --%>
<div style="position: relative;">
	<div style="background: #FFFFFF URL('images/member_success.png'); position: relative; width:606px; height: 378px">
		<img src="images/member_success.png">
		<div style="position: absolute; top:140px; left:270px; font-size: 36px">
		<strong><c:out value="${ param.name }"/>님!</strong>
		</div>
		<div style="position: absolute; top:250px; left:270px; font-size: 25px">
		<a href="javascript:location.replace('http://192.168.10.88/jsp_prj/index.html')" class="btn btn-danger btn-sm">메인으로</a>
		</div>
	</div>
</div>
</c:when>

<c:otherwise>
<%-- 회원가입 실패했을때,, --%>
<h2>회원가입 실패입니다.</h2>
<img src="images/member_fail.png">
<h3>잠시후, 다시 시도해주세요.</h3>
<a href="http://192.168.10.88/jsp_prj/index.html">메인화면으로</a>
<a href="javascript:history.back()">다시 시도하기</a>
</div>
</c:otherwise>
</c:choose>
<%}else{ %>
	<c:out value="${ param.id }"/>은(는) 이미 사용중입니다ㅜㅜ<br>
	<a href="javascript:history.back()">다시 시도하기</a>
<%}//end if %>
</div>
</main>
<footer class="text-body-secondary py-5">
  <jsp:include page="../common/jsp/footer.jsp"/>
  
</footer>


</body>
</html>