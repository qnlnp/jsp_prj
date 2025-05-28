<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<style type="text/css"> 
  #wrap { position:relative; margin:0 auto; }
  #background { width:502px; height:353px; background: #FFFFFF url(http://192.168.10.88/jsp_prj/memberTest/images/id_background.png) no-repeat; }
  #inputDiv { width:324px; position:absolute; top:100px; left:50px; }
  #inputDiv2 {
    width: 100%;
    position: absolute;
    top: 180px;
    left: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }
</style>

<script type="text/javascript">


$(function() {
// 	$('#btn2').css("display", "none");
	
  // 중복확인 버튼 클릭
  $('#btn').click(function() {
    	chkNull();
  });//click

  $('#id').keydown(function(evt) {
	  if( evt.which == 13){
		  chkNull();
	  }//end if
  });//keydown
  
  // 사용 버튼 클릭
  $('#btn2').click(function() {
    const id = $('#tempId').val();
    
    opener.document.frm.id.value = id;
    window.close();
  });//click
 
  
});//ready

function chkNull(){
	const id = $('#id').val();
	
	if( id.replace(/ /g, "") == "" ){
		alert("아이디는 필수로 입력하셔야 합니다!!");
		$('#id').val('');
		return;
	}//end if 
	
	$('#frm').submit();//submit
}//chkNull

</script>
</head>

<!-- id, pass, name, birth, tel, email, gender, zipcode, addr, addr2, intro, ip -->



<body>
<div id="wrap">
  <div id="background">
  
    <div id="inputDiv">
      <form name="subFrm" id="frm" action="id_dup.jsp">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" autofocus="autofocus"/>
        <input type="text" style="display: none"/>
        <input type="button" value="중복확인" class="btn btn-primary btn-sm" id="btn"/><br>
      </form>
    </div><!-- inputDiv -->
    
    <c:if test="${ not empty param.id }">
    <%
    	String id= request.getParameter("id");//name="id"
    	
    	MemberService ms = new MemberService();
    	boolean idFlag=ms.searchId(id);
    	//flag에 따라,,, 처리하려고
    	
    	pageContext.setAttribute("idFlag", idFlag);
    	//scope객체 쓰는 이유 = EL에서 쓰려고~~~~
    			
    %>
    
    
    <div id="inputDiv2">
      <form name="subFrm2" id="subFrm2">
  
        <span id="showID"><c:out value="${ param.id }"/></span>(은)는 사용이 
      
        <c:set var="msg" value="가능"/>
        <c:set var="color" value="#0000FF"/>

        <c:if test="${ idFlag }">
        <c:set var="msg" value="불가능"/>
        <c:set var="color" value="#FF0000"/>
        </c:if>
        
        <span style="color:${ color }"><c:out value="${ msg }"/></span>합니다.
        <input type="hidden" value="${ param.id }" name="tempId" id="tempId"/>
        
        <c:if test="${ not idFlag }">
        <input type="button" value="사용" class="btn btn-success btn-sm" id="btn2"/>
        </c:if>
      </form>
    </div><!-- inputDiv2 -->
    
    </c:if>
    
  </div><!-- background -->
</div><!-- wrap -->
</body>
</html>