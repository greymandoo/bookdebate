<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="inner-container">
		<div class="signup">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="signup-con">
							<form action="#" method="post" id="signupForm">
								<h2 class="title">회원가입</h2>
								<ul>
									<li class="label"><label for="userId">아이디</label></li>							
									<li>
										<input type="text" name="userId" id="userId" class="enterEvent" />
										<input type="button" value="중복확인" class="btn" id="IDcheckBtn" />
									</li>							
									<li class="label"><label for="userPw">비밀번호</label></li>							
									<li><input type="password" name="userPw" id="userPw" class="enterEvent" /></li>							
									<li class="label"><label for="userPw2">비밀번호 확인</label></li>							
									<li>
										<input type="password" name="userPw2" id="userPw2" class="enterEvent" />
										<span class="pwCheck"></span>
									</li>							
									<li class="label"><label for="userName">이름</label></li>							
									<li><input type="text" name="userName" id="userName" class="enterEvent" /></li>							
									<li class="label"><label for="email">이메일</label></li>							
									<li><input type="text" name="email" id="email" class="enterEvent" /></li>													
									<li class="btn-box">
										<span>이미 회원이신가요? <a href="memberLogin.mo">로그인</a></span>
										<input type="button" value="가입" id="signupBtn" class="btn" />
									</li>	
								</ul>						
							</form>
							<div class="img-box"><img src="./img/pen.png" alt="pen" /></div>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>
</div>