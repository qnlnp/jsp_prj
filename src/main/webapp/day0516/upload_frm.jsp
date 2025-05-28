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
 #subTitleDiv > #subTitleSpan { font-size:36px; font-weight: bold }
</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		
		var blockExt=["jpg","gif","png","bmp"];
		var blockFlag=false;
		var ext =$("#upfile").val();//val
		var getExt=ext.substring(ext.lastIndexOf(".")+1);
		
		alert("ext: "+ext);
		alert("getExt: "+getExt);
		alert("getExt.toLowerCase(): "+getExt.toLowerCase());
		
		for(var i =0; i<blockExt.length; i++){
			if(blockExt[i] == getExt.toLowerCase() ){
				blockFlag=true;
				break;
			}//end if
		}//end for
		
		if(!blockFlag){
			alert("업로드 불가능한 형식입니다!");
			return;
		}//end if
		
		$("#frm").submit();//submit
	});//click
});//ready

</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div id="subTitleDiv">
<span id="subTitleSpan">RFC 1867 HTML Form Based File Upload</span><br>
<span id="subTitleSpan">(saveDirectory에 대한 Exception catch못한다~)</span><br>
</div>
<hr>

<!-- RFC 1867 HTML Form Based File Upload를 해보자~~ -->



<form action="upload_process.jsp" method="POST" enctype="multipart/form-data" id="frm">
<label>업로더</label>
<input type="text" name="uploader" id="uploader"/><br>
<label>파일</label>
<input type="file" name="upfile" id="upfile"/><br>
<input type="button" value="업로드" class="btn btn-dark btn-sm" id="btn"/>
</form>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>