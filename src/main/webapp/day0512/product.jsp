<%@page import="java.util.List"%>
<%@page import="day0512.ProductService"%>
<%@page import="day0512.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0512/product.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: auto; margin-top: 30px; margin-left: 20px;
 			display: flex; }
 #container > #content{border: 1px solid #333; margin:20px;}
 #content > div > span{font-weight: bold; color:black}
 #content > div {font-size: 18px; color:blue}
 #content > div > img{width: 160px; height: 120px}
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

<%
List<ProductDTO> prdList = new ProductService().searchPrd();
//scope객체를 통해야 한다.
pageContext.setAttribute("prdList", prdList);

%>
<div id="container">
<c:forEach var="prd" items="${ prdList }" varStatus="i">
<div id="content">
<%-- 	<img src="http://192.168.10.88/jsp_prj/common/images/${ prd.img }"/> --%>
	<div><img src="http://192.168.10.88/jsp_prj/common/images/${ prd.img }"/></div>
	<div><span>상품번호: </span><c:out value="${ prd.num }"/></div>
	<div><span>상품코드: </span><c:out value="${ prd.code }"/></div>
	<div><span>상품이름: </span><c:out value="${ prd.prd }"/></div>
	<div><span>상품가격: </span><fmt:formatNumber value="${ prd.price }" pattern="###,###,###"></fmt:formatNumber>원</div>
	<div><span>등록: </span><fmt:formatDate value="${ prd.date }" pattern="yy-MM-dd hh:mm:ss"></fmt:formatDate></div>
	
</div>
</c:forEach>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>