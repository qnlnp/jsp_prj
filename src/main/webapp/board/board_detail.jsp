<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="kr.co.sist.board.BoardDAO"%>
<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/jsp/login_chk.jsp" %>

<%--
LoginResultDTO ld = new LoginResultDTO();
ld.setId("kim1234");
session.setAttribute("userData", ld);//DB에서 꺼내와서,,, 세션에서 활용하는 관점
--%>

<%
//num받아오는게 일단 중요하다~~
String paramNum = request.getParameter("num");
int num=0;
try{
	num=Integer.parseInt(paramNum);
}catch(NumberFormatException nfe){//ex) 클라이언트로부터,,, 숫자가 아닌 num들어올때 -> response객체로 리다이렉트(비정상적 페이지 이동)
	nfe.printStackTrace();//파라미터 null이거나 문자
	response.sendRedirect("http://192.168.10.88/jsp_prj/board/board_list.jsp");
	return;
}//end catch

//ex) 주문이 여러번되는 등 문제가 발생할 수 있어서,,,(새로고침)
//////////////////
BoardService bs=new BoardService();
Boolean cntFlag=(Boolean)session.getAttribute("cntFlag");//Object, null
//board_list.jsp 타고 오니까,,, -> session.setAttribute("cntFlag", false);
if(cntFlag.booleanValue() && cntFlag != null){
	bs.modifyCnt(num);//페이지들어왔으니까(조회수 증가)
	session.setAttribute("cntFlag", false);
}
//////////////////



pageContext.setAttribute("bDTO", bs.searchOneBoard(num));



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/board_detail.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; margin: 20px; font-weight: bold }
 
 td{padding-top:10px; padding-bottom:20px}
 
</style>
<script type="text/javascript">



$(function(){
	$('#summernote').summernote({
	  placeholder: '싸질러보아요~~',
      tabsize: 2,
      height: 240,
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['picture']]
      ]
	});
	
	$("#btnWrite").click(function(){
		//제목, 내용 등 필수 입력사항에 대한,,,
		//혹독한 유효성 검증을 거치고,,,
		
		$("#writeFrm").submit();//submit
	});//click
	
	
	$("#btnModify").click(function(){
// 		var obj=$("#writeFrm")[0];
		var obj=$("#writeFrm");
		obj.action="modify_process.jsp";
// 		alert( obj.action )
		alert( obj.action +" / "+ obj[0].method)
	});//click
	
	$("#btnRemove").click(function(){
// 		var obj=$("#writeFrm")[0];
		var obj=$("#writeFrm");
		obj.action="remove_process.jsp";
// 		alert( obj.action )
		alert( obj.action +" / "+ obj[0].method)
	});//click
	
	
	$("#btnModify").click(function(){
		//obj.method="get";//form의 요청방식 변경가능!
		setEdit("m");
	});//click
	
	$("#btnRemove").click(function(){
		setEdit("r");
	});//click
	
	
});//ready


function setEdit(flag){
	var url="modify_process.jsp";
	var msg="변경스 ";
	if(flag == 'r'){
		url="remove_process.jsp";
		msg="삭제스 "
	}//end if
	if( confirm("정말,,,"+msg+" 하시겠습니까?????")){
		var obj=$("#writeFrm")[0];
		obj.action=url;
		obj.submit();
		
	}//end if
}//setEdit


</script>

<!-- 250520_0936) https://summernote.org/getting-started/ : summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>

</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">게시글보기</span></div><hr>
<div id="container">
<div id="writeWrap" style="width: 640px; margin:0 auto">
<div>
<!-- <form action="write_process.jsp" method="get" id="writeFrm"> -->
<!-- <form action="write_process.jsp" method="POST" id="writeFrm"> -->
<form method="POST" id="writeFrm">

<input type="hidden" name="num" value="${ bDTO.num }"/>
<!-- 게시글은,,, num으로 가져오니까 -->

<table>
<tr><th colspan="2" style="text-align: center"><h3>글 읽기</h3></th></tr>

<tr style="height:40px">
<td>제목</td>
<td><input type="text" name="subject" id="subject" value="${ bDTO.subject }"
style="width:100%; boarder: 1px solid #CDCDCD"></td>
</tr>

<tr>
<td>내용</td>
<td><textarea id="summernote" name="content">${ bDTO.content }</textarea></td>
</tr>

<tr>
<td>조회수</td>
<td><strong><c:out value="${ bDTO.cnt }"/>
</strong></td>
</tr>

<tr>
<td>작성자ID<span style="margin-right:30px"></span></td>
<td><strong><c:out value="${ bDTO.id }"/></strong>
(<c:out value="${ bDTO.ip }"/>)</td>
</tr>

<tr>
<td>작성일</td>
<td><strong>
<fmt:formatDate value="${ bDTO.input_date }" pattern="yyyy-MM-dd a HH:mm"/>
</strong></td>
</tr>

<tr>
<td colspan="2" style="text-align: center">

<c:if test="${ bDTO.id eq userData.id }"><!-- 이렇게 세션을 활용해서,,, 튼튼하게~ -->
<input type="button" value="글수정" id="btnModify" class="btn btn-success btn-sm"/>
<input type="button" value="글삭제" id="btnRemove" class="btn btn-danger btn-sm"/>
<!-- <input type="button" value="글목록" id="btnBoardList" class="btn btn-info btn-sm"/> -->
<!-- <a href="javascript:history.back()" class="btn btn-info btn-sm">글목록</a> -->
</c:if>
<%
String search="";
String field=request.getParameter("field");
String keyword=request.getParameter("keyword");

if( field != null && !field.isEmpty() ){
	search= "&field="+field+"&keyword="+keyword ;
}//end if 
pageContext.setAttribute("search", search);
%>

<%-- <a href="http://192.168.10.88/jsp_prj/board/board_list.jsp?%currentPage=${currentPage}${search}" class="btn btn-info btn-sm">글목록</a> --%>
<%-- <a href="http://192.168.10.88/jsp_prj/board/board_list.jsp?currentPage=${param.currentPage}${search}" class="btn btn-info btn-sm">글목록</a> --%>
<a href="http://192.168.10.88/jsp_prj/board/board_list.jsp?currentPage=${param.currentPage}${search}" class="btn btn-info btn-sm">글목록</a>
</td>
</tr>
</table>

</form>
</div>

</div><!-- writeWrap -->
</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>