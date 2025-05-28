<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="../common/site_config.jsp" %>     --%>
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집등록~~</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold; color:black}
 
 
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db0e4413f437b07d4dc68a71cc978b32"></script>

<script>
$(function(){ 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.499317, 127.0332123), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    $("#lat").val(latlng.getLat());//위도 설정
    $("#lng").val(latlng.getLng());//경도 설정
    
    /*
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    */
});//addListener

});//ready
</script> 

<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){
		<c:choose>
		<c:when test="${ empty userData.id }">
// 		alert("식당정보를 입력하시려면 로그인하삼~~~");
		if( confirm("식당정보를 입력하시려면 로그인하삼~~~\n로그인하시겠습니까?????") ){
			location.href="http://192.168.10.88/jsp_prj/login/login_frm.jsp";
		}//end if
		</c:when>
		<c:otherwise>
		//여기까지 왔으면,,, 유효성검증~~
		var restaurant = $("#restaurant").val();
		var menu = $("#menu").val();
		var price = $("#price").val();
		var info = $("#info").val();
		
		if(restaurant.trim() == ""){
			alert("식당명이 비었어요,,,");
			$("#restaurant").focus();
			return;
		}//end if
		if(menu.trim() == ""){
			alert("메뉴명이 비었어요,,,");
			$("#menu").focus();
			return;
		}//end if
		if(price.trim() == ""){
			alert("가격이 비었어요,,,");
			$("#price").focus();
			return;
		}//end if
		if(info.trim() == ""){
			alert("맛집설명이 비었어요,,,");
			$("#info").focus();
			return;
		}//end if
		
		$("#restFrm").submit();//submit
		</c:otherwise>
		</c:choose>
	});//click
});//ready



</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">맛집등록</span></div><hr>
<div id="container">
<div id="restWrap" style="width:80%; margin:0 auto">
	
	<div id="map" style="width:100%; height:350px; border:1px solid #333 "></div>
	
	<form action="rest_frm_process.jsp" method="post" name="restFrm" id="restFrm">
	
	<table>
	<tbody>
	
	<tr>
	<td colspan="2" style="font-size: 30px; text-align: center" >맛집 입력</td>
	</tr>
	
	<tr>
	<td>식당명</td>
	<td><input type="text" name="restaurant" id="restaurant" style="width:500px"/></td>
	</tr>
	
	<tr>
	<td>대표메뉴</td>
	<td><input type="text" name="menu" id="menu" style="width:500px"/></td>
	</tr>
	
	<tr>
	<td>메뉴가격</td>
	<td><input type="text" name="price" id="price" style="width:500px"/></td>
	</tr>
	
	<tr>
	<td>식당정보</td>
	<td><input type="text" name="info" id="info" style="width:500px"/></td>
	</tr>
	
	<tr>
	<td colspan="2" style="text-align: center">
		<input type="hidden" name="lat" id="lat"/>
		<input type="hidden" name="lng" id="lng"/>
		<input type="button" value="식당정보추가" id="btnAdd" class="btn btn-success"/>
		<a href="restaurant_list.jsp" class="btn btn-info">맛집리스트</a>
	</td>
	</tr>
	
	</tbody>
	</table>
	
	</form>
</div>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>