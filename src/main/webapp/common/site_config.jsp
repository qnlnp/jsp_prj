<%@ page import="kr.co.sist.config.SiteProperty"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String url
=SiteProperty.PROTOCOL
+SiteProperty.SERVER_NAME
+SiteProperty.SERVER_PORT
+SiteProperty.SERVLET_PATH
;
String site_name
=SiteProperty.SITE_NAME
;
String urlPrev
=SiteProperty.PROTOCOL
+SiteProperty.SERVER_NAME
+SiteProperty.SERVER_PORT
;



//EL로도 쓸 수 있다~~
session.setAttribute("url", url);
session.setAttribute("site_name", site_name);
session.setAttribute("urlPrev", urlPrev);


String uploadURL
=url
+SiteProperty.UPLOAD_PATH
;
/*

String logo
=url
+"/"
+SiteProperty.LOGO_IMG
;
*/

%>

