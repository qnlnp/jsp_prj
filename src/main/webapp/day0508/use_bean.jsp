<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean 액션태그를 사용해보자"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0508/use_bean.jsp</title>
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
<!-- jsp액션태그로,,, 객체생성과 scope설정을 한번에 할 수 있다. -->

<jsp:useBean id="dDTO" class="day0508.DataDTO" scope="page"/>
<%-- <jsp:useBean id="dDTO" class="day0508.DataDTO" scope="request"/> --%>
<%-- <jsp:useBean id="dDTO" class="day0508.DataDTO" scope="session"/> --%>
<%-- <jsp:useBean id="dDTO" class="day0508.DataDTO" scope="application"/> --%>

<!-- setter method호출 -->
<jsp:setProperty name="dDTO" property="name" value="이장훈"/>
<jsp:setProperty name="dDTO" property="myAge" value="25"/>


<h4>useBean JSP액션태그로,,, DataDTO 접근하기. </h4>
<h4>setProperty와 getProperty를 활용한다.</h4>
<h4><%= dDTO %></h4>
<hr>
<!-- getter method호출은,,, Web Browser로 바로 출력된다. -->
<h4>getProperty는,,, 바로 렌더링된다~</h4>
<h4>이름: <jsp:getProperty name="dDTO" property="name"/></h4>
<h4>나이: <jsp:getProperty name="dDTO" property="myAge"/></h4>
<hr>
<%
	out.print(dDTO);
	out.println("<br>");
	//	<jsp:useBean으로 생성된객체는,,, Java Code에서도 사용할 수 있다.
	dDTO.setName("양준수");
	dDTO.setMyAge(26);
%>
이름: <%= dDTO.getName()%>
나이: <%= dDTO.getMyAge()%>
<hr>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>