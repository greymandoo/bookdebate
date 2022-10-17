package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.BookDAO;

public class BookAjaxISBNCheckCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ISBN 중복 체크");
		
		String bookNo = request.getParameter("bookNo");
		
		BookDAO dao = BookDAO.getINSTANCE();
		boolean rs = dao.ISBNCheckDo(bookNo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs) {
			System.out.println("이미 등록된 책");
			out.println("0");
		} else {
			System.out.println("등록 가능한 책");
			out.println("1");
		}
		
		out.close();
	}
}
