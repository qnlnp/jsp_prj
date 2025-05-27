<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@page import="kr.co.sist.member.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
//세션에 존재하는 값 얻기
// String name=(String)session.getAttribute("name");

LoginResultDTO lrDTO = (LoginResultDTO)session.getAttribute("userData");

// if(name==null){
if(lrDTO==null){
// 	response.sendRedirect("http://192.168.10.88/jsp_prj/day0501/use_session_a.jsp");
	//세션에 값이 있을때
	response.sendRedirect("http://192.168.10.88/jsp_prj/index.html");
	return;
}//end if

--%>






<%
/////////////////////////////////////////////////////////////////////////////////

//	common/jsp/login_chk.jsp는 로그인 여부 파악하면서 아예 리다이렉트시켜버린다
//	비동기 -> 새로 만들어야 한다~

/////////////////////////////////////////////////////////////////////////////////



//세션에 존재하는 값 얻기
// String name=(String)session.getAttribute("name");

// LoginDTO lDTO = (LoginDTO)session.getAttribute("userData");

Object obj = session.getAttribute("userData");
// if(name==null){
if(obj==null){
// 	response.sendRedirect("http://192.168.10.88/jsp_prj/day0501/use_session_a.jsp");
	

	response.sendRedirect("http://192.168.10.88/jsp_prj/index.html"); 
	return;
}//end if
LoginResultDTO lDTO = (LoginResultDTO)obj;

%>


















