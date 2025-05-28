<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0516/upload_process.jsp</title>
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
//1. 저장할 Directory 설정한다(saveDirectory)
File saveDir=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
//2. 업로드 크기를 설정한다(maxPostSize)
int maxSize = 1024*1024*10;//톰캣zip보다 작은,,, 10Mb로 잡아보자
int limitSize = 1024*1024*10;
//3. 파일 컴포넌트객체를 설정한다()
MultipartRequest mr = new MultipartRequest
( request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());

//4. 파라미터 받기(request로 못받는다)
String uploader=mr.getParameter("uploader");
// String uploader2=request.getParameter("uploader");

//4. 파일명 받기
String originalName=mr.getOriginalFileName("upfile");
String newName=mr.getFilesystemName("upfile");

File readFile=new File(saveDir.getAbsolutePath()+File.separator+originalName);

%>

<% if(readFile.length() > limitSize){ %>
	업로드가능한 파일크기를 넘었습니다(최대 10,485,760btye) 입니다!<br>
<%}else{ %>

<hr>
MultipartRequest: <%= mr.toString() %><br>
<hr>
<%-- request: <%=uploader2 %><br> --%>
uploader: <%= uploader %><br>
경로: <%= readFile %><br>
<hr>
<%= originalName%>(원본 파일명)<br>
<%= newName %>(새로운 파일명)<br><!-- 우리 머리 안깨지게 해준다~ -->
<%}//end else %>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>