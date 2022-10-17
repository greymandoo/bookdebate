package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.BoardDAO;

public class ArticleAjaxDeleteCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 삭제");
				
		HttpSession session = request.getSession();
		String author = (String)session.getAttribute("author");
		
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
				
		BoardDAO dao = BoardDAO.getInstance();
		int rs = 0;
		
		if(author.equals("admin")) {
			rs = dao.deleteForAdminDo(articleNo);
		} else {
			String userId = (String)session.getAttribute("sessionUser");
			rs = dao.deleteDo(userId, articleNo);
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs >= 1) {
			System.out.println("게시글 삭제 성공");
			out.println("1");
		} else {
			System.out.println("게시글 삭제 실패");
			out.println("0");
		}
		
		out.close();
	}
}
