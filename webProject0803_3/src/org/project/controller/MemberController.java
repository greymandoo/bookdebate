package org.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.project.command.ExecuteCommand;
import org.project.command.MemberDetailCommand;
import org.project.command.MemberDetailForModCommand;
import org.project.command.MemberListCommand;

@WebServlet("*.mo")
public class MemberController extends HttpServlet {

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
		HttpSession session = request.getSession();
		String url = "";
		
		if(action.equals("index")) {
			url = "index.jsp";
		} else if(action.equals("memberSignup")) {
			url = "signup.jsp";
		} else if(action.equals("memberLogin")) {
			url = "login.jsp";
		} else if(action.equals("memberLogout")) {
			session.invalidate();
			url = "index.jsp";
		} else if(action.equals("memberList")) {
			command = new MemberListCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");			
		} else if(action.equals("memberDetail")) {
			command = new MemberDetailCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");			
		} else if(action.equals("memberMod")) {
			command = new MemberDetailForModCommand();
			command.executeQuery(request, response);
			url = (String)request.getAttribute("url");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
