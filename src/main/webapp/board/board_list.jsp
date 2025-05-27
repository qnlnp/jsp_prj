<%@page import="kr.co.sist.board.BoardUtil"%>
<%@page import="kr.co.sist.board.PaginationDTO"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/jsp/login_chk.jsp" %>

<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/board_list.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold ; color:black }
 
 #div1{font-size: 24px}
 span {font-weight: bold; color: red}
 
 a{text-decoration: none}
 a:hover{text-decoration: underline; color: white}
 
 #subjectHref{color:#333}
</style>
<script type="text/javascript">
$(function(){

	$("#btnSearch").click(function(){
		var keyword=$("#keyword").val();//keyword 가져오고,,,
		if(keyword == ""){
			alert("검색어를 입력하세요~~~~~~~~~~");
			return;//얼리 return
		}//end if
		
	$("#searchFrm").submit();
	});//click
	
	
	
});//ready
</script>
</head>

<%
BoardService bs = new BoardService();

int totalCount=0;//총 게시물의 수
// totalCount=bs.totalCount(null);
totalCount=bs.totalCount(rDTO);

int pageScale=0;//한 화면에 보여줄 게시물의 수
pageScale=bs.pageScale();

int totalPage=(int)Math.ceil(totalCount/pageScale);

// int totalPage=( totalCount / pageScale );

if(totalCount % pageScale != 0){
	totalPage++;
}//end if
	
//페이지 네이션과 관련있는,,, 시작번호(startNum)

int startNum;//시작 번호
System.out.println(rDTO.getCurrentPage());//rDTO의 currentPage=1 해주자~
startNum=bs.startNum(pageScale, rDTO);

int endNum;//끝 번호
endNum=bs.endNum(pageScale, rDTO);

List<BoardDTO> boardList = bs.searchBoard(rDTO);
// List<BoardDTO> boardList = null;//회원정보가 없는 경우~


String currentPage=request.getParameter("currentPage");
// System.out.println(tempPage);


pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("pageScale", pageScale);
pageContext.setAttribute("totalPage", totalPage);
/*
pageContext.setAttribute("startNum", startNum);
pageContext.setAttribute("endNum", endNum);
*/
pageContext.setAttribute("startNum", rDTO.getStartNum());
pageContext.setAttribute("endNum",  rDTO.getEndNum());
pageContext.setAttribute("boardList",  boardList);
pageContext.setAttribute("currentPage",  currentPage);

pageContext.setAttribute("fieldText",  rDTO.getFieldText());//제목,작성자,내용 택1로 검색하려고~~~

session.setAttribute("cntFlag", true);


%>


<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">게시글보기(전체)</span></div><hr>
<div id="container">

<div id="div1">
총게시물의 수(totalCount): <span>${ totalCount }</span><br>
한 화면에 보여줄 게시물의 수(pageScale): <span>${ pageScale }</span><br>
필요한 페이지의 수=쪽번호(totalPage) : <span>${ totalPage }</span><br>
pagination을 위한,,, 시작 번호(startNum) : <span>${ startNum }</span><br>
pagination을 위한,,, 끝 번호(endNum) : <span>${ endNum }</span><br>
</div>
<hr>


<div style="display: flex">
<div style="width:auto; font-size: 24px">
전체 <c:out value="${totalPage}"/>페이지에서,,,
<c:choose>
<c:when test="${ empty currentPage }">현재 <span>첫 페이지</span> 입니다~!</c:when>
<c:otherwise>현재 <span><c:out value="${currentPage}"/>페이지</span> 입니다~!</c:otherwise>
</c:choose>
</div>
<div style="width:auto; margin-left: 24px">
<a href="http://192.168.10.88/jsp_prj/board/write_frm.jsp" class="btn btn-outline-danger btn-sm">글작성</a>
</div>
</div><!-- flexDiv -->
<hr>
<div style="width: 900px; height: 480px" >

	<table class="table table-hover">
	<thead class="table table-light" style="text-align:center">
	<tr>
		<th style="width:30px">번호</th>
		<th style="width:120px">제목</th>
		<th style="width:80px">작성자</th>
		<th style="width:150px">작성일</th>
		<th style="width:50px">조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${ empty boardList }">
	<tr><td colspan="5">
	<span style="font-size: 36px; font-weight: bold; color:red">게시글이 존재하지 않습니다ㅜㅜ</span>
	<img src="http://192.168.10.88/jsp_prj/login/images/login_fail.jpg"
		style="width: 100%" height="300px"/>
	</td></tr>
	</c:if>
	
	<%
	
	StringBuilder searchQueryStr=new StringBuilder();
	//붙는 조건을 만들어보자~~
	if(  rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()  ){
		searchQueryStr
		.append("&field=").append(rDTO.getField())
		.append("&keyword=").append(rDTO.getKeyword())
		;
	}//end if
	
	pageContext.setAttribute("queryStr", searchQueryStr);
	%>


	<!--  totalCount, currentPage, pageScale, 스텝 -->
	<c:forEach var="bDTO" items="${ boardList }" varStatus="i">
	
	<tr style="text-align:center">
<%-- 	<td><c:out value="${i.count }"/></td> --%>
<%-- 	<td><c:out value="${ totalCount - (currentPage-1)*pageScale -(i.count) }"/></td> --%>
	<td><c:out value="${ totalCount - (currentPage-1)*pageScale -(i.index) }"/></td>
	<td><a href="board_detail.jsp?num=${ bDTO.num }&currentPage=${ rDTO.currentPage }${queryStr}" id="subjectHref"><c:out value="${ bDTO.subject }"/></a></td>
	<td><c:out value="${ bDTO.id }"/></td>
	<td><fmt:formatDate value="${ bDTO.input_date}"
		pattern="yyyy-MM-dd a HH:mm:ss"/></td>
	<td><c:out value="${ bDTO.cnt }"/></td>
	</tr>
	
	</c:forEach>
	
	
	
	
	
	</tbody>
	</table>

</div>	


<div id="searchDiv" style="margin-left: 250px" >
<form action="board_list.jsp" id="searchFrm" method="GET">
<select name="field" id="field">
<c:forEach var="field" items="${ fieldText	}" varStatus="i">
<option value="${ i.index }"><c:out value="${field }"/></option>
</c:forEach>
</select>
<input type="text" name="keyword" id="keyword">
<input type="text" style="display: none">
<input type="button" value="검색" id="btnSearch" class="btn btn-danger btn-sm">
</form>
</div>


<%--
<div id="paginationDiv" style="font-size:30px">
<c:forEach var="i" begin="1" end="${ totalPage }" step="1">
[ <a href="board_list.jsp?currentPage=${i}"><c:out value="${i}"/></a> ]
</c:forEach>
</div>
 --%>


<div id="paginationDiv" style="font-size:30px">


<!-- BoardUtil클래스의 메소드로 뽑아보자~~~~~~~~~~~ -->
<%
StringBuilder searchQueryString=new StringBuilder();
//붙는 조건을 만들어보자~~
if(  rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()  ){
	searchQueryString
	.append("&field=").append(rDTO.getField())
	.append("&keyword=").append(rDTO.getKeyword())
	;
}//end if


int pageNumber=3; //1)한 화면에 보여줄,,, 페이지인덱스의 수
//2)화면에 보여줄,,, 시작페이지 번호
// int startPage=rDTO.getCurrentPage();
int startPage=((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber +1;



//3)화면에 보여줄,,, 마지막페이지 번호
// int endPage=startPage+2;
int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;

//4)총 페이지수가 연산된 마지막페이지수보다 작다면,,, 총페이지수가 마지막페이지수로 설정
if(totalPage <= endPage){
	endPage=totalPage;
}//end if




//5)첫페이지가 인덱스화면이 아닌경우(currentPage>pageNumber) 따져줘야한다~~
//prevMark
int movePage=0;
StringBuilder prevMark=new StringBuilder("[ &lt;&lt; ]");
// StringBuilder prevMark=new StringBuilder(" ");

if( rDTO.getCurrentPage() > pageNumber ){//시작페이지보다 1적은 페이지로 이동시킨다
	prevMark.delete(0, prevMark.length());
	movePage=startPage-1;
	//keyword, field 같이 넘겨줘야 한다~
	prevMark.append("[ <a href='board_list.jsp?currentPage=")
	.append( movePage )
	///////////////////////////////////////
	.append( searchQueryString.toString() )
	///////////////////////////////////////
	.append("'> &lt;&lt;</a> ]")
	;
}//end if

//6)시작페이지 번호부터,,, 끝페이지 번호까지 화면에 출력
//pageLink
movePage=startPage;
StringBuilder pageLink = new StringBuilder();
while( movePage <= endPage ){
	if( movePage == rDTO.getCurrentPage() ){//현재 페이지는 링크를 안걸려고~~
		pageLink.append("[ ").append(rDTO.getCurrentPage()).append(" ]");
	}else{
		pageLink.append("[ <a href='board_list.jsp?currentPage=")
		.append( movePage )
		///////////////////////////////////////
		.append( searchQueryString.toString() )
		///////////////////////////////////////
		.append("'>").append( movePage ).append("</a> ]");
	}//end else
	movePage++;
	
}//end while
	
//7)뒤에 페이지가 더 있는경우
//nextMark

StringBuilder nextMark=new StringBuilder("[ &gt;&gt; ] ");
// StringBuilder nextMark=new StringBuilder(" ");
if(totalPage > endPage ){
	nextMark.delete(0, nextMark.length());
	movePage=endPage+1;
	nextMark.append("[ <a href='board_list.jsp?currentPage=")
	.append( movePage )
	///////////////////////////////////////
	.append( searchQueryString.toString() )
	///////////////////////////////////////
	.append("'>").append( " &gt;&gt; " ).append("</a> ]");
}//end if
	
%><!-- BoardUtil클래스의 메소드로 뽑아보자~~~~~~~~~~~ -->

<hr>
시작페이지 번호 : <span><%= startPage %></span>
마지막페이지 번호 : <span><%= endPage %></span>
<br>
<!-- 이미지로 이쁘게 해도 된다~~~~~~~~~~~ -->
<%= prevMark %> ... <%= pageLink %> ... <%= nextMark %>
<!-- 
public class PaginationDTO {
	int pageNumber, currentPage, totalPage;
	String field, keyword, url;
}//class
 -->

<%
PaginationDTO pDTO = new PaginationDTO(
		3, rDTO.getCurrentPage(), totalPage,
		rDTO.getField(), rDTO.getKeyword(), "board_list.jsp"	);
%>
</div><!-- paginationDiv -->
<hr>
<div id="paginationDiv" style="font-size:30px">
<span style="font-size: 15px">BoardUtil클래스 활용</span><br>
<span style="font-size: 15px"><%= pDTO %></span><br>
<%= BoardUtil.pagination(pDTO) %>
</div><!-- paginationDiv -->
<hr>
<div style="font-size:24px; color:black">
movePage: <%=movePage %><br>
</div>




</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>