<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope의 사용"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0508/use_scope.jsp</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 span{ background-color: #E7C059; font-weight: bold}
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

<jsp:useBean id="counter" class="day0508.Counter" scope="page"/>
<jsp:setProperty name="counter" property="cnt" value="1"/>

<jsp:useBean id="counter2" class="day0508.Counter" scope="request"/>
<jsp:setProperty name="counter2" property="cnt" value="1"/>

<jsp:useBean id="counter3" class="day0508.Counter" scope="session"/>
<jsp:setProperty name="counter3" property="cnt" value="1"/>

<jsp:useBean id="counter4" class="day0508.Counter" scope="application"/>
<jsp:setProperty name="counter4" property="cnt" value="1"/>

<h2>당신은 이 페이지에
<span><jsp:getProperty name="counter" property="cnt"/></span>번째 방문자이십니다.
<jsp:forward page="req.jsp"></jsp:forward><!-- forward로 이동하는 req.jsp -->
</h2>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>