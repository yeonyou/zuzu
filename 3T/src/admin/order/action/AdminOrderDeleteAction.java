package admin.order.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.order.db.AdminOrderDAO;

public class AdminOrderDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	throws Exception{
		AdminOrderDAO orderdao=new AdminOrderDAO();
		
		boolean result=false;
		String num=request.getParameter("num");
		result=orderdao.deleteOrder(Integer.parseInt(num));
		
		if(result==false){
			System.out.println("��ǰ ���� ����");
			return null;
		}
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./AdminOrderList.ao");
		return forward;
	 } 
}