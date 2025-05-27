<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="기본적으로,,, isELIgnored처리 먼저 해주자~~~~~"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0509/use_el.jsp</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #container > div{font-size: 20px}
 #div1{ color: red }
 #div2{ color: blue }
</style>
<script type="text/javascript">
$(function(){

});//ready
</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
String name="주현석";
int age=26;

%>
<div id="div1">
EL에서는,,, 변수에 직접 접근할 수 없다<br>
이름: ${ name }<br>
나이: ${ age }<br>
</div>
<%
	pageContext.setAttribute("na", name);
	pageContext.setAttribute("age", age);
%>
<div id="div2">
scope객체에 넣어서 사용해야한다.<br>
이름: <%= name %><br>
나이: <%= age %><br>
</div>
<hr>
<h3>EL에서 제공하는 연산자의 사용.</h3>
<%
boolean flag=false;
int i=5;
int j=9;
pageContext.setAttribute("flag", flag);
pageContext.setAttribute("i", i);
pageContext.setAttribute("j", j);
%>
<style>
 span{font-weight: bold}
</style>
<span>단항 연산자</span><br>
${ flag }, ${ !flag }, ${ not flag }, ${--age}<!-- EL은 단항,대입 연산자 안된다~ --><br>
<span>산술 연산자</span><br>
${ i } + ${ j } = ${i + j}, ${ i } % 2 = ${i%2}(${i mod 2})<br>
<span>관계 연산자</span><br>
${i > 4}(${i gt 4})<br>
${i < 4}(${i lt 4})<br>
${i >= 5}(${i ge 5})<br>
${i <= 5}(${i le 5})<br>
${i == 5}(${i eq 5})<br>
${i != 5}(${i ne 5})<br>
<span>논리 연산자</span><br>
${i > 4 && i < 6}(${i gt 4 and i lt 6})<br>
${i > 6 || i < 3}(${i gt 6 or i lt 3})<br>
<span>삼항 연산자</span><br>
EL에서는 문자가 없다! 문자열을 표현할 때 쌍따옴표(""), 홑따옴표(') 모두 사용 가능하다.<br>
${i % 2 == 0 ? "짝수인가?":'홀수입니다'}(${ i mod 2 eq 0 ? "짝수인가?2":'홀수입니다2' })<br>

<!-- scope객체가 가지고있는 i값이,,, 0~100이면 "유효"를, 아니면 "무효"를,,, EL로 출력하세요 -->
${ i ge 0 and i le 100 ? "유효(scope객체에 담긴 i값이,,, 0~100사이입니다)":'무효(scope객체에 담긴 i값이,,, 0~100에 없습니다)'}
<hr>
<%
String str=null;//객체가 생성되지 않음(=heap주소 없음)
String str2="";//문자열리터럴에,,, 비어있는 값(empty) 할당되어 있음
List<String> list = new ArrayList<String>();
if(new Random().nextBoolean()){
	list.add("EL사용했음");
}//end if

pageContext.setAttribute("str", str);
pageContext.setAttribute("str2", str2);
pageContext.setAttribute("list", list);
%>
<span>null 비교</span><br>
${ empty str }(${  ! not empty str })<br>
<span>"" 비교</span><br>
${ empty str2 }(${ ! not empty str2 })<br>
<span>list size가 0인지,,, 비교</span><br>
${ empty list }(${ ! not empty list })<br>

<span></span><br>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>