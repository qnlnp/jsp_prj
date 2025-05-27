<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="분기"%>

<%
request.setCharacterEncoding("UTF-8");
%>   

<%
String serverName = request.getServerName();
String movePage = "eng.jsp";
String lang="English";

//스콥객체에,,, 속성설정해 값을전달할 수 있다.
request.setAttribute("ip", request.getRemoteAddr());
if("localhost".equals(serverName) ){
	movePage="kor.jsp";
	lang="한국어";
	
}//end if
%>

<!-- 파라미터없이 이동하는 관점
<jsp:forward page="<%= movePage %>"/>
 -->
 
<!-- 파라미터를 생성해서,,, 이동하는 관점 -->
<jsp:forward page="<%= movePage %>"/>
	<jsp:param value="<%= lang %>" name="language"/>
</jsp:forward>

