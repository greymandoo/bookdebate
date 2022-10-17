package org.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.MemberDAO;

public class MemberIDCheckCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("아이디 중복 체크");
		
		String userId = request.getParameter("userId");
		
		MemberDAO dao = MemberDAO.getInstance();
		boolean rs = dao.idCheckDo(userId);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(rs) {
			System.out.println("아이디 중복");
			out.println("0");
		} else {
			System.out.println("아이디 사용 가능");
			out.println("1");
		}
		
		out.close();
	}
}
