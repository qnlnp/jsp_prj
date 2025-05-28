<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0512/jstl_fmt.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
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
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<style>
h4{color:blue}
</style>
<%
int num=20_250_512;
pageContext.setAttribute("num", num);
%>
<h4>일반 숫자</h4>
<c:out value="${ num }"/>
<hr>
<h4>0 패턴</h4>
<fmt:formatNumber value="${ num }" pattern="0,000,000,000"></fmt:formatNumber>
<hr>
<h4># 패턴</h4>
<fmt:formatNumber value="${ num }" pattern="#,###,###,###"></fmt:formatNumber>
<hr>

<%
Date date=new Date();
pageContext.setAttribute("date", date);
%>
<h4>아무형식이없는 날짜</h4>
<c:out value="${ date }"/>
<hr>
<h4>yyyy-MM-dd H hh h(HH:KK:kk):mm:ss</h4>
<fmt:formatDate value="${ date }"
pattern="yyyy-MM-dd H hh h(HH:KK:kk):mm:ss"/>



</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>