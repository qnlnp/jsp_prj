<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="member_frm.jsp에서,,, jsp useBean액션태그 적용하기"%>
    
<!-- 객체생성 및 사용 범위설정 -->
<jsp:useBean id="paramInstance" class="day0508.MemberFormDTO" scope="session"></jsp:useBean>
<!-- setter method호출 모든 파라메터 받기 -->
<jsp:setProperty name="paramInstance" property="*" />

<%--
	String inputIdParam = request.getParameter("idInputText");
	String inputPassParam = request.getParameter("passInputText");
	String inputNameParam = request.getParameter("nameInputText");
	String inputBirthParam = request.getParameter("birthInputText");
	String inputContactParam = request.getParameter("contactInputText");
	String inputCallParam = request.getParameter("callInputText");
	
	String inputEmailLeftParam = request.getParameter("emailLeftInputText");
	String inputEmailRightParam = request.getParameter("emailRightInputText");
	
	String inputDomainParam = request.getParameter("domain");
	
	String inputZipcodeParam = request.getParameter("zipcode");
	String inputAddrParam = request.getParameter("addr");
	String inputAddr2Param = request.getParameter("addr2");
	
	String inputPrParam = request.getParameter("prInputText");
	
--%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
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

아이디: <jsp:getProperty name="paramInstance" property="idInput"/><br>
비밀번호: <jsp:getProperty name="paramInstance" property="passInput"/><br>
이름: <jsp:getProperty name="paramInstance" property="nameInput"/><br>
생일: <jsp:getProperty name="paramInstance" property="birthInput"/><br>
연락처: <jsp:getProperty name="paramInstance" property="contactInput"/><br>
휴대폰: <jsp:getProperty name="paramInstance" property="callInput"/><br>
이메일: <jsp:getProperty name="paramInstance" property="emailLeftInput"/><br>
이메일주소: <jsp:getProperty name="paramInstance" property="emailRgihtInput"/><br>
지역: <jsp:getProperty name="paramInstance" property="domain"/><br>
우편번호: <jsp:getProperty name="paramInstance" property="zipcode"/><br>
주소: <jsp:getProperty name="paramInstance" property="addr"/><br>
나머지주소: <jsp:getProperty name="paramInstance" property="addr2"/><br>
자기소개: <jsp:getProperty name="paramInstance" property="prInput"/><br>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>