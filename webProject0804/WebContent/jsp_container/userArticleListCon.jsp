<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="inner-container">
		<div class="userArticleList">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
							<h3 class="title">내 글 목록</h3>
							<table>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>날짜</th>
								</tr>
								
								<c:forEach var="article" items="${articles}" varStatus="articleCount">
									<tr>
										<td>${totalNum - (requestScope.page-1)*10 - articleCount.count + 1}</td>
										<td>
											<c:if test="${article.level > 1}">
												<c:forEach begin="1" end="${article.level}" step="1">
													<span style="padding-left:10px"></span>
												</c:forEach>
												<span>└</span>
											</c:if>
											<a href="articleView.bo?articleNo=${article.articleNo}">
												${article.title}
											</a>
										</td>
										<td>${article.writeDate}</td>
									</tr>
								</c:forEach>

							</table>				

							<div class="page-box">
								<ul>
									
									<c:choose>
										<c:when test="${requestScope.totalNum le 100}">
											<c:forEach var="page" begin="1" end="${(requestScope.totalNum-1)/10 + 1}" step="1">
												<c:choose>
													<c:when test="${requestScope.page == page}">
														<li><a href="userArticleList.bo?section=1&page=${page}" class="now">${page}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="userArticleList.bo?section=1&page=${page}">${page}</a></li>													
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										
										<c:otherwise>
											<c:choose>
												<c:when test="${requestScope.section eq requestScope.lastSection}">
													<li><a href="userArticleList.bo?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
													<li><a href="userArticleList.bo?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
													<c:forEach var="page" begin="1" end="${requestScope.lastPage - (requestScope.lastSection-1)*10}" step="1">
														<c:choose>
															<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																<li><a href="userArticleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="userArticleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												
												<c:when test="${requestScope.section eq 1}">
													<c:forEach var="page" begin="1" end="10" step="1">								
														<c:choose>
															<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																<li><a href="userArticleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="userArticleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li><a href="userArticleList.bo?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
													<li><a href="userArticleList.bo?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
												</c:when>
												
												<c:otherwise>
													<li><a href="userArticleList.bo?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
													<li><a href="userArticleList.bo?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
													<c:forEach var="page" begin="1" end="10" step="1">								
														<c:choose>
															<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																<li><a href="userArticleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="userArticleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li><a href="userArticleList.bo?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
													<li><a href="userArticleList.bo?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>			
										
								</ul>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>