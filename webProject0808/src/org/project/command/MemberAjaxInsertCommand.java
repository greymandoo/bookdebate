package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.MemberDAO;
import org.project.DTO.Member_p01;

public class MemberAjaxInsertCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 가입");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		Date joinDate = null;
		
		Member_p01 member = new Member_p01(userId, userPw, userName, email, joinDate);
		
		MemberDAO dao = MemberDAO.getInstance();
		int rs = dao.insertDo(member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs != 1) {
			System.out.println("회원 가입 실패");
			out.println("0");
		} else {
			System.out.println("회원 가입 성공");
			out.println("1");
		}
		
		out.close();
		
	}
}
