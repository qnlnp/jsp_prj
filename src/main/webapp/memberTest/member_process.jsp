<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	pageContext.setAttribute("addResult", ms.addMemeber(mDTO));
%>

<c:choose>
<c:when test="${ addResult }">
<%-- 회원가입 성공했을때,, --%>

</c:when>
<c:otherwise>
<%-- 회원가입 실패했을때,, --%>

</c:otherwise>
</c:choose>
</div>
</main>
<footer class="text-body-secondary py-5">
  <jsp:include page="../common/jsp/footer.jsp"/>
  
</footer>


</body>
</html>