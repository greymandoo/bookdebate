package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.BoardDAO;

public class ArticleAjaxModifyCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 수정");
		
		HttpSession session = request.getSession();
		String author = (String)session.getAttribute("author");

		int articleNo = Integer.parseInt(request.getParameter("articleNum"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		content = content.replaceAll("\r\n", "<br>");
		content = content.replaceAll("\n", "<br>");
		String b_title = request.getParameter("b_title");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		int rs = 0;

		if(author.equals("admin")) {
			rs = dao.modifyForAdminDo(articleNo, title, content, b_title);
		} else {
			String userId = (String)session.getAttribute("sessionUser");
			rs = dao.modifyDo(articleNo, title, b_title, content, userId);
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs != 1) {
			System.out.println("게시글 수정 실패");
			out.println("0");
		} else {
			System.out.println("게시글 수정 성공");
			out.println("1");
		}
		
		out.close();
		
	}
}
