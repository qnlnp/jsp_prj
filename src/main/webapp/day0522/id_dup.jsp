<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매유의사항</title>

<!-- bootstrap CDN ( https://getbootstrap.com/docs/5.3/getting-started/introduction/ ) -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<style type="text/css">
#wrap{ position:relative; margin: 0px auto; width: 502px; height: 303px; }
#background{ height:303px;
background-image: url("http://192.168.10.88/html_prj/js0418/images/id_background.png");
background-repeat: no-repeat;
background-position: center;
}

#inputDiv{ width: 324px;  height:303px; position: absolute; top: 110px; left: 24px;}
#btn{ position: absolute; left:250px;} 
</style>
</head>

<body>
<div id=wrap>
	<div id="background">
		<div id="inputDiv">
			<form name="subFrm">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" autofocus="autofocus"
				value="${ param.id }"/> <!-- 간단하게 EL을 써보았다~ -->
				<input type="button" id="btn" value="중복확인" class="btn btn-primary"/>
			</form>
		</div><!-- inputDiv -->
	</div>
</div>
</body>
</html>