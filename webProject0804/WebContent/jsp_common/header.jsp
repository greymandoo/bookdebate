<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">
	<div class="inner-header">
		<div class="nav">
			<div class="logo"><a href="index.mo"><img src="./img/logo.png" alt="logo" /></a></div>
			<div class="gnb">
				<ul class="left">
					<li><a href="articleList.bo">게시판</a></li>

					<c:choose>
						<c:when test="${not empty sessionScope.author}">
							<c:if test="${sessionScope.author eq 'admin'}">
								<li><a href="memberList.mo">회원 목록</a></li>								
							</c:if>
								<li><span>안녕하세요, </span><a href="memberDetail.mo?userId=${sessionScope.sessionUser}" class="name">${sessionScope.sessionUserName}</a><span>님!</span></li>
								<li><a href="memberLogout.mo">로그아웃</a></li>							
						</c:when>
						<c:otherwise>
							<li><a href="memberSignup.mo">회원가입</a></li>
							<li><a href="memberLogin.mo">로그인</a></li>						
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
</div>