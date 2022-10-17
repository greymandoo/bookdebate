package org.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.MemberDAO;
import org.project.DTO.Member_p01;

public class MemberDetailForModCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 조회");
		
		String userId = request.getParameter("userId");
		
		MemberDAO dao = MemberDAO.getInstance();
		Member_p01 member = dao.selectMemberDo(userId);
		
		String url = "";
		
		if(member != null) {
			System.out.println("회원 조회 성공");
			request.setAttribute("member", member);
			url = "/memberMod.jsp";
		} else {
			System.out.println("회원 조회 실패");
			url = "/index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
