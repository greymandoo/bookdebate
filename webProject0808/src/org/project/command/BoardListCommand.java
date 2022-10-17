package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BoardDAO;
import org.project.DTO.Board_p01;

public class BoardListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 목록 조회(페이징)");
		
		String sectionStr = request.getParameter("section");
		String pageStr = request.getParameter("page");
		int section = Integer.parseInt(((sectionStr == null)? "1" : sectionStr));
		int page = Integer.parseInt(((pageStr == null)? "1" : pageStr));
		request.setAttribute("section", section);
		request.setAttribute("page", page);
		
		BoardDAO dao = BoardDAO.getInstance();

		int totalNum = dao.getTotalNum();
		int lastPage = (totalNum-1)/10 + 1;
		int lastSection = (totalNum-1)/100 + 1;
		ArrayList<Board_p01> articles = dao.selectPageArticlesDo(page);
		
		String url = "";
		
		if(articles != null) {
			System.out.println("게시글 목록 조회 성공(페이징)");
			request.setAttribute("articles", articles);
			request.setAttribute("totalNum", totalNum);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("lastSection", lastSection);
			url = "/articleList.jsp";
		} else {
			System.out.println("게시글 목록 조회 실패(페이징)");
			url = "/index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
