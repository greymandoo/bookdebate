package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.ArticleDAO;
import org.project.DTO.Board_p01;

public class ArticleListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 목록 조회");
		
		ArticleDAO dao = ArticleDAO.getInstance();
		ArrayList<Board_p01> articles = dao.selectArticlesDo();
		
		String url = "";
		
		if(articles != null) {
			System.out.println("게시글 목록 조회 성공");
			request.setAttribute("articles", articles);
			url = "/articleList.jsp";
		} else {
			System.out.println("게시글 목록 조회 실패");
			url = "/index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
