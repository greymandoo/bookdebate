package org.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.project.command.ExecuteCommand;
import org.project.command.MemberAjaxInsertCommand;
import org.project.command.MemberAjaxLoginCommand;
import org.project.command.MemberAjaxModifyCommand;
import org.project.command.MemberAjaxDeleteCommand;
import org.project.command.MemberAjaxIDCheckCommand;

@WebServlet("*.ao")
public class AjaxMemberController extends HttpServlet {

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
		
		if(action.equals("ajaxIDCheck")) {
			command = new MemberAjaxIDCheckCommand();
			command.executeQuery(request, response);
		} else if(action.equals("ajaxSignUp")) {
			command = new MemberAjaxInsertCommand();
			command.executeQuery(request, response);
		} else if(action.equals("ajaxLogin")) {
			command = new MemberAjaxLoginCommand();
			command.executeQuery(request, response);
		} else if(action.equals("ajaxModify")) {
			command = new MemberAjaxModifyCommand();
			command.executeQuery(request, response);
		} else if(action.equals("ajaxDelete")) {
			command = new MemberAjaxDeleteCommand();
			command.executeQuery(request, response);
		} 
		
	}
}
