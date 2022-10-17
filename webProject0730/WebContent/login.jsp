<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	if((String)(session.getAttribute("sessionUser")) != null) {
		response.sendRedirect("/webProject0729/index.mo");
	}
%>
<title>SIGN UP</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/login.css" />
<script src="./js/login.js" defer></script>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/loginCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>