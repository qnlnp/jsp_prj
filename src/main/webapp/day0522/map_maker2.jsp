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
<title>day0522/map_maker2.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold; color:black}
 
 
</style>


<!-- 다음 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8d838bea0578c7a2e7f6c71a305652d"></script> 
<script type="text/javascript">
$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.498189, 127.0315992), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '제주은희네', 
        latlng: new kakao.maps.LatLng(37.498189, 127.0315992)
    },
    {
    	title: '탄', 
        latlng: new kakao.maps.LatLng(37.4988739, 127.0346841)
    },
    {
        title: '호보식당', 
        latlng: new kakao.maps.LatLng(37.4980618, 127.0346506)
    },
    {
        title: '명동칼국수',
        latlng: new kakao.maps.LatLng(37.5008458, 127.0339423)
    }
];

//마커 이미지의 이미지 주소입니다
//var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
  
for (var i = 0; i < positions.length; i ++) {
  
  // 마커 이미지의 이미지 크기 입니다
  var imageSize = new kakao.maps.Size(24, 35); 
  
  // 마커 이미지를 생성합니다    
 //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
  
  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: positions[i].latlng, // 마커를 표시할 위치
      title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    //  image : markerImage // 마커 이미지 
  });
}

});//ready


</script>



</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">subTitle</span></div><hr>
<div id="container">



<h2>맛집 지도 ( 이건 맛도리! )</h2>
<div id="map" style="width:100%;height:550px;"></div>




</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>