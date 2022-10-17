<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="inner-container">
		<div class="signup">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="signup-con">
							<form action="memberSignupExe.mo" method="post" id="signupForm">
								<h2 class="title">SIGN UP</h2>
								<ul>
									<li class="label"><label for="userId">ID</label></li>							
									<li>
										<input type="text" name="userId" id="userId" class="enterEvent" />
										<input type="button" value="ID Check" class="btn" id="IDcheckBtn" />
									</li>							
									<li class="label"><label for="userPw">Password</label></li>							
									<li><input type="password" name="userPw" id="userPw" class="enterEvent" /></li>							
									<li class="label"><label for="userPw2">Repeat Password</label></li>							
									<li>
										<input type="password" name="userPw2" id="userPw2" class="enterEvent" />
										<span class="pwCheck"></span>
									</li>							
									<li class="label"><label for="userName">Name</label></li>							
									<li><input type="text" name="userName" id="userName" class="enterEvent" /></li>							
									<li class="label"><label for="email">E-mail</label></li>							
									<li><input type="text" name="email" id="email" class="enterEvent" /></li>													
									<li class="btn-box">
										<span>Already a member? <a href="memberLogin.mo">Log In</a></span>
										<input type="button" value="Sign Up" id="signupBtn" class="btn" />
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