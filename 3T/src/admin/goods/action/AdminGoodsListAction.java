package admin.goods.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.goods.db.AdminGoodsDAO;
import admin.goods.db.GoodsBean;

public class AdminGoodsListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		AdminGoodsDAO agoodsdao = new AdminGoodsDAO();
		GoodsBean agb = new GoodsBean();

		ActionForward forward = new ActionForward();

		Collection list = (Collection) agoodsdao.getGoodsList();
		request.setCharacterEncoding("euc-kr");
		request.setAttribute("list", list);

		forward.setRedirect(false);
		forward.setPath("./admin/admin_goods_list.jsp");
		return forward;
	}
}
