<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0507/forward_form.jsp</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();//submit;
	});//click;
});//ready
</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
String serverName=request.getServerName();
String nameLabel="name",ageLabel="age",btnLabel="submit";
out.println(serverName);

if("localhost".equals(serverName)){
	nameLabel="이름";
	ageLabel="나이";
	btnLabel="제출";
}//end if
%>
<form action="forward_process.jsp" name="frm" id="frm" method="GET">
<input type="text" name="name" id="name"/>
<label><%= nameLabel%></label><br>
<input type="text" name="age" id="age"/>
<label><%= ageLabel%></label><br>
<a href="http://localhost/jsp_prj/day0507/forward_form.jsp">http://localhost</a><br>
<a href="http://192.168.10.88/jsp_prj/day0507/forward_form.jsp">http://192.168.10.88</a>
<br>
<input type="button" value="<%= btnLabel%>" id="btn" class="btn btn-success"/><br>
</form>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>