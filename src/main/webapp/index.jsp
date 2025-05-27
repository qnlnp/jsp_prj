<%@page import="kr.co.sist.member.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
    
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #container > a {text-decoration: none; font-size: 20px; margin-right:20px}
 
 #loginInfo{font-size:28px; font-weight: bold}
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

<c:choose>
<c:when test="${ empty sessionScope.userData }">
<a href="http://192.168.10.88/jsp_prj/login/login_frm.jsp">로그인</a>
</c:when>
<c:otherwise>
<div><span style="font-size:12px">${ sessionScope.userData }</span></div>
<hr>
<span id="loginInfo">
<c:out value="${ userData.name }"/><span style="font-weight: normal; font-size: 16px">님 안녕하세요?????</span><br>
<a href="http://192.168.10.88/jsp_prj/mypage/mypage_index.jsp" style="text-decoration: none"><c:out value="${ userData.email }"/></a><br>
</span>
<hr>
<a href="http://192.168.10.88/jsp_prj/login/logout.jsp">로그아웃</a>
<a href="http://192.168.10.88/jsp_prj/board/board_list.jsp">게시글보기</a><br>
<a href="http://192.168.10.88/jsp_prj/place/restaurant_list.jsp">맛집리스트</a><br>
<hr>
</c:otherwise>
</c:choose>
<!-- <a href="http://192.168.10.88/jsp_prj/login/login_frm.jsp" id="hrefLogin">로그인</a> -->
<a href="http://192.168.10.88/jsp_prj/place/write_rest_frm.jsp">맛집등록</a>
<a href="http://192.168.10.88/jsp_prj/member/member_frm.jsp">회원가입</a>
<a href="http://192.168.10.88/jsp_prj/member/member_list.jsp">회원목록</a>
<a href="http://192.168.10.88/jsp_prj/file/file_list.jsp">파일목록</a>
<a href="#void">상품소개</a>
<a href="#void">영화소개</a>
</div><!--container-->

</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>