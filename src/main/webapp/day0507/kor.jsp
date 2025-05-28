<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0507/kor.jsp</title>
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
<h1>한국어 페이지(kor.jsp) 입니다~~</h1>
이름: <%= request.getParameter("name") %><br>
나이: <%= request.getParameter("age") %><br>
<%-- 이전페이지에서,,, <jsp:param value="<%= lang %>" name="language"/>로 받은 것,,, --%>
언어: <%= request.getParameter("language") %><br>
접속: <%= request.getAttribute("ip") %><br>
<a href="javascript:history.back()">뒤로가기</a>
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>