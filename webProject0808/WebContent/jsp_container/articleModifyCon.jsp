<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="inner-container">
		<div class="articleModify">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<form action="#" method="post" id="modifyForm">
							<ul>
							
								<li class="b_title">
									<span>Book: </span>
									<select name="b_title" id="b_title">
										<option value="no_b_title" <c:if test="${article.b_title eq 'no_b_title'}">selected</c:if>>---</option>
										<c:forEach var="b_title" items="${b_titles}">
											<option value="${b_title}" <c:if test="${article.b_title eq b_title}">selected</c:if>>${b_title}</option>												
										</c:forEach>									
									</select>
								</li>													
							
								<li class="title">
									<label for="title">Title: </label>
									<input type="text" name="title" id="title" value="${article.title}"/>
								</li>
								<li class="content">
									<textarea name="content" id="content">${article.content}</textarea>
								</li>
								<li class="btn-box">
									<input type="button" value="BACK" id="backBtn" class="btn" />
									<input type="button" value="EDIT" id="editBtn" class="btn" />
									<input type="hidden" name="articleNum" id="articleNum" value="${article.articleNo}" />
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>