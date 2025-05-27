<%@page import="day0515.Dept"%>
<%@page import="java.util.List"%>
<%@page import="day0515.DeptService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="true"%>
<%

DeptService ds = new DeptService();
List<Dept> list = ds.searchAllDept(); // List

//1. JSONArray 생성하기) [ ] (비어있는 배열이 생긴다!)
	JSONArray jsonArr = new JSONArray();

	//복합형태의 JSON
	JSONObject jsonTemp = null;
	for(Dept deptDTO : list){
		//2. data를 사용하여,,, JSONObeject 생성하기)
		jsonTemp=new JSONObject();
		jsonTemp.put("deptno", deptDTO.getDeptno());
		jsonTemp.put("deptname", deptDTO.getDname());
		jsonTemp.put("loc", deptDTO.getLoc());


		//3. JSONObject를,,, JSONArray에 넣기
		jsonArr.add(jsonTemp);
	}//end for

//4. JSONArray값을 출력하기
	String strJSON = jsonArr.toJSONString();
%>
<%= strJSON %>
