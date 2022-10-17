<%@page import="org.project.DTO.Member_p01"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member_p01> members = (ArrayList<Member_p01>)request.getAttribute("members");
%>    
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
									<th>Modify / Delete</th>
								</tr>
								<%
									for(Member_p01 member : members) {
								%>
								<tr>
									<td><%= member.getUserId() %></td>
									<td><%= member.getUserPw() %></td>
									<td><%= member.getUserName() %></td>
									<td><%= member.getEmail() %></td>
									<td><%= member.getJoinDate() %></td>
									<td><a href="memberMod.mo?userId=<%=member.getUserId() %>">Modify</a> / <a href="memberDelete.mo?userId=<%=member.getUserId() %>">Delete</a></td>
								</tr>
								<% } %>
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>