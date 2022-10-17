<%@page import="org.project.DTO.Board_p01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Board_p01 art = (Board_p01)request.getAttribute("article");
	String title = art.getTitle();
%>
<html>
<head>
<meta charset="UTF-8">
<title><%=title%></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/articleView.css" />
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/articleViewCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>