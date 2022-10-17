<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div class="container">
	<div class="inner-container">
		<div class="bookList">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="title">
							<h3>Books</h3>
								<a href="bookAddView.do">+ Add Book</a>							
						</div>
						
						<c:choose>
							<c:when test="${(not empty requestScope.category) and (empty books)}">
								<div class="noBooks">There are no books that match your search criteria.</div>
							</c:when>
							<c:otherwise>
								<table>
									<tr>
										<th>No.</th>
										<th>Cover</th>
										<th>ISBN13</th>
										<th>Title</th>
										<th>Author</th>
										<th>Publisher</th>
										<th>Published Date</th>
										<th>Detail / Modify</th>
									</tr>
										
									<c:forEach var="book" items="${books}" varStatus="bookCount">
										<tr>
											<td>${totalNum - (requestScope.page-1)*10 - bookCount.count + 1}</td>
											<td><img src="./img/upload/${book.bookNo}/${book.cover}" alt="cover" /></td>
											<td>${book.bookNo}</td>
											<td>${book.b_title}</td>
											<td>${book.author}</td>
											<td>${book.publisher}</td>
											<td>${book.p_date}</td>
											<td><a href="bookView.do?bookNo=${book.bookNo}">Detail</a> / <a href="bookModifyView.do?bookNo=${book.bookNo}">Modify</a></td>
										</tr>
									</c:forEach>
										
								</table>
							</c:otherwise>
						</c:choose>
						 
						<div class="sp"> 
						<c:choose>
							<c:when test="${not empty requestScope.category}">
								<div class="search-box">
									<form action="searchBookForAdmin.do" method="get" id="searchForm">
										<select name="category" id="category">
											<option value="">Categories</option>
											<option value="bookNo" <c:if test="${requestScope.category eq 'bookNo'}">selected</c:if>>ISBN13</option>
											<option value="b_title" <c:if test="${requestScope.category eq 'b_title'}">selected</c:if>>title</option>
											<option value="author" <c:if test="${requestScope.category eq 'author'}">selected</c:if>>author</option>
											<option value="publisher" <c:if test="${requestScope.category eq 'publisher'}">selected</c:if>>publisher</option>
											<option value="introduction" <c:if test="${requestScope.category eq 'introduction'}">selected</c:if>>introduction</option>
										</select> 
										<input type="text" name="searching" id="searching" value="${requestScope.searching}" /> 
										<input type="button" value="search" id="searchBtn" />
									</form>
								</div>
								
								<div class="page-box">
										<ul>
										
											<c:choose>
												<c:when test="${requestScope.totalNum le 100}">
													<c:forEach var="page" begin="1" end="${(requestScope.totalNum-1)/10 + 1}" step="1">
														<c:choose>
															<c:when test="${requestScope.page == page}">
																<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=${page}" class="now">${page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=${page}">${page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												
												<c:otherwise>
													<c:choose>
														<c:when test="${requestScope.section eq requestScope.lastSection}">
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
															<c:forEach var="page" begin="1" end="${requestScope.lastPage - (requestScope.lastSection-1)*10}" step="1">
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:when>
														
														<c:when test="${requestScope.section eq 1}">
															<c:forEach var="page" begin="1" end="10" step="1">								
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
														</c:when>
														
														<c:otherwise>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
															<c:forEach var="page" begin="1" end="10" step="1">								
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="searchBookForAdmin.do?category=${requestScope.category}&searching=${requestScope.searching}&section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>												</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>			
												
										</ul>
									</div>								
							</c:when>
							<c:otherwise>
								<div class="search-box">
									<form action="searchBookForAdmin.do" method="get" id="searchForm">
										<select name="category" id="category">
											<option value="">Categories</option>
											<option value="bookNo" >ISBN13</option>
											<option value="b_title" >title</option>
											<option value="author" >author</option>
											<option value="publisher" >publisher</option>
											<option value="introduction" >introduction</option>
										</select> 
										<input type="text" name="searching" id="searching" /> 
										<input type="button" value="search" id="searchBtn" />
									</form>
								</div>
								
								<div class="page-box">
										<ul>
										
											<c:choose>
												<c:when test="${requestScope.totalNum le 100}">
													<c:forEach var="page" begin="1" end="${(requestScope.totalNum-1)/10 + 1}" step="1">
														<c:choose>
															<c:when test="${requestScope.page == page}">
																<li><a href="bookListForAdmin.do?section=1&page=${page}" class="now">${page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="bookListForAdmin.do?section=1&page=${page}">${page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												
												<c:otherwise>
													<c:choose>
														<c:when test="${requestScope.section eq requestScope.lastSection}">
															<li><a href="bookListForAdmin.do?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="bookListForAdmin.do?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
															<c:forEach var="page" begin="1" end="${requestScope.lastPage - (requestScope.lastSection-1)*10}" step="1">
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="bookListForAdmin.do?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="bookListForAdmin.do?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:when>
														
														<c:when test="${requestScope.section eq 1}">
															<c:forEach var="page" begin="1" end="10" step="1">								
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="bookListForAdmin.do?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="bookListForAdmin.do?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="bookListForAdmin.do?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="bookListForAdmin.do?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
														</c:when>
														
														<c:otherwise>
															<li><a href="bookListForAdmin.do?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
															<li><a href="bookListForAdmin.do?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
															<c:forEach var="page" begin="1" end="10" step="1">								
																<c:choose>
																	<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																		<li><a href="bookListForAdmin.do?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a href="bookListForAdmin.do?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<li><a href="bookListForAdmin.do?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
															<li><a href="bookListForAdmin.do?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>												</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>			
												
										</ul>
									</div>
							</c:otherwise>
						</c:choose>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>