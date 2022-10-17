<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="inner-container">
		<div class="articleView">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="article">
							<h4 class="title">${article.title}</h4>
							<p class="info">
								<span>${article.userId}</span>
								<span>${article.writeDate}</span>
							</p>
							<div class="content">${article.content}</div>
						</div>
						<div class="btn-box">
							<a href="articleList.bo" class="btn">LIST</a>
							
							<c:if test="${not empty sessionScope.author}">
								<a href="articleWrite.bo?articleNo=${article.articleNo}" class="btn">REPLY</a>
							
								<c:if test="${sessionScope.sessionUser eq article.userId or sessionScope.author eq 'admin'}">
									<a href="articleModify.bo?articleNo=${article.articleNo}" class="btn">EDIT</a>
									<a href="#" id="deletePopUpBtn" class="btn">DELETE</a>								
								</c:if>
																					
							</c:if>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="deletePopUp">
	<div class="delete">
		<div class="cont">
			<form action="articleDeleteExe.mo" method="post" id="deleteForm">
				<ul>
					<li>
						<span>Are you sure you want to delete this article?</span>
						<input type="hidden" name="articleNo" value="${article.articleNo}" />
					</li>
					<li>
						<input type="button" value="cancel" id="closePopUpBtn" />
						<input type="button" value="delete" id="deleteBtn" />
					</li>
				</ul>
			</form>
		</div>	
	</div>
</div>