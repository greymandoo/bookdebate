<%@page import="org.project.DTO.Board_p01"%>
<%@page import="org.project.DTO.Member_p01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writerId = (String)(session.getAttribute("sessionUser"));
	if(writerId == null) {
%>
	<script>
		alert('로그인해주세요');
		history.go(-1);
	</script>
<% } %> 
<div class="container">
	<div class="inner-container">
		<div class="articleWrite">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<form action="writeArticle.bo" method="post" id="writeForm">
							<ul>
								<li class="title">
									<label for="title">Title: </label>
									<input type="text" name="title" id="title" />
								</li>
								<li class="content">
									<textarea name="content" id="content"></textarea>
									<input type="hidden" name="userId" value="<%= writerId %>" />
									<input type="hidden" name="parentNo" value="0" />
								</li>
								<li class="btn-box">
									<input type="button" value="WRITE" id="writeBtn" class="btn" />
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>