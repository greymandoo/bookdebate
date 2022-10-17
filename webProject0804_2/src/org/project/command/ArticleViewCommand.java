package org.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BoardDAO;
import org.project.DTO.Board_p01;

public class ArticleViewCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 조회");
		
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));				
		
		BoardDAO dao = BoardDAO.getInstance();
		Board_p01 article = dao.selectArticleDo(articleNo);
		
		String url = "";
		
		if(article != null) {
			System.out.println("게시글 조회 성공");
			request.setAttribute("article", article);
			url = "/articleView.jsp";
		} else {
			System.out.println("게시글 조회 실패");
			url = "/articleList.bo";
		}
		
		request.setAttribute("url", url);
		
	}
}
