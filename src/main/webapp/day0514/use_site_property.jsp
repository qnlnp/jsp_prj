<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= site_name %></title>
<c:import url="${url}/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #container > div > span{ font-weight: bold; color: black}
 #container > div { color: blue}
</style>
<script type="text/javascript">
$(function(){

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
	<span>url: </span><c:out value="${ url }"/><br>
	<span>urlPrev: </span><c:out value="${ urlPrev }"/><br>
<%-- 	<span>uploadURL: </span><c:out value="${ uploadURL }"/><br> --%>
<%-- 	<span>logo: </span><c:out value="${ logo }"/><br> --%>
	</div>
	<hr>
	<div>
	<span>url: </span><%=url %><br>
	<span>urlPrev: </span><%=urlPrev %><br>
<%-- 	<span>uploadURL: </span><%=uploadURL %><br> --%>
<%-- 	<span>logo: </span><%=logo %><br> --%>
	
	</div>
	
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="${url}/common/jsp/footer.jsp"/>
</footer>
</body>
</html>