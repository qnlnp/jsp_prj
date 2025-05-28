<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%
String id = request.getParameter("id");
MemberService ms = new MemberService();
boolean idFlag = !ms.searchId(id);
%>    
{ "idFlag":<%= idFlag %>}