<%@page import="kr.co.sist.place.PlaceService"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="java.util.Random"%>
<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/jsp/login_chk.jsp" %>

<%--
LoginResultDTO ld = new LoginResultDTO();
ld.setId( new Random().nextBoolean()? "kim1234":"lee1234" );
session.setAttribute("userData", ld);//DB에서 꺼내와서,,, 세션에서 활용하는 관점
--%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rDTO" class="kr.co.sist.place.RestDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*"/>
<!-- 글작성자는,,, 세션에 있으니까~~ -->
<%
//useBean으로 입력되는 파라미터는,,,
rDTO.setId(((LoginResultDTO)session.getAttribute("userData")).getId());//나중에는 검증 빡시게 해야한다~~
rDTO.setIp(request.getRemoteAddr());//그냥 바로 쓰자~
// 이제 insert 만들러 가자~
// Service메소드까지 만들고,,,

PlaceService ps = new PlaceService();
pageContext.setAttribute("writeFlag", ps.writeRestaurant(rDTO));
//writeFlag -> 분기 나누려고~ 



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/write_process.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<script type="text/javascript">
<c:choose>
	<c:when test="${ writeFlag }">
	alert("맛집등록 성공!!!!");
	location.href="http://192.168.10.88/jsp_prj/place/restaurant_list.jsp";
	</c:when>
	<c:otherwise>
	alert("맛집등록 실패ㅜㅜㅜㅜㅜㅜ");
	history.back();
	</c:otherwise>
</c:choose>
</script>
</head>
<body>
</body>
</html>