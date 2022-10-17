package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BoardDAO;
import org.project.DAO.BookDAO;
import org.project.DTO.Board_p01;

public class ArticleViewForModCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 조회 for 수정");
		
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));				
		
		BoardDAO dao = BoardDAO.getInstance();
		Board_p01 article = dao.selectArticleDo(articleNo);
		
		BookDAO bdao = BookDAO.getINSTANCE();
		ArrayList<String> b_titles = bdao.getBookList();
		
		String url = "";
		
		if(article != null) {
			System.out.println("게시글 조회 성공");
			request.setAttribute("article", article);
			if(b_titles != null) {
				System.out.println("책 제목 목록 조회 성공");
				request.setAttribute("b_titles", b_titles);
				url = "articleModify.jsp";				
			} else {
				System.out.println("책 제목 목록 조회 실패");
				url = "articleList.bo";
			}
		} else {
			System.out.println("게시글 조회 실패");
			url = "/articleList.bo";
		}
		
		request.setAttribute("url", url);
		
	}
}
