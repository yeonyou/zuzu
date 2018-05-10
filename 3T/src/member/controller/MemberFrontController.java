package member.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.action.ActionForward;
import member.action.MemberDeleteAction;
import member.action.MemberFindAction;
import member.action.MemberIDCheckAction;
import member.action.MemberJoinAction;
import member.action.MemberLoginAction;
import member.action.MemberModifyAction_1;
import member.action.MemberModifyAction_2;
import member.action.MemberZipcodeAction;

public class MemberFrontController  extends HttpServlet{
	
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException{
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action=null;
		
		if(command.equals("/MemberLogin.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_login.jsp");
		}else if(command.equals("/MemberJoin.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_join.jsp");
		}else if(command.equals("/MemberFind.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_find.jsp");
		}else if(command.equals("/MemberOut.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_out.jsp");
		}else if(command.equals("/Zipcode.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_zipcode.jsp");
			
		}else if(command.equals("/MemberLoginAction.me")) {
			action =new MemberLoginAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberJoinAction.me")) {
			action=new MemberJoinAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberModifyAcion_1.me")) {
			action=new MemberModifyAction_1();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberModifyAction_2.me")) {
			action=new MemberModifyAction_2();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberDeleteAcion.me")) {
			action=new MemberDeleteAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberIDCheckAction.me")) {
			action=new MemberIDCheckAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberFindAction.me")) {
			action=new MemberFindAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberZipcodeAction.me")) {
			action=new MemberZipcodeAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		}else {
			RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);		
		}
	}
}
