<%@page import="org.project.DTO.Board_p01"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board_p01> articles = (ArrayList<Board_p01>)request.getAttribute("articles");
%>    
<div class="container">
	<div class="inner-container">
		<div class="articleList">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
							<h3 class="title">Board</h3>
							<table>
								<tr>
									<th>No.</th>
									<th>Writer</th>
									<th>Title</th>
									<th>Write Date</th>
								</tr>
								<%
									int num = articles.size()+1;
															for(Board_p01 article : articles) { 
															--num;
								%>
								<tr>
									<td><%= num %></td>
									<td><%= article.getUserId() %></td>
									<td><a href="articleView.bo?articleNo=<%= article.getArticleNo() %>"><%= article.getTitle() %></a></td>
									<td><%= article.getWriteDate() %></td>
								</tr>
								<% } %>
							</table>
							<div class="btn-box">								
								<a href="articleWrite.bo" class="btn">write</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>