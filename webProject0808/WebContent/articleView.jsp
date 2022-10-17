<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${article.title}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/articleView.css" />
<script src="./js/articleDelete.js" defer></script>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/articleViewCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>