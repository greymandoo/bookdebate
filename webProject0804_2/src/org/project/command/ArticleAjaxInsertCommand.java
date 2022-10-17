package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BoardDAO;
import org.project.DTO.Board_p01;

public class ArticleAjaxInsertCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 등록");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		content = content.replaceAll("\r\n", "<br>");
		content = content.replaceAll("\n", "<br>");
		String userId = request.getParameter("userId");
		int parentNo = Integer.parseInt(request.getParameter("parentNo"));
		
		Board_p01 article = new Board_p01();
		
		article.setTitle(title);
		article.setContent(content);
		article.setParentNo(parentNo);
		article.setUserId(userId);
		
		BoardDAO dao = BoardDAO.getInstance();
		int rs = dao.insertDo(article);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs != 1) {
			System.out.println("게시글 등록 실패");
			out.println("0");
		} else {
			System.out.println("게시글 등록 성공");
			out.println("1");
		}
		
		out.close();
		
	}
}
