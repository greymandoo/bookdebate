package org.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.MemberDAO;

public class MemberAdminDeleteCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("관리자 권한 회원 삭제");
		
		HttpSession session = request.getSession();
		String author = (String)session.getAttribute("author");
		
		String url = "";

		if(author.equals("admin")) {
			
			String userId = request.getParameter("userId");
			
			MemberDAO dao = MemberDAO.getInstance();
			int rs = dao.adminDeleteDo(userId);
			
			url = "/memberList.mo";
			
			if(rs == 1) {
				System.out.println("회원 삭제 성공");
			} else {
				System.out.println("회원 삭제 실패");
			}
			
			request.setAttribute("url", url);
			
		} else {
			url = "/index.mo";
		}
	}
}
