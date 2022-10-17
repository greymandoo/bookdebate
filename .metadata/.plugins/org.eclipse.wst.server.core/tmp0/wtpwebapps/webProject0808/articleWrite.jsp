<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.sessionUser}">
	<script>
		alert('로그인해주세요');
		location.href = 'memberLogin.mo';
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WRITE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/articleWrite.css" />
<script src="./js/articleWrite.js" defer></script>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/articleWriteCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>