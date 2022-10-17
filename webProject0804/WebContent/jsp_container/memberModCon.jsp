<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="inner-container">
		<div class="memberMod">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<h3>회원 정보 수정</h3>
						<div class="memberMod-con">
							<form action="#" method="post" id="modForm">
								<ul>
									<li>
										<label for="userId" class="label">아이디:</label>
										<input type="text" name="userId" id="userId" value="${member.userId}" readonly />
									</li>
									<li>
										<label for="userName" class="label">이름:</label>
										<input type="text" name="userName" id="userName" value="${member.userName}" />
									</li>							
									<li>
										<label for="email" class="label">이메일:</label>
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
												<label for="userPw" class="label">비밀번호:</label>
												<input type="password" name="userPw" id="userPw" />
												<input type="button" value="수정" id="modBtn" />
											</li>
											<li class="btn-box">
												<input type="button" value="← 뒤로가기" class="btn" id="gobackBtn" />
												<input type="button" value="회원탈퇴 →" class="btn" id="deletePopUpBtn" />	
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
			<h3>회원 탈퇴</h3>
			<form action="#" method="post" id="deleteForm">
				<ul>
				
					<c:choose>
						<c:when test="${sessionScope.author eq 'admin'}">
							<li>만약 계정을 삭제하면 ${member.userId}님이 작성한 글도 함께 삭제됩니다.</li>
							<li>${member.userId}님의 계정을 삭제하시겠습니까?</li>
							<li>
								<input type="hidden" name="userPw2" value="${member.userPw}" />
							</li>
						</c:when>
						<c:otherwise>
							<li>탈퇴하시면 작성한 글도 모두 삭제됩니다.</li>
							<li>탈퇴를 원하시면 비밀번호를 입력해주세요.</li>
							<li>
								<span>비밀번호: </span>
								<input type="password" name="userPw" id="userPw" />
							</li>
						</c:otherwise>
					</c:choose>				
				
					<li>
						<input type="button" value="취소" id="closePopUpBtn" />
						<input type="button" value="탈퇴" id="deleteBtn" />
					</li>
				</ul>
			</form>
		</div>	
	</div>
</div>