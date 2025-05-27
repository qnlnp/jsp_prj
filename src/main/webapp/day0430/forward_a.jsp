<%@page import="day0430.DataDTO"%>
<%@page import="java.util.List"%>
<%@page import="day0430.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="요청을 받아서,,, 업무를처리하는 용도의 페이지(데이터 처리)"%>

<%
//업무처리 페이지에서는 응답이 되지 않기때문에,,, 디자인코드를 작성하지 않고,
//업무로직구현에 집중해야 한다.



//0. 업무처리 로직
//---------------------------------------
Service service = new Service();
String name=service.name();
List<DataDTO> list = service.subject();
//---------------------------------------

//1. 이동할 페이지로 값 설정( 바로 그 접점이,,, 내장객체 )
request.setAttribute("name", name);
request.setAttribute("list", list);

//2. 이동할 페이지를 설정
RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");
//3. 이동
rd.forward(request, response);
%>
