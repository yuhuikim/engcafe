<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>

</head>
<body>

<section id="header">
	<div id="headerDisp"><tiles:insertAttribute name="header"></tiles:insertAttribute></div>
</section>
<div class="container" align="center" style="padding-top:5x;padding-left:40px;padding-right:40px;">

	<section id="menu">
		<div id="menuDisp"><tiles:insertAttribute name="menu"></tiles:insertAttribute></div>
	</section>
	
	<section id="body">
		<div id="bodyDisp"><tiles:insertAttribute name="body"></tiles:insertAttribute></div>
	</section>
</div>

<section id="footer">
	<div id="footerDisp"><tiles:insertAttribute name="footer"></tiles:insertAttribute></div>
</section>	
</body>
</html>