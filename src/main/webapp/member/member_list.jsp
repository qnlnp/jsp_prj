<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String role = request.getParameter("role");//세션단이면 갸능 애트리뷰트~
if( role == null || role.equals("")){
	role = "a";
}//end if

MemberService ms = new MemberService();
pageContext.setAttribute("memberList", ms.searchAllMember(role));//scope객체의 활용~!!
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/member_list.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #container > div > a { text-decoration: none; font-weight: bold}
 #target { color: blue; font-weight: bold}
 table > thead > th {width: auto}
 
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold }
 
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
<div id="subTitleDiv">
<span id="subTitleSpan">회원목록 ( 현재 권한 : <span id="target"><%=role%></span> )</span>

</div><hr>
<div id="container">
	<div style="margin-bottom:18px">
<%-- 	<h2>( 현재 권한 : <span id="target"><%=role%></span>)</h2> --%>
	<!-- role은,,, 로그인했을때,,, 관리자의 role select해서,,, session에 할당해서 필요한곳에 사용해야한다~~!! -->
	<a href="member_list.jsp?role=a">관리자A (a role: 전부 암호화)</a><br>
	<a href="member_list.jsp?role=b">관리자B (b role: 이름, 이메일은 공개)</a><br>
	<a href="member_list.jsp?role=c">관리자C (c role: 전부 공개)</a><br>
	</div>
	<div style="width: 1800px; height: auto">

		<table class="table table-hover">
		<thead class="table table-light">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>성별</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${ empty memberList }">
			<tr>
			<td colspan="8">회원정보가 존재하지 않습니다!!!</td>
			</tr>
			</c:if><!-- 제네릭으로,,, MemberDTO -->
			<c:forEach var="mDTO" items="${ memberList }" varStatus="i">
			<tr>
			<td><c:out value="${ i.count }"/></td>
			<td><c:out value="${ mDTO.id }"/></td>
			<td id="target"><c:out value="${ mDTO.name }"/></td>
			<td><c:out value="${ mDTO.birth }"/></td>
			<td id="target"><c:out value="${ mDTO.tel }"/></td>
			<td id="target"><c:out value="${ mDTO.useEmail }"/></td>
			<td><c:out value="${ mDTO.gender }"/></td>
			<td><fmt:formatDate value="${ mDTO.input_date }" pattern="yyyy-MM-dd EEEE HH:mm"/></td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		</tfoot>
		</table>
	</div>
	

	
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>