package org.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.command.ArticleViewCommand;
import org.project.command.ArticleViewForModCommand;
import org.project.command.BoardListCommand;
import org.project.command.BoardSearchedListCommand;
import org.project.command.BookTitleListCommand;
import org.project.command.ExecuteCommand;
import org.project.command.MemberBoardListCommand;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String action = uri.substring(path.length()+1, uri.length()-3);
		System.out.println(action);
		
		ExecuteCommand command = null;
		String url = "";
		
		if(action.equals("index")) {
			url = "/index.jsp";
		} else if(action.equals("articleList")) {
			command = new BoardListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("articleView")) {
			command = new ArticleViewCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");			
		} else if(action.equals("articleWrite")) {
			command = new BookTitleListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("articleModify")) {
			command = new ArticleViewForModCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");			
		} else if(action.equals("userArticleList")) {
			command = new MemberBoardListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");			
		} else if(action.equals("searchArticle")) {
			command = new BoardSearchedListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
