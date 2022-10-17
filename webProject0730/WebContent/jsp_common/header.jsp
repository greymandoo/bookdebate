<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String author = (String)session.getAttribute("author");
	String name = (String)session.getAttribute("sessionUserName");
	String userId = (String)session.getAttribute("sessionUser");
%>
<div class="header">
	<div class="inner-header">
		<div class="nav">
			<div class="logo"><a href="index.mo"><img src="./img/logo.png" alt="logo" /></a></div>
			<div class="gnb">
				<ul class="left">
					<li><a href="articleList.bo">BOARD</a></li>
					<% if(author != null && author.equals("admin")) { %>
					<li><a href="memberList.mo">MEMBERS</a></li>
					<% } %>
					<% if(author == null) { %>
					<li><a href="memberSignup.mo">SIGN UP</a></li>
					<li><a href="memberLogin.mo">LOGIN</a></li>
					<% } else { %>
					<li><span>Hello, </span><a href="memberDetail.mo?userId=<%= userId %>" class="name"><%= name %></a><span>!</span></li>
					<li><a href="memberLogout.mo">LOGOUT</a></li>
					<% } %>
				</ul>
			</div>
		</div>
	</div>
</div>