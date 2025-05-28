<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="서버 컴퓨터의 정보"%>
    
<%-- <%=System.getenv() %>     --%>
<%
Set<String> set=System.getenv().keySet();
Iterator<String> ita = set.iterator();
String key="";
while( ita.hasNext()){
	key=ita.next();
	out.println("<li>"+key+" : "+System.getenv(key)+"</li>");
}//end while

%>