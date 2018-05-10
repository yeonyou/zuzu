package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberBean;
import member.db.MemberDAO;

public class MemberModifyAction_2 implements Action {

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("euc-kr");

		ActionForward forward = new ActionForward();
		HttpSession sesseion = request.getSession();
		String id = (String) sesseion.getAttribute("id");

		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");

			return forward;
		}

		MemberDAO memberdao = new MemberDAO();
		MemberBean dto = new MemberBean();

		dto.setMEMBER_ID(id);
		dto.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
		dto.setMEMBER_PW(request.getParameter("MEMBER_PW"));
		dto.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL1") + "@"
				+ request.getParameter("MEMBER_EMAIL2"));
		dto.setMEMBER_EMAIL_GET(request.getParameter("MEMBER_EMAIL_GET"));
		dto.setMEMBER_MOBILE(request.getParameter("MEMBER_MOBILE"));
		dto.setMEMBER_PHONE(request.getParameter("MEMBER_PHONE"));
		dto.setMEMBER_ZIPCODE(request.getParameter("MEMBER_ZIPCODE1") + " - "
				+ request.getParameter("MEMBER_ZIPCODE2"));
		dto.setMEMBER_ADDR1(request.getParameter("MEMBER_ADDR1"));
		dto.setMEMBER_ADDR2(request.getParameter("MEMBER_ADDR2"));

		memberdao.updateMember(dto);

		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('ȸ������ ������ �����Ͽ����ϴ�.');");
		out.println("</script>");

		forward.setRedirect(false);
		forward.setPath("./MemberModifyAction_1.me");
		return forward;

	}

}