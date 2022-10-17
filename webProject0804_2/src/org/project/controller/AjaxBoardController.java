package org.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.command.ArticleAjaxDeleteCommand;
import org.project.command.ArticleAjaxInsertCommand;
import org.project.command.ArticleAjaxModifyCommand;
import org.project.command.ExecuteCommand;

@WebServlet("*.ax")
public class AjaxBoardController extends HttpServlet {

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
		
		if(action.equals("writeArticle")) {
			command = new ArticleAjaxInsertCommand();
			command.executeQuery(request, response);
		} else if(action.equals("modifyArticle")) {
			command = new ArticleAjaxModifyCommand();
			command.executeQuery(request, response);
		} else if(action.equals("deleteArticle")) {
			command = new ArticleAjaxDeleteCommand();
			command.executeQuery(request, response);
		}  
		
	}
}
