<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%@page import="day0515.DeptService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"%>
<%= new DeptService().jsonObj() %>


