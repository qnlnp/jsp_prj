<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%>
    <%
	String name="이장훈";
	int age=25;
	//객체를 사용하는걸 매우 권장한다~~
%>{ "name": "<%= name %>", "age": <%= age %>}


