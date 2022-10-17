<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String author2 = (String)session.getAttribute("author");
 if(author2 == null) {
 response.sendRedirect("/webProject0726/index.mo");
 }
%>
<title>회원 정보 수정</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&family=Zilla+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/memberMod.css" />
<%
	if(author2.equals("admin")) {
%>
<script src="./js/memberModifyForAdmin.js" defer></script>
<%
	} else {
%>
<script src="./js/memberModify.js" defer></script>
<script src="./js/goback.js" defer></script>
<script src="./js/memberDelete.js" defer></script>
<%
	}
%>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/memberModCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>