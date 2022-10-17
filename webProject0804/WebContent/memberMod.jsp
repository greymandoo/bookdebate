<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PROFILE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Merriweather&family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/memberMod.css" />

<c:choose>
	<c:when test="${sessionScope.author eq 'admin'}">
		<script src="./js/memberModifyForAdmin.js" defer></script>
		<script src="./js/memberDeleteForAdmin.js" defer></script>		
	</c:when>
	<c:when test="${sessionScope.sessionUser eq param.userId}">
		<script src="./js/memberModify.js" defer></script>
		<script src="./js/goback.js" defer></script>
		<script src="./js/memberDelete.js" defer></script>	
	</c:when>
</c:choose>

</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/memberModCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>