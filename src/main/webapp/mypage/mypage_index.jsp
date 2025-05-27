<%@page import="kr.co.sist.member.MemberDTO"%>
<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/jsp/login_chk.jsp" %>

<%
String id = ((LoginResultDTO)session.getAttribute("userData")).getId();

//id를,,, 세션에서 꺼내왔기때문에,,, 변조될 경우는 매우 드물다 ~
MemberService ms = new MemberService();
MemberDTO mDTO = ms.searchOneMember(id);
if( mDTO == null ){
	response.sendRedirect("http://192.168.10.88/jsp_prj");
}//end if
pageContext.setAttribute("mDTO", mDTO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/mypage_index.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold }

</style>
<script type="text/javascript">
$(function(){
	
	
	alert("img: "+$("#img").val() );
	alert("imgName: "+$("#imgName").val() );
	alert("profileImg: "+$("#profileImg").val() );
	
	$("#btnImg").click(function(){
		$("#profileImg").click();//Object잘 나오는지 확인한다~~~
	});//click
	
	/*
	$("#profileImg").change(function(){
		alert( $("#profileImg").val() );
	});//click
	*/

	$("#profileImg").change(function( evt ){

		//선택한 파일이 이미지인지를 체크하고,,,		
		var blockExt=["jpg","png"];
		var blockFlag=false;
		var withFakepath =$("#profileImg").val();
		var ext=withFakepath.substring(withFakepath.lastIndexOf(".")+1);
		
// 		alert("withFakepath: "+withFakepath);//fakepath경로
// 		alert("ext: "+ext);//파일의 확장자
		
		for(var i=0; i<blockExt.length; i++){//배열 돌려고,,,
			if(ext==blockExt[i]){
				blockFlag=true;
				break;//찾으면 break
			}//end if	
		}//end for
		
		if(!blockFlag){
			alert("jpg 또는 png 확장자의 파일만 선택해주세요~~");
			return;
		}//end if

		$("#imgName").val( $("#profileImg").val() );
		
		//250522
		//같은이름의 파일이 있을때 문제가 생겨서
		//MultipartRequest로 db거쳐야 한다~
		
		//이벤트발생시킨 file객체를 얻는다.
		var file = evt.target.files[0];
		//스트림을 생성한다.
		var reader=new FileReader();
		//FileReader객체의 onload 이벤트 핸들러를 설정한다.
		
		//prop()로 src속성을 변경한다.
		reader.onload=function( evt ){
	
			$("#img").prop("src", evt.target.result);//Base64
			
			alert( "img: "+ $("#img").val() );
			alert( "imgName: "+ $("#imgName").val() );
			alert( "profileImg: "+ $("#profileImg").val() );
			
		}//onload
	
	
		//파일을 읽어들여 img 설정 // 프리뷰는 프리뷰대로 되게 하고,,, // 미리보기 
		reader.readAsDataURL( file );
		
		
		
		/*------------------------------------------------------------*/
		//250522 ajax로 파일 전송(바이너리)
		/*
		var frm=$("#frm")[0];
		var formData = new FormData(frm);
		alert("frm: "+frm);//[object HTMLFormElement] -> form은 태생적으로 파라미터전송방식(파일업로드X)
		alert("formData: "+formData);//[object FormData] -> formData로 바이너리전송방식(파일업로드가능)

		$.ajax({
			url:"profile_upload.jsp",
			type:"POST",
			contentType:false,
			processData:false,	//쿼리스트링 안붙게 된다
			data : formData,	//파일전송하려고
			dataType: "json",
			error:function( xhr ){
				console.log( xhr.status );
			},
			success:function( jsonObj ){
				//파일업로드 성공여부 따로 안알려주고,,,
				if( jsonObj.resultFlag ){
					$("#imgName").val( $("#profileImg").val() );
				}else{
					console.log("프로필 이미지 업로드 실패~");
				}//end else
			}

		});//ajax
		*/
		
	});//click
	
	$("#btnUpdate").click(function(){
		if( confirm("진짜로 회원정보를 수정하시겠습니까????") ){
			
			////////      만약 프로필사진은 변경 안했으면?????       //////////
			//찍어보자~
			alert( $("#img")[0].src );//default.jpg
			alert( $("#img")[0].src.lastIndexOf("default.jpg") );//-1인지 보고,,,
			
			var uploadFlag= $("#img")[0].src.lastIndexOf("default.jpg") == -1 ; 
			alert("uploadFlag: "+uploadFlag); 

			if( uploadFlag ){	
				
				//AJAX FileUpload
				var frm=$("#frm")[0];
				var formData = new FormData(frm);
				alert("frm: "+frm);//[object HTMLFormElement] -> form은 태생적으로 파라미터전송방식(파일업로드X)
				alert("formData: "+formData);//[object FormData] -> formData로 바이너리전송방식(파일업로드가능)
	
				$.ajax({
					url:"profile_upload.jsp",
					type:"POST",
					contentType:false,
					processData:false,	//쿼리스트링 안붙게 된다
					data : formData,	//파일전송하려고
					dataType: "json",
					error:function( xhr ){
						console.log( xhr.status );
					},
// 					success:function( jsonObj ){
// 						//파일업로드 성공여부 따로 안알려주고,,,
// 						if( jsonObj.resultFlag ){
// 							$("#imgName").val( $("#profileImg").val() );
// 						}else{
// 							console.log("프로필 이미지 업로드 실패~");
// 						}//end else
// 					}
					success:function( jsonObj ){
						
						if( jsonObj.resultFlag ){
							alert("jsonObj.fileName: "+jsonObj.fileName);
							$("#imgName").val( jsonObj.fileName );//value변경했다~
							//이미지가 업로드된 후, submit하게 한다~
							$("#frm").submit();//submit
						
							alert( "imgName: "+ $("#imgName").val() );
							
						}else{
							console.log("프로필 이미지가 업로드 되지 않았습니다.");
						}//else
							
					}
				});//ajax
				
				
				
			}//end if(이미지 업로드)
				
// 			$("#frm").submit();//submit
		}//end if
	});//click
	
});//ready
</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">마이페이지</span></div><hr>
<div id="container">

<form action="mypage_process.jsp" method="post" name="frm" id="frm">
<div style="width:300px; height: auto; margin-bottom: 20px">
<%-- <img src="http://192.168.10.88/jsp_prj/common/images/${ mDTO.profile }" --%>
<%-- <img src="${ mDTO.profile eq 'default.jpg'?"../common/images":uploadURL}/${ mDTO.profile }" --%>

<h5>${ mDTO.profile }</h5>
<img src="${mDTO.profile eq 'default.jpg'?"http://192.168.10.88/jsp_prj/common/images":"http://192.168.10.88/jsp_prj/upload"}/${ mDTO.profile }"
id="img" style="width: 300px; height: 150px"/>
<br>
	<input type="button" value="이미지선택" id="btnImg" 
	class="btn btn-outline-danger btn-sm"/>
	<input type="hidden" name="imgName" id="imgName"/>
	<input type="file" style="display: none" name="profileImg" id="profileImg"/>
</div>
</form>	
	
	<div>
		<table>
		<tr>
		<td>이름</td>
		<td><c:out value="${mDTO.name }"/></td>
		</tr>
		<tr>
		<td>생년월일</td>	
		<td><input type="date" name="birth" value="${ mDTO.birth }"/></td>
		</tr>
		<tr>
		<td>전화번호</td>
		<td><input type="text" name="tel" value="${ mDTO.tel }"/></td>
		</tr>
		<tr>
		<td>성별</td>
		<td><input type="radio" name="gender" value="남자" ${ mDTO.gender eq '남자'?" checked='checked'":""}/>남자
		<input type="radio" name="gender" value="여자" ${ mDTO.gender eq '여자'?" checked='checked'":""}/>여자</td>
		</tr>
		<tr>
		<td>가입IP</td>
		<td><c:out value="${ mDTO.ip }"/></td>
		</tr>
		<tr>
		<td>가입일</td>
		<td><fmt:formatDate value="${ mDTO.input_date }" pattern="yyyy-MM-dd a EEEE HH:mm"/></td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="button" id="btnUpdate" value="정보변경" class="btn btn-danger" style="width:100%"/></td>
		</tr>
		</table>
	</div>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>