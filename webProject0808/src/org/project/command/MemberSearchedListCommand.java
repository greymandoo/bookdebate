package org.project.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.DAO.MemberDAO;
import org.project.DTO.Member_p01;

public class MemberSearchedListCommand implements ExecuteCommand {
	@Override
	public void executeQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원 검색(페이징)");
		
		HttpSession session = request.getSession();
		String url = "";
		
		if(session.getAttribute("author") != null) {
			String author = (String)session.getAttribute("author");
			
			if(author.equals("admin")) {
				
				String category = request.getParameter("category");
				String searching = request.getParameter("searching");
				request.setAttribute("category", category);
				request.setAttribute("searching", searching);
				
				String sectionStr = request.getParameter("section");
				String pageStr = request.getParameter("page");
				int section = Integer.parseInt(((sectionStr == null)? "1" : sectionStr));
				int page = Integer.parseInt(((pageStr == null)? "1" : pageStr));
				request.setAttribute("section", section);
				request.setAttribute("page", page);
				
				MemberDAO dao = MemberDAO.getInstance();

				int totalNum = dao.getTotalNumForSearch(category, searching);
				int lastPage = (totalNum-1)/10 + 1;
				int lastSection = (totalNum-1)/100 + 1;
				
				ArrayList<Member_p01> members = dao.selectPageMembersForSearchDo(category, searching, page);
				
				if(members != null) {
					System.out.println("회원 검색 성공");
					request.setAttribute("members", members);
					request.setAttribute("totalNum", totalNum);
					request.setAttribute("lastPage", lastPage);
					request.setAttribute("lastSection", lastSection);
					url = "memberList.jsp";
				} else {
					System.out.println("회원 검색 실패");
					url = "index.mo";
				}	
				
			}  else {
				System.out.println("권한 없는 사용자가 회원 목록에 접근");
				url = "index.mo";
			}
			
		} else {
			System.out.println("권한 없는 사용자가 회원 목록에 접근");
			url = "index.mo";
		}
		request.setAttribute("url", url);				
		
	}
}
