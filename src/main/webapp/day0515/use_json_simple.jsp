<%@ page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info="외부라이브러리 사용하기"%>
<%! @SuppressWarnings("unchecked") %>    
<%
	String strName="이장훈";
	int intAge=25;//데이터는 DB나, 오픈API의 키로부터 가져온다~
	
	//1. JSONObject(맵기반, 제네릭은 못쓴다) 생성
	JSONObject json = new JSONObject();
	
	//2. 값할당(JSONObject에 put() ) -> 형변환에 대해 안전하지 않다고 에러뜨기는 한다~~
	json.put("name", strName);
	
	//3. 값을 가진 JSONObject객체를 String으로 얻기
	String jsonStr = json.toJSONString();
// 	String jsonStr2 = json.toString();
	
%>
<%= jsonStr %>
<%-- <%= jsonStr2 %> --%>