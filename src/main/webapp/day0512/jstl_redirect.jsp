<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	boolean flag=new Random().nextBoolean();
	pageContext.setAttribute("flag", flag);//이거로 세션이 있는지 파악해보자~
	
	/*
	if(flag){
		response.sendRedirect("jstl_if.jsp");
		return;//내장객체 쓸때 -> 다음 코드들 실행 막아야 한다(return; 필수)
	}//end if
	//jstl 리다이렉트는 안해도 된다~
	*/
	
%>

<c:if test="${ flag }">
<c:redirect url="jstl_if.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0512/jstl_redirect.jsp</title>
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

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
<%
System.out.println("---------------코드실행---------------");
%>
