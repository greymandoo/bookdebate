package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.DAO.MemberDAO;
import org.project.DTO.Member_p01;

public class MemberListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 목록 조회");
		
		MemberDAO dao = MemberDAO.getInstance();
		ArrayList<Member_p01> members = dao.selectMembersDo();
		
		String url = "";
		
		if(members != null) {
			System.out.println("회원 목록 조회 성공");
			request.setAttribute("members", members);
			url = "/memberList.jsp";
		} else {
			System.out.println("회원 목록 조회 실패");
			url = "/index.mo";
		}
		
		request.setAttribute("url", url);
		
	}
}
