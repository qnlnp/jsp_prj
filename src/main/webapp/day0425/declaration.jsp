<%@page import="kr.co.sist.util.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0425/declaration.jsp</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.88/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){

});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
<main>
<div id="container">
<%!
	int i;//인스턴스변수는 자동 초기화
	public String msg(){
		return "내일은 즐거운 쥬말~~~~~~~~~~~~" ;
	}//msg
	
%>

<%= i %>
<%= msg() %>
<%
	String[] nameArr={"이름1", "이름2", "이름3", "이름4", "이름5"};
	//select도 되긴하는데,,, radio타입으로 직관적이게~~!!

%>

<%--

<%!
	/**
	 * 라디오버튼을 생성하는 메소드<br>
	 * 사용법)
	 * createRadioTool("라디오이름", 라디오인덱스, 생성할 개수, checked 설정할 라디오번호)
	 */
	private String createRadioTool(String name, int radioIndex, int radioCnt, int flagNum){
	
		if(radioCnt>100){
			radioCnt=100;
		}//end if
	
		if( flagNum <0 || radioCnt < flagNum ){
			flagNum=0;
		}//end if
	
		StringBuilder sbTemp = new StringBuilder();
		
		for(int i=0; i<radioCnt+1; i++){
			sbTemp.append("<input type='radio' name='").append(name).append("'")
			.append("_").append(radioIndex).append("'")
			.append( i == flagNum ?" checked='checked'":"")
			.append(">").append(i).append(" ")
			;
		}//end if
		
		return sbTemp.toString(); 
	}//createRadioTool
%>

--%>

<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th style="width: 60px">번호</th>
			<th style="width: 120px">이름</th>
			<th style="width: 420px">점수</th>
		</tr>
	</thead>
	<tbody>
	<% for(int i=0; i<nameArr.length; i++) { %>
		<tr>
			<td><%= i+1 %>번</td>
			<td><%= nameArr[i] %>님</td>
			<td><%= MyUtil.createRadio("score", i, 10, 5) %></td>
		</tr>
	<% }//end for %>
	</tbody>
</table>

</div><!-- container -->
</main>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>