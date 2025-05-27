<%@page import="kr.co.sist.cipher.DataDecryption"%>
<%@page import="kr.co.sist.cipher.DataEncryption"%>
<%@page import="java.util.Base64"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0514/md.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #container > div{color : blue}
 span{font-weight: bold; color:black}
 
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
<div id="container">
<%
String msg="1234";
String msg2="q1w2e3r4~";
//1. SHA(일방향 해시)를 생성할수있는 객체얻기
// MessageDigest md = MessageDigest.getInstance();//어떤 알고리즘 있는지 모르니까,,,
MessageDigest md1 = MessageDigest.getInstance("MD5");
MessageDigest md2 = MessageDigest.getInstance("SHA-1");
MessageDigest md3 = MessageDigest.getInstance("SHA-256");
MessageDigest md4 = MessageDigest.getInstance("SHA-512");
MessageDigest md5 = MessageDigest.getInstance("SHA-256");
//2. 일방향해시 설정
md1.update(msg.getBytes());
md2.update(msg.getBytes());
md3.update(msg.getBytes());
md4.update(msg.getBytes());

md5.update(msg2.getBytes());

//3. 얻기 : jsp 스크립틀렛에서,,, try-catch되고 있다~~~

String strMD5=new String(Base64.getEncoder().encode(md1.digest()));
String strSHA1=new String(Base64.getEncoder().encode(md2.digest()));
String strSHA256=new String(Base64.getEncoder().encode(md3.digest()));
String strSHA512=new String(Base64.getEncoder().encode(md4.digest()));
		
String str2SHA256=new String(Base64.getEncoder().encode(md5.digest()));	
%>

<div>
<h3>일방향 해시 적용하기</h3>
<span>MD5 </span><%= msg %><span> -> </span><%= strMD5 %><br>
<span>SHA-1 </span><%= msg %><span> -> </span><%= strSHA1 %><br>
<span>SHA-256 </span><%= msg %><span> -> </span><%= strSHA256 %><br>
<span>SHA-256 </span><%= msg2 %><span> -> </span><%= str2SHA256 %><br>
<span>SHA-512 </span><%= msg %><span> -> </span><%= strSHA512 %><br>
</div>
<hr>
<div>
<%
// sist_util.jar 제공(편하게 쓰라고)	
String encryption = DataEncryption.messageDigest("SHA-256", msg);		
	
//암호화
//키를 준비
String key="abcdefghijklmnop";//16자 이상의 키
DataEncryption de = new DataEncryption(key);//16자 이상의 복호화가능한 키를 준비하는 것(대칭키 기반)
String name = "이장훈";
String cipher=de.encrypt(name);

DataDecryption dd = new DataDecryption(key);
String plain = dd.decrypt(cipher);
		

%>
<h3>sist.util.jar 활용하기</h3>
<span>encryption: </span><%= encryption %><br>
<%-- <span>암호화된 문자열: </span><%= cipher %><br> --%>
암호화된 문자열 : <%= cipher %><br>
복호화된 문자열 : <%= plain%><br>
</div>
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>