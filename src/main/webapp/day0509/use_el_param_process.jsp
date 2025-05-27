<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL로,,, 웹 파라미터 간결하게 받기"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0508/usebean_param_process.jsp</title>
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
<%-- <jsp:setProperty property="*" name="param"/> --%>


<style>
ul > li{font-size: 30px;}
ul > li > label{font-weight: bold;}
</style>

<h3>HTML Form Control의,,, name속성값이 유일할 때</h3><br>
<h3>param이라는 이름의 객체를 활용하게 된다~~</h3><br>

<ul>
<li><label>text : </label>${ param.txt }</li><!-- <input type="text" name="txt" -->
<li><label>text : </label>${ param.age }</li>
<li><label>password : </label>${ param.pass }</li>
<li><label>file : </label>${ param.file }</li>
<li><label>hidden : </label>${ param.hid }</li>
<li><label>checkbox : </label>${ param.flag }</li>
<li><label>select : </label>${ param.sel }</li>
<li><label>textarea : </label>${ param.ta }</li>
<li><label>checkbox여러개: </label>
${ paramValues.lang }<br>
${ paramValues.lang[0] }
${ paramValues.lang[1] }

</li>
<!--
<li><label>text</label> : <jsp:getProperty name ="param" property="txt"/></li>
<li><label>age</label> : <jsp:getProperty name ="param" property="age"/></li>
<li><label>password</label> : <jsp:getProperty name ="param" property="pass"/></li>
<li><label>file</label> : <jsp:getProperty name ="param" property="file"/></li>
<li><label>hidden</label> : <jsp:getProperty name ="param" property="hid"/></li>
<li><label>checkbox 하나</label> :<jsp:getProperty name ="param" property="flag"/></li>
<li><label>select</label> : <jsp:getProperty name ="param" property="sel"/></li>
<li><label>textarea</label> : <jsp:getProperty name ="param" property="ta"/></li>
<li><label>checkbox여러개</label> :<jsp:getProperty name ="param" property="lang"/></li>
 -->
 
 



</ul>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>