<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${(sessionScope.author ne 'admin') and (sessionScope.sessionUser ne article.userId)}">
	<script>
		alert('권한이 없습니다.');
		location.href = 'articleView.bo?articleNo='+${article.articleNo};
	</script>
</c:if>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDIT</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/articleModify.css" />
<script src="./js/articleModify.js" defer></script>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/articleModifyCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>