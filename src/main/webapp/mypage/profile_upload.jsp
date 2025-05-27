<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%-- <%@ include file="../common/site_config.jsp" %>     --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>
<%
Object obj = session.getAttribute("userData");

JSONObject jsonObj = new JSONObject();
boolean resultFlag = obj != null;
jsonObj.put("resultFlag", resultFlag);//기본적으로 resultFlag담고 있고,,,

if( resultFlag ){ //로그인이 되어있는 상태
	
	/* day0516/upload_process.jsp
	//3. 파일 컴포넌트객체를 설정한다()
	MultipartRequest mr = new MultipartRequest
	( request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
	*/
	
	File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");	
	int maxSize = 1024*1024*10;//톰캣zip보다 작은,,, 10Mb로 잡아보자
	
	//1. 이제 파일업로드를 수행한다~
	MultipartRequest mr = new MultipartRequest(request,saveDir.getAbsolutePath(),
			maxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	String fileName = mr.getFilesystemName("profileImg");//같은이름이 있을때 처리~
	//오리지널 파일명을 사용하면 안된다는 의미이다~~
	//업로드된파일명을 서버에서 관리할때,,,
	
	jsonObj.put("fileName", fileName);

}//end if
out.print( jsonObj.toJSONString() );
//{ resultFlag: true, fileName:"파일명" }
//파일명은 있을수도, 없을수도 있다

%>