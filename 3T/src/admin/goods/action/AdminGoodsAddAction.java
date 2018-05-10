package admin.goods.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.goods.db.AdminGoodsDAO;
import admin.goods.db.GoodsBean;

public class AdminGoodsAddAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();
		AdminGoodsDAO agoodsdao = new AdminGoodsDAO();
		GoodsBean agb = new GoodsBean();
		//�̹����� ������ ��� realpath="" ����
		String realPath = "";
		String savePath = "upload";
		int maxSize = 10 * 1024 * 1024;
		//��ΰ�
		//realPath = request.getRealPath(savePath);   >>>getRealPath �ȸ����� �����ηι�����
		realPath="C:\\java\\App\\3T\\WebContent\\upload";
		//������ ������ ����Ʈ��ü  savefiles ����
		List savefiles = new ArrayList();

		try {
			//	���� ���ε� ������Ʈ �� ���� ���� ���� �޴� cos��Ű���� MultipartRequest�� ����Ͽ� ���� ���ε� ����� �����Ѵ�.
			//��ó: http://chogoon.tistory.com/entry/MultiPartRequest-����-���ε� [�ʱ��н���]
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realPath, maxSize, "euc-kr", new DefaultFileRenamePolicy());

			Enumeration files = multi.getFileNames();
			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				if (files.hasMoreElements()) {
					savefiles.add(multi.getFilesystemName(name) + ",");
				} else {
					savefiles.add(multi.getFilesystemName(name));
				}
			}

			StringBuffer fl = new StringBuffer();
			for (int i = 0; i < savefiles.size(); i++) {
				fl.append(savefiles.get(i));
			}

			agb.setGOODS_CATEGORY(multi.getParameter("goods_category"));
			agb.setGOODS_NAME(multi.getParameter("goods_name"));
			agb.setGOODS_CONTENT(multi.getParameter("goods_content"));
			agb.setGOODS_SIZE(multi.getParameter("goods_size"));
			agb.setGOODS_COLOR(multi.getParameter("goods_color"));
			agb.setGOODS_AMOUNT(Integer.parseInt(multi.getParameter("goods_amount")));
			agb.setGOODS_PRICE(Integer.parseInt(multi.getParameter("goods_price")));
			agb.setGOODS_IMAGE(fl.toString());
			agb.setGOODS_BEST(Integer.parseInt(multi.getParameter("goods_best")));

			int result = agoodsdao.insertGoods(agb);
			if (result <= 0) {
				return null;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		forward.setRedirect(true);
		forward.setPath("GoodsList.ag");
		return forward;
	}

}
