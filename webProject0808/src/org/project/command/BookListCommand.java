package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BookDAO;
import org.project.DTO.Book_p01;

public class BookListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("책 목록 조회(페이징)");
				
		String sectionStr = request.getParameter("section");
		String pageStr = request.getParameter("page");
		int section = Integer.parseInt(((sectionStr == null)? "1" : sectionStr));
		int page = Integer.parseInt(((pageStr == null)? "1" : pageStr));
		request.setAttribute("section", section);
		request.setAttribute("page", page);
		
		BookDAO dao = BookDAO.getINSTANCE();

		int totalNum = dao.getTotalNum();
		int lastPage = (totalNum-1)/10 + 1;
		int lastSection = (totalNum-1)/100 + 1;
		ArrayList<Book_p01> books = dao.selectPageBooksDo(page);
		
		String url = "";
		
		if(books != null) {
			System.out.println("책 목록 조회 성공(페이징)");
			request.setAttribute("books", books);
			request.setAttribute("totalNum", totalNum);
			request.setAttribute("lastPage", lastPage);
			request.setAttribute("lastSection", lastSection);
			url = "bookList.jsp";				

		} else {
			System.out.println("책 목록 조회 실패(페이징)");
			url = "index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
