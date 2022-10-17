<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div class="container">
	<div class="inner-container">
		<div class="memberList">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<h3 class="title">Members</h3>
						<table>
							<tr>
								<th>ID</th>
								<th>Password</th>
								<th>Name</th>
								<th>E-mail</th>
								<th>Join Date</th>
								<th>Modify</th>
							</tr>
								
							<c:forEach var="member" items="${members}">
								<tr>
									<td>${member.userId}</td>
									<td>${member.userPw}</td>
									<td>${member.userName}</td>
									<td>${member.email}</td>
									<td>${member.joinDate}</td>
									<td><a href="memberMod.mo?userId=${member.userId}">Modify</a></td>
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
														<li><a href="memberList.mo?section=1&page=${page}" class="now">${page}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="memberList.mo?section=1&page=${page}">${page}</a></li>													
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										
										<c:otherwise>
											<c:choose>
												<c:when test="${requestScope.section eq requestScope.lastSection}">
													<li><a href="memberList.mo?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
													<li><a href="memberList.mo?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
													<c:forEach var="page" begin="1" end="${requestScope.lastPage - (requestScope.lastSection-1)*10}" step="1">
														<c:choose>
															<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																<li><a href="memberList.mo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="memberList.mo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												
												<c:when test="${requestScope.section eq 1}">
													<c:forEach var="page" begin="1" end="10" step="1">								
														<c:choose>
															<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																<li><a href="memberList.mo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="memberList.mo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li><a href="memberList.mo?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
													<li><a href="memberList.mo?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>
												</c:when>
												
												<c:otherwise>
													<li><a href="memberList.mo?section=1&page=1"><i class="bi bi-chevron-double-left"></i></a></li>
													<li><a href="memberList.mo?section=${requestScope.section-1}&page=${(requestScope.section-1)*10}"><i class="bi bi-chevron-left"></i></a></li>													
													<c:forEach var="page" begin="1" end="10" step="1">								
														<c:choose>
															<c:when test="${(requestScope.page - (requestScope.section-1)*10) == page}">
																<li><a href="memberList.mo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}" class="now">${(requestScope.section-1)*10+page}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="memberList.mo?section=${requestScope.section}&page=${(requestScope.section-1)*10+page}">${(requestScope.section-1)*10+page}</a></li>													
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<li><a href="memberList.mo?section=${requestScope.section+1}&page=${requestScope.section*10+1}"><i class="bi bi-chevron-right"></i></a></li>
													<li><a href="memberList.mo?section=${requestScope.lastSection}&page=${requestScope.lastPage}"><i class="bi bi-chevron-double-right"></i></a></li>												</c:otherwise>
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