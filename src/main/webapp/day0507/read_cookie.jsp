<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="쿠키 읽기"%>
<!-- 손상되어도 괜찮은 별로 안중요한 정보는 쿠키로~ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0507/read_cookie.jsp</title>

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
	$("#btn").click(function(){
		$("#frm").submit();//submit
	});//click	
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
<h1>쿠키들,,, 읽기</h1><!-- JSESSIONID 하나 있는 상황이다,,, -->
<%

Cookie[] cookie = request.getCookies();
boolean cookieFlag = false, saveFlag = false;

if( cookie != null){//java.lang.NullPointerException: Cannot read the array length because "cookie" is null
// 	out.print( cookie.length );

/* 서블릿컨테이너가 심는,,, JSESSIONID 쿠키 하나 있는 상태이다. */

//java.lang.NullPointerException: Cannot read the array length because "cookie" is null	

Cookie tempCookie=null;
	for(int i=0; i < cookie.length; i++){
		tempCookie=cookie[i];
	// 	out.print( tempCookie.getName()+" / "+tempCookie.getValue());
	
		if( !"JSESSIONID".equals(tempCookie.getName() )){
			cookieFlag = true;
			//쿠키 있으면,,, => 쿠키의 값을 얻기!!!

			/*
			
			
			
			
			
			*/
								
			%>
			쿠키 명 : <%= tempCookie.getName() %><br>
			쿠키 값 : <%= tempCookie.getValue() %><br>
			<%
		}//end if
	}//end for
	
			

}//end if
%>

<%//if( !cookieFlag ){ //쿠키 없으면,,, 이름,나이 받으려고 %> 

<form action="add_cookie.jsp" method="POST" id="frm">
<label>이름: </label>
<input type="text" name="name" id="name"/>
<input type="checkbox" name="saveFlag" <%= saveFlag?"checked='checked'":"" %>/>이름저장
<!-- checkbox에 value속성이 없으면,,, null 또는 "on"이 넘어간다 -->

<br>
<label>나이: </label>
<input type="text" name="age" id="age"/>
<br>
<input type="button" value="전송" id="btn" class="btn btn-primary"/><br>
</form>

<%//}else{%>
<a href="remove_cookie.jsp">쿠키 삭제하기</a> 
<%//}//end else %>

</div><!--container-->
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