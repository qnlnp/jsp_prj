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
<title>day0522/default_map.jsp</title>
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold; color:black}
 
 
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db0e4413f437b07d4dc68a71cc978b32"></script>
<script type="text/javascript">
$(function(){

	//지도를 담을 영역의 DOM 레퍼런스
	var container = document.getElementById('map');
	
	//지도를 생성할 때 필요한 기본 옵션
	var options = { 
		center: new kakao.maps.LatLng( 33.450701, 126.570667 ),//지도의 중심좌표.
		level: 3//지도의 레벨(확대, 축소 정도)
	};

	//지도 생성 및 객체 리턴
	var map = new kakao.maps.Map(container, options);
	
	
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

	<div id="map" style="width:1200px;height:600px;"></div>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.88/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>