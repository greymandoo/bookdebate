package org.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.command.BookInsertCommand;
import org.project.command.BookListCommand;
import org.project.command.BookListForAdminCommand;
import org.project.command.BookModifyCommand;
import org.project.command.BookModifyViewCommand;
import org.project.command.BookSearchedListCommand;
import org.project.command.BookSearchedListForAdminCommand;
import org.project.command.BookViewCommand;
import org.project.command.ExecuteCommand;

@WebServlet("*.do")
public class BookController extends HttpServlet {
	
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
		
		if(action.equals("bookAddView")) {
			url = "bookAdd.jsp";
		} else if(action.equals("addBook")) {
			command = new BookInsertCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("bookList")) {
			command = new BookListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("searchBook")) {
			command = new BookSearchedListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("bookListForAdmin")) {
			command = new BookListForAdminCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("searchBookForAdmin")) {
			command = new BookSearchedListForAdminCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("bookView")) {
			command = new BookViewCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("bookModifyView")) {
			command = new BookModifyViewCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		} else if(action.equals("bookModify")) {
			command = new BookModifyCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
