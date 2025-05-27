<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 
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
<%
//1. JNDI사용객체를 생성한다
Context ctx = new InitialContext();
//2. 이름으로 객체찾기(JNDI)
// ctx.lookup("java:comp/env/jdbc/orcl");//Object이다
// DataSource ds = ctx.lookup("java:comp/env/jdbc/orcl");//Type mismatch: cannot convert from Object to DataSource
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");//Type mismatch: cannot convert from Object to DataSource
//3. DataSource에서 커넥션 얻기
Connection con = ds.getConnection();
%>
<%= con %>
<%
con.close();//DBCP 커넥션풀로 돌아간다
%>
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>