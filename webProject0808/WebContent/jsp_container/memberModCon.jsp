<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="inner-container">
		<div class="memberMod">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<h3>Edit Profile</h3>
						<div class="memberMod-con">
							<form action="#" method="post" id="modForm">
								<ul>
									<li>
										<label for="userId" class="label">ID:</label>
										<input type="text" name="userId" id="userId" value="${member.userId}" readonly />
									</li>
									<li>
										<label for="userName" class="label">Name:</label>
										<input type="text" name="userName" id="userName" value="${member.userName}" />
									</li>							
									<li>
										<label for="email" class="label">E-mail:</label>
										<input type="text" name="email" id="email" value="${member.email}" />
									</li>
									
									<c:choose>
										<c:when test="${sessionScope.author eq 'admin'}">
											<li>
												<input type="button" value="Edit" class="btn2" id="modForAdminBtn" />
												<input type="button" value="Delete" class="btn2" id="deletePopUpBtn2" />
												<input type="hidden" name="userPwForAdmin" id="userPwForAdmin" value="${member.userPw}"  />
											</li>
										</c:when>
										
										<c:otherwise>
											<li>
												<label for="userPw" class="label">Password:</label>
												<input type="password" name="userPw" id="userPw" />
												<input type="button" value="Save Changes" id="modBtn" />
											</li>
											<li class="btn-box">
												<input type="button" value="← Back" class="btn" id="gobackBtn" />
												<input type="button" value="Delete Account →" class="btn" id="deletePopUpBtn" />	
											</li>
										</c:otherwise>									
									</c:choose>
									
								</ul>
							</form>
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
			<h2>Delete Account</h2>
			<form action="#" method="post" id="deleteForm">
				<ul>
				
					<c:choose>
						<c:when test="${sessionScope.author eq 'admin'}">
							<li>If you delete ${member.userId}'s account, everything ${member.userId} writes will be deleted.</li>
							<li>Are you sure you want to delete ${member.userId}'s account?</li>
							<li>
								<input type="hidden" name="userPw2" value="${member.userPw}" />
							</li>
						</c:when>
						<c:otherwise>
							<li>If you delete your account, everything you write will be deleted.</li>
							<li>Enter your password below to delete your account.</li>
							<li>
								<span>password: </span>
								<input type="password" name="userPw" id="userPw" />
							</li>
						</c:otherwise>
					</c:choose>				
				
					<li>
						<input type="button" value="cancel" id="closePopUpBtn" />
						<input type="button" value="delete" id="deleteBtn" />
					</li>
				</ul>
			</form>
		</div>	
	</div>
</div>