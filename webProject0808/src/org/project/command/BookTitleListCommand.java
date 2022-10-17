package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BookDAO;

public class BookTitleListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("책 제목 리스트 가져오기");
		
		BookDAO dao = BookDAO.getINSTANCE();
		ArrayList<String> b_titles = dao.getBookList();
		
		String url = "";
		
		if(b_titles != null) {
			System.out.println("책 제목 리스트 가져오기 성공");
			request.setAttribute("b_titles", b_titles);
			url = "articleWrite.jsp";
		} else {
			System.out.println("책 제목 리스트 가져오기 실패");
			url = "index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
