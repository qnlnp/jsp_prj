<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0512/jstl_exception.jsp</title>
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

<c:catch var="e">
<% String msg = "JSP Standard Tag Library";
	String cls="java.lang.String";
	if(new Random().nextBoolean()){
		cls="java.lang.String1";
	}//end if
	Class.forName(cls);
%>
<%= msg %>
</c:catch>
<%-- <c:if test="${ e != null }"> --%>
<%-- <c:if test="${ e ne null }"> --%>
<c:if test="${ not empty e }">
<h2 style="color: red">문제가 발생하였습니다.<br>잠시후에 다시시도 해주세요!!!</h2>
</c:if>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>