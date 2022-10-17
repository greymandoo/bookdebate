package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.BoardDAO;
import org.project.DTO.Board_p01;

public class MemberBoardListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시글 목록 조회 for user(페이징)");
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("sessionUser");
		System.out.println(userId);
		
		String sectionStr = request.getParameter("section");
		String pageStr = request.getParameter("page");
		int section = Integer.parseInt(((sectionStr == null)? "1" : sectionStr));
		int page = Integer.parseInt(((pageStr == null)? "1" : pageStr));
		request.setAttribute("section", section);
		request.setAttribute("page", page);
		
		BoardDAO dao = BoardDAO.getInstance();

		int totalNum = dao.getUserArticleNum(userId);
		int lastPage = (totalNum-1)/10 + 1;
		int lastSection = (totalNum-1)/100 + 1;
		ArrayList<Board_p01> articles = dao.selectUserArticlesDo(userId, page);

		System.out.println(totalNum);
		
		String url = "";
		
		if(articles != null) {
			System.out.println("게시글 목록 조회 for user 성공(페이징)");
			request.setAttribute("articles", articles);
			request.setAttribute("totalNum", totalNum);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("lastSection", lastSection);
			url = "/userArticleList.jsp";
		} else {
			System.out.println("게시글 목록 조회 for user 실패(페이징)");
			url = "/index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
