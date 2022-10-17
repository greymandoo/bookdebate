package org.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BookDAO;
import org.project.DTO.Book_p01;

public class BookViewCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("책 상세정보 조회");
		
		String bookNo = request.getParameter("bookNo");				
		
		BookDAO dao = BookDAO.getINSTANCE();
		Book_p01 book = dao.selectArticleDo(bookNo);
		
		String url = "";
		
		if(book != null) {
			System.out.println("책 상세정보 조회 성공");
			request.setAttribute("book", book);
			url = "bookView.jsp";
		} else {
			System.out.println("책 상세정보 조회 실패");
			url = "bookList.bo";
		}
		
		request.setAttribute("url", url);
		
	}
}
