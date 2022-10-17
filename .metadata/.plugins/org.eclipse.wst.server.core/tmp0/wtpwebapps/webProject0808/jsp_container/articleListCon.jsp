<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="inner-container">
		<div class="articleList">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<h3 class="title">Board</h3>

						<c:choose>
							<c:when test="${(empty articles) and (empty requstScope.category)}">
								<div class="noArticles">No Articles have been written yet. Write the first article.</div>
							</c:when>
							<c:when test="${(empty articles) and (not empty requstScope.category)}">
								<div class="noArticles">There are no articles that match your search criteria.</div>
							</c:when>
							<c:when test="${not empty articles}">
								<table>
									<tr>
										<th>No.</th>
										<th>Writer</th>
										<th>Title</th>
										<th>Write Date</th>
									</tr>

									<c:forEach var="article" items="${articles}" varStatus="articleCount">
										<tr>
											<td>${totalNum - (requestScope.page-1)*10 - articleCount.count + 1}</td>
											<td>${article.userId}</td>
											
											
											<td>
												<c:if test="${article.level > 1}">
													<c:forEach begin="1" end="${article.level}" step="1">
														<span style="padding-left: 10px"></span>
													</c:forEach>
													<span>└</span>
												</c:if>
													<c:if test="${(not empty article.b_title) and (article.b_title ne 'no_b_title')}">
														<a href="searchArticle.bo?category=b_title&searching=${article.b_title}"><span class="b_title">[${article.b_title}]</span></a><span> </span>							
													</c:if>
												<a href="articleView.bo?articleNo=${article.articleNo}">${article.title}</a>
											</td>
											
											
											<td>${article.writeDate}</td>
										</tr>
									</c:forEach>

								</table>
							</c:when>
						</c:choose>

						<div class="btn-box">
							<a href="articleWrite.bo" class="btn">write</a>
						</div>
						
						<c:choose>
							<c:when test="${not empty requestScope.category}">
								<div class="search-box">
									<form action="searchArticle.bo" method="get" id="searchForm">
										<select name="category" id="category">
											<option value="">Categories</option>
											<option value="book"
												<c:if test="${requestScope.category eq 'b_title'}">selected</c:if>>book</option>
											<option value="title"
												<c:if test="${requestScope.category eq 'title'}">selected</c:if>>title</option>
											<option value="content"
												<c:if test="${requestScope.category eq 'content'}">selected</c:if>>content</option>
										</select> 
										<input type="text" name="searching" id="searching" value="${requestScope.searching}" /> 
										<input type="button" value="search" id="searchBtn" />
									</form>
								</div>
		
								<c:if test="${not empty articles}">
									<div class="page-box">
										<ul>
		
											<c:choose>
												<c:when test="${requestScope.totalNum le 100}">
													<c:forEach var="page" begin="1"	end="${(requestScope.totalNum-1)/10 + 1}" step="1">
														<c:choose>
															<c:when test="${requestScope.page == page}">
																<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=${page}" class="now">${page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=${page}">${page}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
		
												<c:otherwise>
													<c:choose>
														<c:when	test="${requestScope.section eq requestScope.lastSection}">
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>
															<c:forEach var="page" begin="1" end="${requestScope.lastPage - (requestScope.lastSection-1)*10}" step="1">
																<c:choose>
																	<c:when	test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:when>
		
														<c:when test="${requestScope.section eq 1}">
															<c:forEach var="page" begin="1" end="10" step="1">
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
														</c:when>
		
														<c:otherwise>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>
															<c:forEach var="page" begin="1" end="10" step="1">
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="searchArticle.bo?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
		
										</ul>
									</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${not empty articles}">
									<div class="search-box">
										<form action="searchArticle.bo" method="get" id="searchForm">
											<select name="category" id="category">
												<option value="">Categories</option>
												<option value="b_title">book</option>
												<option value="title">title</option>
												<option value="content">content</option>
											</select> 
											<input type="text" name="searching" id="searching" /> 
											<input type="button" value="search" id="searchBtn" />
										</form>
									</div>
		
									<div class="page-box">
										<ul>
		
											<c:choose>
												<c:when test="${requestScope.totalNum le 100}">
													<c:forEach var="page" begin="1"	end="${(requestScope.totalNum-1)/10 + 1}" step="1">
														<c:choose>
															<c:when test="${requestScope.page == page}">
																<li><a href="articleList.bo?section=1&page=${page}"	class="now">${page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="articleList.bo?section=1&page=${page}">${page}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
		
												<c:otherwise>
													<c:choose>
														<c:when	test="${requestScope.section eq requestScope.lastSection}">
															<li><a href="articleList.bo?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="articleList.bo?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i	class="bi bi-chevron-left"></i></a></li>
															<c:forEach var="page" begin="1"	end="${requestScope.lastPage - (requestScope.lastSection-1)*10}" step="1">
																<c:choose>
																	<c:when	test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="articleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}"	class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="articleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:when>
		
														<c:when test="${requestScope.section eq 1}">
															<c:forEach var="page" begin="1" end="10" step="1">
																<c:choose>
																	<c:when	test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="articleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="articleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="articleList.bo?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="articleList.bo?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
														</c:when>
		
														<c:otherwise>
															<li><a href="articleList.bo?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="articleList.bo?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>
															<c:forEach var="page" begin="1" end="10" step="1">
																<c:choose>
																	<c:when	test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="articleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="articleList.bo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="articleList.bo?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="articleList.bo?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
		
										</ul>
									</div>
								</c:if>
							
							</c:otherwise>						
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>