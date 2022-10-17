<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="inner-container">
		<div class="memberDetail">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<h3>My Account</h3>
						<div class="memberDetail-con">
							<div class="profile"><img src="./img/profile.png" alt="profile" /></div>
							<ul class="info-con">
								<li>
									<span>ID:</span>
									<span>${member.userId}</span>
								</li>
								<li>
									<span>Name:</span>
									<span>${member.userName}</span>
								</li>							
								<li>
									<span>E-mail:</span>
									<span>${member.email}</span>
								</li>
								<li>
									<span>Join Date:</span>
									<span>${member.joinDate}</span>
								</li>
								<li>
									<span>Writings:</span>
									
									<c:choose>
										<c:when test="${requestScope.writingsNum eq '0'}">
											<span>${requestScope.writingsNum}</span>											
										</c:when>
										<c:otherwise>
											<span><a href="userArticleList.bo?userId=${member.userId}">${requestScope.writingsNum}</a></span>										
										</c:otherwise>
									</c:choose>
									
								</li>
								<li><a href="memberMod.mo?userId=${member.userId}" class="btn">Edit Info</a></li>
							</ul>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>