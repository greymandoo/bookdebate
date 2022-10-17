<%@page import="org.project.DTO.Member_p01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member_p01 member = (Member_p01)request.getAttribute("member");
%>    
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
									<span><%= member.getUserId() %></span>
								</li>
								<li>
									<span>Name:</span>
									<span><%= member.getUserName() %></span>
								</li>							
								<li>
									<span>E-mail:</span>
									<span><%= member.getEmail() %></span>
								</li>
								<li>
									<span>Join Date:</span>
									<span><%= member.getJoinDate() %></span>
								</li>
								<li><a href="memberMod.mo?userId=<%=member.getUserId() %>" class="btn">Edit Info</a></li>
							</ul>
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>