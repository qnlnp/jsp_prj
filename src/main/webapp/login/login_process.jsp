<%@page import="kr.co.sist.member.login.LoginService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%-- <%@ include file="../common/site_config.jsp" %>     500에러코드 떠서,,, --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:import url="http://192.168.10.88/jsp_prj/common/jsp/post_chk.jsp"/> --%>
<jsp:useBean id="lDTO" class="kr.co.sist.member.login.LoginDTO" scope="page"/>
<jsp:setProperty name="lDTO" property="*"/>

<%
if("POST".equals(request.getMethod().toUpperCase())){
	LoginService ls = new LoginService();
// 	ls.loginProcess(lDTO, session); //로그인성공실패 다 이쪽으로 타고들어온다~
	boolean flag=ls.loginProcess(lDTO, session);
%>

{ "loginResult": <%= flag%> }
<%}//end if%>

<%-- { "result" : true, "method":"<%= request.getMethod() %>" }  --%>