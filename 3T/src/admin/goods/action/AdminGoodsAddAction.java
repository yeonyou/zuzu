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
		//이미지를 저장할 경로 realpath="" 선언
		String realPath = "";
		String savePath = "upload";
		int maxSize = 10 * 1024 * 1024;
		//경로값
		//realPath = request.getRealPath(savePath);   >>>getRealPath 안먹혀서 절대경로로밖을래
		realPath="C:\\java\\App\\3T\\WebContent\\upload";
		//파일을 저장할 리스트객체  savefiles 선언
		List savefiles = new ArrayList();

		try {
			//	파일 업로드 컴포넌트 중 현재 가장 인정 받는 cos패키지의 MultipartRequest를 사용하여 파일 업로드 기능을 구현한다.
			//출처: http://chogoon.tistory.com/entry/MultiPartRequest-파일-업로드 [초군학습장]
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
