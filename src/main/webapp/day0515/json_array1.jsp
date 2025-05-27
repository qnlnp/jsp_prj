<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="true"%>
<%! @SuppressWarnings("unchecked") %>
<%


String name = "이장훈";
int age = 25;

String name2 = "주현석";
int age2 = 26;

//1. JSONArray 생성하기) [ ] (비어있는 배열이 생긴다!)
	JSONArray jsonArr = new JSONArray();

	
//2. data를 사용하여,,, JSONObeject 생성하기)
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("name", name);
	jsonObj.put("age", age);
	
	JSONObject jsonObj2 = new JSONObject();
	jsonObj2.put("name", name2);
	jsonObj2.put("age", age2);
	
//3. JSONObject를,,, JSONArray에 넣기
	jsonArr.add(jsonObj);
	jsonArr.add(jsonObj2);
	
//4. JSONArray값을 출력하기
	String strJSON = jsonArr.toJSONString();
%>
<%= strJSON %>
