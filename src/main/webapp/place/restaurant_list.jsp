<%@page import="kr.co.sist.place.RestDTO"%>
<%@page import="kr.co.sist.place.PlaceService"%>
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
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>

<jsp:useBean id="pDTO" class="kr.co.sist.place.PlaceDTO" scope="page"/>
<jsp:setProperty name="pDTO" property="*"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place/restaurant_list.jsp</title>
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
PlaceService ps = new PlaceService();

int totalCount=0;//총 게시물의 수
// totalCount=bs.totalCount(null);
totalCount=ps.totalCount(pDTO);

int pageScale=0;//한 화면에 보여줄 게시물의 수
pageScale=ps.pageScale();

int totalPage=(int)Math.ceil(totalCount/pageScale);

// int totalPage=( totalCount / pageScale );

if(totalCount % pageScale != 0){
	totalPage++;
}//end if
	
//페이지 네이션과 관련있는,,, 시작번호(startNum)

int startNum;//시작 번호
System.out.println(pDTO.getCurrentPage());//pDTO의 currentPage=1 해주자~
startNum=ps.startNum(pageScale, pDTO);

int endNum;//끝 번호
endNum=ps.endNum(pageScale, pDTO);

List<RestDTO> restList = ps.searchRestaurant(pDTO);
// List<BoardDTO> boardList = null;//회원정보가 없는 경우~


String currentPage=request.getParameter("currentPage");
// System.out.println(tempPage);


pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("pageScale", pageScale);
pageContext.setAttribute("totalPage", totalPage);
pageContext.setAttribute("startNum", pDTO.getStartNum());
pageContext.setAttribute("endNum",  pDTO.getEndNum());
pageContext.setAttribute("fieldText",  pDTO.getFieldText());//맛집리스트에 맞게 구현해보자~~
pageContext.setAttribute("currentPage",  currentPage);

pageContext.setAttribute("restList",  restList);

%>


<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>

<div id="subTitleDiv">
<%-- <c:out value="${ pDTO.field eq 0 }"/> --%>
<span id="subTitleSpan">맛집 리스트<span style="color:#fea4a4"> 
<c:choose>
<c:when test="${ pDTO.field eq 0 }">(가게명 검색)</c:when>
<c:when test="${ pDTO.field eq 1 }">(메뉴 검색)</c:when>
<c:when test="${ pDTO.field eq 2 }">(작성자 검색)</c:when>
</c:choose>
</span>
</span><!-- subTitleSpan -->
</div><!-- subTitleDiv -->

<hr>
<div id="container">

<div style="display: flex">
<div style="width:auto; font-size: 24px">
전체 <c:out value="${totalPage}"/>건에서,,,
<c:choose>
<c:when test="${ empty currentPage }">현재 <span>첫 페이지</span> 입니다~!</c:when>
<c:otherwise>현재 <span><c:out value="${currentPage}"/>페이지</span> 입니다~!</c:otherwise>
</c:choose>
</div>
<div style="width:auto; margin-left: 20px">
<a href="http://192.168.10.88/jsp_prj/place/write_rest_frm.jsp">맛집등록하기</a>
</div>
</div><!-- flexDiv -->
<hr>
<div style="width: 900px; height: 480px" >

	<table class="table table-hover">
	<thead class="table table-light" style="text-align:center">
	<tr>
		<th style="width:80px">번호</th>
		<th style="width:65px">식당명</th>
		<th style="width:120px">메인메뉴</th>
		<th style="width:100px">작성자</th>
		<th style="width:200px">작성일</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${ empty restList }">
	<tr><td colspan="5" style="text-align: center">
	
	<img src="http://192.168.10.88/jsp_prj/login/images/login_fail.jpg"
		style="width: 100%" height="300px"/>
	<span style="font-size: 36px; font-weight: bold; color:red">맛집을 등록해주세요...</span>
	</td></tr>
	</c:if>
	
	<%
	
	StringBuilder searchQueryStr=new StringBuilder();
	//붙는 조건을 만들어보자~~
	if(  pDTO.getKeyword() != null && !pDTO.getKeyword().isEmpty()  ){
		searchQueryStr
		.append("&field=").append(pDTO.getField())
		.append("&keyword=").append(pDTO.getKeyword())
		;
	}//end if
	
	pageContext.setAttribute("queryStr", searchQueryStr);
	%>


	<!--  totalCount, currentPage, pageScale, 스텝 -->
	<c:forEach var="restDTO" items="${ restList }" varStatus="i">
	
	<tr style="text-align:center">
		<td><c:out value="${ totalCount - (currentPage-1)*pageScale -(i.index) }"/></td>
		<td><a href="rest_detail.jsp?num=${ restDTO.rest_num }&currentPage=${ pDTO.currentPage }${queryStr}" id="subjectHref">
			<c:out value="${ restDTO.restaurant }"/></a>
		</td>
		<td><c:out value="${ restDTO.menu }"/></td>
		<td><c:out value="${ restDTO.id }"/></td>
		<td><fmt:formatDate value="${ restDTO.input_date }"	pattern="yyyy-MM-dd a HH:mm:ss"/></td>
	</tr>
	
	</c:forEach>
	
	
	
	
	
	</tbody>
	</table>

</div>	


<div id="searchDiv" style="margin-left: 250px" >
<form action="restaurant_list.jsp" id="searchFrm" method="GET">
<select name="field" id="field">
<c:forEach var="field" items="${ fieldText	}" varStatus="i">
<option value="${ i.index }"><c:out value="${ field }"/></option>
</c:forEach>
</select>
<input type="text" name="keyword" id="keyword">
<input type="text" style="display: none">
<input type="button" value="검색" id="btnSearch" class="btn btn-danger btn-sm">
</form>
</div>


<div id="paginationDiv" style="font-size:30px">


<!-- BoardUtil클래스의 메소드로 뽑아보자~~~~~~~~~~~ -->
<%
StringBuilder searchQueryString=new StringBuilder();
//붙는 조건을 만들어보자~~
if(  pDTO.getKeyword() != null && !pDTO.getKeyword().isEmpty()  ){
	searchQueryString
	.append("&field=").append(pDTO.getField())
	.append("&keyword=").append(pDTO.getKeyword())
	;
}//end if


int pageNumber=3; //1)한 화면에 보여줄,,, 페이지인덱스의 수
//2)화면에 보여줄,,, 시작페이지 번호
// int startPage=pDTO.getCurrentPage();
int startPage=((pDTO.getCurrentPage()-1)/pageNumber)*pageNumber +1;



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

if( pDTO.getCurrentPage() > pageNumber ){//시작페이지보다 1적은 페이지로 이동시킨다
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
	if( movePage == pDTO.getCurrentPage() ){//현재 페이지는 링크를 안걸려고~~
		pageLink.append("[ ").append(pDTO.getCurrentPage()).append(" ]");
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
PaginationDTO pgnDTO = new PaginationDTO(
		3, pDTO.getCurrentPage(), totalPage,
		pDTO.getField(), pDTO.getKeyword(), "restaurant_list.jsp"	);
%>
</div><!-- paginationDiv -->
<hr>
<div id="paginationDiv" style="font-size:30px">
<span style="font-size: 15px"><%= pDTO %></span><br>
<%= BoardUtil.pagination(pgnDTO) %>
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