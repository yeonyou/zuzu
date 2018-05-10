package admin.goods.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.goods.action.Action;
import admin.goods.action.ActionForward;
import admin.goods.action.AdminGoodsAddAction;
import admin.goods.action.AdminGoodsDeleteAction;
import admin.goods.action.AdminGoodsListAction;
import admin.goods.action.AdminGoodsModifyAction;
import admin.goods.action.AdminGoodsModifyForm;

public class AdminGoodsFrontController extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/GoodsAddAction.ag")) {
			action = new AdminGoodsAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/GoodsList.ag")) {
			action = new AdminGoodsListAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/GoodsAdd.ag")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_goods_write.jsp");
		} else if (command.equals("/GoodsDelete.ag")) {
			action = new AdminGoodsDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/GoodsModify.ag")) {
			action = new AdminGoodsModifyForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/GoodsModifyAction.ag")) {
			action = new AdminGoodsModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}
}
