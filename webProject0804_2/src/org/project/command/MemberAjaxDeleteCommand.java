package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.BoardDAO;
import org.project.DAO.MemberDAO;

public class MemberAjaxDeleteCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 삭제");
				
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		BoardDAO bdao = BoardDAO.getInstance();
		int rs2 = bdao.deleteArticlesDo(userId);
		MemberDAO dao = MemberDAO.getInstance();
		int rs = dao.deleteDo(userId, userPw);
		
		HttpSession session = request.getSession();
		String author = (String)session.getAttribute("author");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs == 1) {
			
			if(rs2 == 1) {
				System.out.println("회원 탈퇴 게시글 삭제");
			} else {
				System.out.println("게시글 미작성 회원");				
			}
			
			System.out.println("회원 삭제 성공");
			if(!author.equals("admin")) {
				session.invalidate();				
			}
			out.println("1");
		} else {
			System.out.println("회원 삭제 실패");
			out.println("0");
		}
		
		out.close();
	}
}
