package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.MemberDAO;

public class MemberAjaxModifyCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 정보 수정");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
		int rs = dao.modifyDo(userId, userPw, userName, email);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs == 1) {
			System.out.println("회원 정보 수정 성공");
			out.println("1");
		} else {
			System.out.println("회원 정보 수정 실패");
			out.println("0");
		}
		
		out.close();
		
	}
}
