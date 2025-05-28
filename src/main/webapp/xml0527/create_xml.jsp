<%@page import="xml0527.CreateXML"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
    info="JSP"%>
<%
CreateXML cXML = new CreateXML();
cXML.createXML2(out);
%>
