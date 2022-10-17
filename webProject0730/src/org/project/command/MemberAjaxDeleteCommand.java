package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.MemberDAO;

public class MemberAjaxDeleteCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 삭제");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		MemberDAO dao = MemberDAO.getInstance();
		int rs = dao.deleteDo(userId, userPw);
		
		HttpSession session = request.getSession();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs == 1) {
			System.out.println("회원 삭제 성공");
			session.invalidate();
			out.println("1");
		} else {
			System.out.println("회원 삭제 실패");
			out.println("0");
		}
		
		out.close();
	}
}
