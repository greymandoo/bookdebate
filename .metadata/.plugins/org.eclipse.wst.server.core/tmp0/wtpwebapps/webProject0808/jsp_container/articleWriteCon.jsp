<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="container">
	<div class="inner-container">
		<div class="articleWrite">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<form action="#" method="post" id="writeForm">
							<ul>
								<c:if test="${empty param.articleNo}">
									<li class="b_title">
										<span>Book: </span>
										<select name="b_title" id="b_title">
											<option value="">---</option>
											<c:forEach var="b_title" items="${b_titles}">
												<c:choose>
													<c:when test="${not empty param.b_title}">
														<c:if test="${param.b_title eq b_title }">
															<option value="${b_title}" selected>${b_title}</option>
														</c:if>
														<c:if  test="${param.b_title ne b_title }">
															<option value="${b_title}">${b_title}</option>																											
														</c:if>
													</c:when>
													<c:otherwise>
														<option value="${b_title}">${b_title}</option>													
													</c:otherwise>
												</c:choose>
											</c:forEach>									
										</select>
									</li>								
								</c:if>
								<c:if test="${not empty param.articleNo}">
									<input type="hidden" name="b_title" value="" />
								</c:if>
								<li class="title">
									<label for="title">Title:</label>
									<input type="text" name="title" id="title" />
								</li>
								<li class="content">
									<textarea name="content" id="content"></textarea>
									<input type="hidden" name="userId" value="${sessionScope.sessionUser}" />
									<input type="hidden" name="parentNo" value="${not empty param.articleNo ? param.articleNo:'0'}" />
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