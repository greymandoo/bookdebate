package org.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.BoardDAO;
import org.project.DAO.MemberDAO;
import org.project.DTO.Member_p01;

public class MemberDetailCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 조회");
		
		HttpSession session = request.getSession();
		String userId = "";
		String url = "";
		MemberDAO dao = MemberDAO.getInstance();
		BoardDAO bdao = BoardDAO.getInstance();
		Member_p01 member = null;
		int writingsNum = 0;
		
		if(session.getAttribute("author") != null) {
			String author = (String)session.getAttribute("author");
			if(author.equals("admin")) {
				userId = request.getParameter("userId");
			} else {
				userId = (String)session.getAttribute("sessionUser");
			}
			
			writingsNum = bdao.getArticleNum(userId);
			
			if(writingsNum >= 0) {
				System.out.println("작성한 글 수 조회 성공");
				request.setAttribute("writingsNum", writingsNum);
			} else {
				System.out.println("작성한 글 수 조회 실패");
			}
			
			member = dao.selectMemberDo(userId);
			
			if(member != null) {
				System.out.println("회원 조회 성공");
				request.setAttribute("member", member);
				url = "memberDetail.jsp";
			} else {
				System.out.println("회원 조회 실패");
				url = "index.mo";
			}	
		} else {
			System.out.println("권한 없는 사용자가 접근");
			url = "index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
