<%@page import="org.project.DTO.Board_p01"%>
<%@page import="org.project.DTO.Member_p01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board_p01 article = (Board_p01)request.getAttribute("article");
%>  
<div class="container">
	<div class="inner-container">
		<div class="articleView">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="article">
							<h4 class="title"><%= article.getTitle() %></h4>
							<p class="info">
								<span>작성자: <%= article.getUserId() %></span>
								<span><%= article.getWriteDate() %></span>
							</p>
							<p class="content"><%= article.getContent() %></p>
							<p></p>
						</div>
						<div class="btn-box">
							<%
								if(session.getAttribute("sessionUser") != null ) {
									String sessionUser = (String)session.getAttribute("sessionUser");
									String articleWriter = article.getUserId();
									if(sessionUser.equals(articleWriter)) {
							%>
							<a href="#" class="btn">EDIT</a>
							<a href="#" class="btn">DELETE</a>
							<% }} %>
							<a href="articleList.bo" class="btn">LIST</a>
							<a href="#" class="btn">REPLY</a>						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>