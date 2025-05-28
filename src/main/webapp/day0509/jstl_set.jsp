<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL의 사용(Core)"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 어차피 리다이렉트된다 = 태그 식별을 위한 uri --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0509/jstl_set.jsp</title>
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
JSTL Core 변수선언<br>
<c:set var="name" value="이장훈"/>
<c:set var="msg" value="<strong>산은 산이요 물은 물이로다</strong>"/>
<c:set var="age" value="25"/>

<strong>출력</strong><br>
${ name }<br>
${ msg }<br>
<!--  -->
<c:out value="${ name }"></c:out><br>
<c:out value="${ msg }"></c:out><br>
<c:out value="${ msg }" escapeXml="false"></c:out><br>
<!--  -->
<input type="text" name="name" value="<c:out value="${ name }" escapeXml="false"></c:out>"/><br>
<input type="text" name="name" value="${ name }"/><br>
나이: <c:out value="${ age }"/><br>
나이: <c:out value="${ age }"/><br>
<c:remove var="age"/>
c:remove로 변수 삭제 후의,,, 출력<br>



</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>