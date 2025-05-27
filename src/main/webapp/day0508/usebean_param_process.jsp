<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean으로,,, 웹 파라미터 한방에 받기(개별은 Parameter로~)"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0509/use_el_param_process.jsp</title>
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
request.setCharacterEncoding("UTF-8");
%>

<!-- 객체생성 및 사용 범위설정 -->
<jsp:useBean id="param" class="day0508.Param" scope="page"/>
<!-- setter method호출 모든 파라메터 받기 -->
<jsp:setProperty property="*" name="param"/>

<style>
ul > li{font-size: 30px;}
ul > li > label{font-weight: bold;}
</style>
<%-- <%= param %> --%>
<ul>
<li><label>text</label> : <jsp:getProperty name ="param" property="txt"/></li>
<li><label>age</label> : <jsp:getProperty name ="param" property="age"/></li>
<li><label>password</label> : <jsp:getProperty name ="param" property="pass"/></li>
<li><label>file</label> : <jsp:getProperty name ="param" property="file"/></li>
<li><label>hidden</label> : <jsp:getProperty name ="param" property="hid"/></li>
<li><label>checkbox 하나</label> :
<!-- 체크박스가 하나인경우 check되면 value, 안돼있으면 null -->
<jsp:getProperty name ="param" property="flag"/></li>
<li><label>select</label> : <jsp:getProperty name ="param" property="sel"/></li>
<li><label>textarea</label> : <jsp:getProperty name ="param" property="ta"/></li>
<li><label>checkbox 여러개</label> :
<jsp:getProperty name ="param" property="lang"/></li>
<li><%= Arrays.toString(param.getLang()) %></li>
<li>
<% String[] lang = param.getLang();
	if(lang != null ){ 
	for(int i=0; i < lang.length; i++){%>
	<span style="background-color: <%= i%2==0?"#E7C059":"#5A90D0"%>"><%= lang %></span><br>
	<%}//end for
	}else{ %>
	<span style="color: #cccccc">체크박스 선택을 안하셨습니다.</span>
<%}//end else %>
</li>

</ul>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>