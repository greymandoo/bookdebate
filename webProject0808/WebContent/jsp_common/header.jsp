<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
	<div class="inner-header">
		<div class="nav">
			<div class="logo"><a href="index.mo"><img src="./img/logo.png" alt="logo" /></a></div>
			<div class="gnb">
				<ul class="left">
					<li><a href="articleList.bo">BOARD</a></li>
					<li><a href="bookList.do">BOOKS</a></li>
					
					<c:choose>
						<c:when test="${not empty sessionScope.author}">
							<c:if test="${sessionScope.author eq 'admin'}">
								<li><a href="bookListForAdmin.do">BOOKS(ADMIN)</a></li>								
								<li><a href="memberList.mo">MEMBERS</a></li>
							</c:if>
								<li><span>Hello, </span><a href="memberDetail.mo?userId=${sessionScope.sessionUser}" class="name">${sessionScope.sessionUserName}</a><span>!</span></li>
								<li><a href="memberLogout.mo">LOGOUT</a></li>							
						</c:when>
						<c:otherwise>
							<li><a href="memberSignup.mo">SIGN UP</a></li>
							<li><a href="memberLogin.mo">LOGIN</a></li>						
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
</div>