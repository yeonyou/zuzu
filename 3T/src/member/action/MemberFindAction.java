package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberBean;
import member.db.MemberDAO;


public class MemberFindAction implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		request.setCharacterEncoding("euc-kr");
		
		ActionForward forward=new ActionForward();
		MemberDAO memberdao=new MemberDAO();
		MemberBean member=new MemberBean();
		
		String name=request.getParameter("MEMBER_NAME");
		String jumin1=request.getParameter("MEMBER_JUMIN1");
		String jumin2=request.getParameter("MEMBER_JUMIN2");
		
		member=memberdao.findId(name,jumin1,jumin2);
		
		if(member !=null) {
			request.setAttribute("id",member.getMEMBER_ID());
			request.setAttribute("passwd", member.getMEMBER_PW());
			
			forward.setRedirect(false);
			forward.setPath("./member/member_find_ok.jsp");
			return forward;
		}else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('�Է��� ������ ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return null;
	}

}
