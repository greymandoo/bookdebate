<%@page import="org.project.DTO.Member_p01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member_p01 member = (Member_p01)request.getAttribute("member");
%>
<div class="container">
	<div class="inner-container">
		<div class="memberMod">
			<div class="sections">
				<div class="section sec1">
					<div class="sec-con">
						<h3>Edit Profile</h3>
						<div class="memberMod-con">
							<form action="memberModExe.mo" method="post" id="modForm">
								<ul>
									<li>
										<label for="userId" class="label">ID:</label>
										<input type="text" name="userId" id="userId" value="<%= member.getUserId() %>" readonly />
									</li>
									<li>
										<label for="userName" class="label">Name:</label>
										<input type="text" name="userName" id="userName" value="<%= member.getUserName() %>" />
									</li>							
									<li>
										<label for="email" class="label">E-mail:</label>
										<input type="text" name="email" id="email" value="<%= member.getEmail() %>" />
									</li>
									<li>
										<label for="userPw" class="label">Password:</label>
										<input type="password" name="userPw" id="userPw" />
										<input type="button" value="Save Changes" id="modBtn" />
									</li>
									<li class="btn-box">
										<input type="button" value="← Back" class="btn" id="gobackBtn" />
										<input type="button" value="Delete Account →" class="btn" id="deletePopUpBtn" />	
									</li>
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
	<div class="cont">
		<h2>Deactivate Account</h2>
		<form action="memberDeleteExe.mo" method="post" id="deleteForm">
			<ul>
				<li>
					<span>Enter password to confirm: </span>
					<input type="password" name="userPw" id="userPw" />
				</li>
				<li>
					<input type="button" value="cancel" id="closePopUpBtn" />
					<input type="button" value="delete" id="deleteBtn" />
				</li>
			</ul>
		</form>
	</div>
</div>