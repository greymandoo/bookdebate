package org.project.DTO;

import java.sql.Date;

public class Member_p01 {
	private String userId;
	private String userPw;
	private String userName;
	private String email;
	private Date joinDate;
	
	public Member_p01() {}
	
	public Member_p01(String userId, String userPw, String userName, String email, Date joinDate) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.email = email;
		this.joinDate = joinDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
