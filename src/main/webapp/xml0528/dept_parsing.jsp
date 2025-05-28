<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.JDOMException"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xml0528/dept_parsing.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold; color:black}
 
 span { font-weight: bold }
 
 
</style>
<script type="text/javascript">
$(function(){

	$("#localBtn").click(function(){
		
	});//click
	
	
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">로컬 또는 웹에서,,, XML 파싱해오기</span></div><hr>
<div id="container">
<div>
<span>로컬: </span>C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml<br>
<span>웹: </span>http://192.168.10.88/jsp_prj/xml0528/db_dept.xml<br>
</div>
<hr>
<table class="table">
<thead class="table table-danger">
	<tr>
	<th>DEPTNO</th>
	<th>DNAME</th>
	<th>LOC</th>
	</tr>
</thead>
<tbody>
<%
	//1. XML을 로딩할수있는 객체를 생성한다.
	SAXBuilder builder = new SAXBuilder();
	//2. XML에 접근하여,,, 문서객체로 얻는다.
	Document doc=null;
	
	try {
		
	//2-1. 로컬에서 얻는 경우
// 	doc = builder.build(new File("C:/dev/workspace/jsp_prj/src/main/webapp/xml0528/db_dept.xml"));
	//2-2. 웹에서 얻는 경우
	doc = builder.build(new URL("http://192.168.10.88/jsp_prj/xml0528/db_dept.xml"));
	
	//최상위부모 노드 얻기(root는 하나니까 이름몰라도 가져올 수 있다)
	Element rootNode = doc.getRootElement();
	System.out.println("rootNode: "+rootNode);
//	System.out.println( doc );
	
	//정보를 제공하는 특정자식 노드 얻기
	Element resultNode=rootNode.getChild("result");
	System.out.println("resultNode: "+resultNode);
	System.out.println("result: "+resultNode.getText());
	
	Element pubDateNode=rootNode.getChild("pubDate");
	String pubDate=pubDateNode.getText();
	System.out.println("pubDateNode: "+pubDateNode);
	System.out.println("pubDate: "+pubDate);
	
	Boolean flag=Boolean.valueOf(resultNode.getText());
	System.out.println("---------------------------------------------------");
	System.out.println("flag: "+flag);
	
	if( flag ) {
		//여러 자식노드를 가진,,, 반복되는 노드 얻기
		List<Element> deptList = rootNode.getChildren("dept");
		Element deptnoNode=null;
		Element dnameNode=null;
		Element locNode=null;
		
		for( Element deptNode : deptList ) {
			//파싱할,,, 자식노드 얻기
			deptnoNode=deptNode.getChild("deptno");
			dnameNode=deptNode.getChild("dname");
			locNode=deptNode.getChild("loc");
	%>
	<tr>
	<td><%= deptnoNode.getText() %></td>
	<td><%= dnameNode.getText() %></td>
	<td><%= locNode.getText() %></td>
	</tr>
	<%
		}//end for
	}//end if

	} catch (JDOMException je) {
		je.printStackTrace();
	} catch (IOException ie) {
		ie.printStackTrace();
	}//end catch
	
%>
</tbody>
<tfoot>
</tfoot>
</table>




</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>