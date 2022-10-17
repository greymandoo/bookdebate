<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${(empty sessionScope.author) or (sessionScope.author ne 'admin')}">
	<c:redirect url="bookList.do" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOK LIST(ADMIN)</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit&family=Zilla+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/bookListForAdmin.css" />
<script src="./js/search.js" defer></script>
</head>
<body>
<%@ include file="./jsp_common/header.jsp" %>
<%@ include file="./jsp_container/bookListForAdminCon.jsp" %>
<%@ include file="./jsp_common/footer.jsp" %>
</body>
</html>