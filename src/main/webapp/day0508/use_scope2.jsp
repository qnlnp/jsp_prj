<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope의 사용2"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0508/use_scope2.jsp</title>
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

<jsp:useBean id="counter11" class="day0508.Counter" scope="application"/>
<jsp:setProperty name="counter11" property="cnt" value="1"/>

<h2>당신은 이 페이지에
<span><jsp:getProperty name="counter11" property="cnt"/></span>번째 방문자이십니다.
<% System.out.println(request.getRemoteAddr()); %>

<%
	int currentCnt = counter11.getCnt();
	
	int numOfRight = currentCnt%10;
	int numOfCenter = currentCnt/10;
	int numOfLeft = currentCnt/100;
	
	
%>
</h2>
<hr>
백의 자리: <%=numOfLeft %><br>
십의 자리: <%=numOfCenter %><br>
일의 자리: <%=numOfRight %><br>

<hr>
<div id="countDiv" style="display: flex">
	<div><img src="http://192.168.10.88/jsp_prj/day0508/image/num_<%= numOfLeft%>.png"></div>
	<div><img src="http://192.168.10.88/jsp_prj/day0508/image/num_<%= numOfCenter%>.png"></div>
	<div><img src="http://192.168.10.88/jsp_prj/day0508/image/num_<%= numOfRight%>.png"></div>
</div>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>