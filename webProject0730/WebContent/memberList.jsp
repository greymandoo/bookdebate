<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&family=Zilla+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/memberList.css" />
<%
	String author2 = (String)session.getAttribute("author");
 if(author2 == null || !author2.equals("admin")) {
 response.sendRedirect("/webProject0729/index.mo");
 }
%>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/memberListCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>