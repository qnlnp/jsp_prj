<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0509/el_scope.jsp</title>
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
//1. 변수의 선언(나중에 model2에서는 안보인다(Service에서 튀어나온다) )
String msg="오늘은 비내리는 금요일~~";

//2. scope객체 할당
// pageContext.setAttribute("msg", msg);

pageContext.setAttribute("name", "이장훈");
request.setAttribute("name", "주현석");
session.setAttribute("name", "홍준성");
application.setAttribute("name", "유연수");
%>

<!-- 3. EL에서,,, scope객체를 사용하여 접근하게 된다~~!! -->
<%-- ${ msg }, ${ pageScope.msg }<br> --%>
<h3>
scope객체가,,, 동일한 속성명을 가질때,,,<br>
EL에서 scope객체를 생략하면,,, pageScope을 사용하게 된다.
</h3>
<hr>
<h3>가까운 scope객체를 출력하는 관점<br>
( pageContext > request > session > application )
</h3>
식별안된 name => ${ name }<br>
<hr>
<h3>식별해서 출력하는 관점</h3>
pageScope : ${ pageScope.name }<br>
requestScope : ${ requestScope.name }<br>
sessionScope : ${ sessionScope.name }<br>
applicationScope : ${ applicationScope.name }<br>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>