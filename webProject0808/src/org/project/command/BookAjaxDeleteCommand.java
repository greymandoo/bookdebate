package org.project.command;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.project.DAO.BoardDAO;
import org.project.DAO.BookDAO;

public class BookAjaxDeleteCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("책 삭제");
		
		String BOOK_COVER_REPO = "C:\\Users\\DKK\\Desktop\\project01\\webProject0806\\WebContent\\img\\upload";

		String bookNo = request.getParameter("bookNo");
		String b_title = request.getParameter("b_title");
		
		BoardDAO bdao = BoardDAO.getInstance();
		int rs2 = bdao.deleteArticlesAboutBookDo(b_title);
		BookDAO dao = BookDAO.getINSTANCE();
		int rs = dao.deleteDo(bookNo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs == 1) {
			
			if(rs2 == 1) {
				System.out.println("책 관련 게시글 삭제");
			} else {
				System.out.println("관련 게시글이 없는 책");				
			}
			System.out.println("책 삭제 성공");
			
			File imgDir = new File(BOOK_COVER_REPO + "\\" + bookNo);
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
			}
			
			out.println("1");
		} else {
			System.out.println("책 삭제 실패");
			out.println("0");
		}
		
		out.close();
	}
}
