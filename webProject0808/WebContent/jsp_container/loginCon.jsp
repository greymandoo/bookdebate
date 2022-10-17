<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="inner-container">
		<div class="login">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<div class="login-con">
							<form action="#" method="post" id="loginForm">
								<h2 class="title">LOGIN</h2>
								<ul>
									<li class="label"><label for="userId">ID</label></li>
									<li><input type="text" name="userId" id="userId" /></li>
									<li class="label"><label for="userPw">Password</label></li>
									<li><input type="password" name="userPw" id="userPw" /></li>
									<li class="btn-box">
										<span>Don't have an account? <a href="memberSignup.mo">Sign Up</a></span>
										<input type="button" value="Log In" class="btn" id="loginBtn" />
									</li>
								</ul>				
							</form>		
							<div class="img-box"><img src="./img/lock.png" alt="pen" /></div>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>