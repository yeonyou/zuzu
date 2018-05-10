package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;



public class MemberModifyAction_1 implements Action{
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	
	throws Exception{
		ActionForward forward=new ActionForward();
		HttpSession sesseion = request.getSession(true);
		String id = (String)sesseion.getAttribute("id");
		
		if(id==null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		MemberDAO memberdao = new MemberDAO();
		MemberBean dto=memberdao.getMember(id);
		
		request.setAttribute("member", dto);
		
		forward.setRedirect(false);
		forward.setPath("./member/member_info.jsp");
		return forward;
	}

}
