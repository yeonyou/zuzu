<%@page import="admin.goods.db.GoodsBean"%>


<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	
	Collection list = (Collection) request.getAttribute("list");
	Object obj[] = list.toArray();
	GoodsBean agb = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰</title>
<script type="text/javascript">
	function goodsdelete(goods_num) {
		document.goodsform.action = "./GoodsDelete.ag?goods_num=" + goods_num;
		document.goodsform.submit();
	}
	function goodsmodify(goods_num) {
		document.goodsform.action = "./GoodsModify.ag?goods_num=" + goods_num;
		document.goodsform.submit();
	}
	function viewLarge(img) {
		img1 = new Image();
		img1.src = (img);
		if ((img1.width != 0) && (img1.height != 0)) {
			W = img1.width;
			H = img1.height;
			O = "width=" + W + ",height=" + H + ",scrollbars=yes";
			imgWin = window.open("", "", O);
			imgWin.document.write("<html><head><title>이미지상세보기</title></head>");
			imgWin.document.write("<body topmargin=0 leftmargin=0>");
			imgWin.document
					.write("<img src="
							+ img
							+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
			imgWin.document.close();
		} else {
			controller = "imgControll('" + img + "')";
			intervalID = setTimeout(controller, 20);
		}
	}
</script>

</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0"
		color="gray" align="center">
		<tr>
			<td colspan=2>
				<!-- 상품목록 -->
				<table border="0" width="80%">
					<tr>
						<td height="22" bgcolor="#6699FF">
							<p align="center">
								<font size=2>상품목록</font>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p align="right">
								<font =size=2> <a href="./GoodsAdd.ag">상품등록</a>
								</font>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<form name=goodsform method="post">
								<table border="1">
									<tr>
										<td width="50">
											<p align="center">
												<font size=2>번호</font>
											</p>
										</td>
										<td width="141">
											<p align="center">
												<font size=2>카테고리</font>
											</p>
										</td>
										<td width="100">
											<p align="center">
												<font size=2>사진</font>
											</p>
										</td>
										<td width="141">
											<p align="center">
												<font size=2>상품명</font>
											</p>
										</td>
										<td width="141">
											<p align="center">
												<font size=2>단가</font>
											</p>
										</td>
										<td width="80">
											<p align="center">
												<font size=2>수량</font>
											</p>
										</td>
										<td width="141">
											<p align="center">
												<font size=2>등록일자</font>
											</p>
										</td>
										<td width="100">
											<p align="center">
												<font size=2>&nbsp;</font>
											</p>
										</td>
									</tr>
									<%
										for (int i = 0; i < list.size(); i++) {
											agb = (GoodsBean) obj[i];
									%>

									<tr>
										<td>
											<p align="center">
												<font size=2><%=agb.getGOODS_NUM()%></font>
											</p>
										</td>
										<td>
											<p align="center">
												<font size=2> <%=agb.getGOODS_CATEGORY()%>
												</font>
											</p>
										</td>
										<%
											//이미지 띄울때 한글경로로된 이미지파일은 깨지는거 수정 할사항 밑에 URL 참고
											//http://adgw.tistory.com/entry/JSP-%EC%98%A4%EB%A5%98-%ED%95%B4%EA%B2%B0-%EB%B0%A9%EB%B2%95-%ED%95%9C%EA%B8%80%EC%9D%B4%EB%A6%84%EC%9C%BC%EB%A1%9C-%EB%90%9C-jpg%EC%9D%B4%EB%AF%B8%EC%A7%80-%ED%8C%8C%EC%9D%BC-%EC%A0%95%EC%83%81%EC%A0%81%EC%9C%BC%EB%A1%9C-%EB%82%98%EC%98%A4%EA%B2%8C-%ED%95%98%EB%8A%94%EB%B0%A9%EB%B2%95
										%>
										<td>
											<p align="center">
												<img src="./upload/<%=agb.getGOODS_IMAGE().split(",")[0]%>"
													width="50" height="50" border="0">
											</p>
										</td>
										<td>
											<p align="center">
												<font size=2><%=agb.getGOODS_NAME()%></font>
											</p>
										</td>
										<td>
											<p align="center">
												<font size=2><%=agb.getGOODS_PRICE()%></font>
											</p>
										</td>
										<td>
											<p align="center">
												<font size=2><%=agb.getGOODS_AMOUNT()%></font>
											</p>
										</td>
										<td>
											<p align="center">
												<font size=2> <%=agb.getGOODS_DATE().substring(0, 10)%>
												</font>
											</p>
										</td>
										<td>
											<p align="center">
												<a href="javascript:goodsmodify(<%=agb.getGOODS_NUM()%>);">
													<font size=2>수정</font>
												</a> <a href="javascript:goodsdelete(<%=agb.getGOODS_NUM()%>);">
													<font size=2>삭제</font>
												</a>
											</p>
										</td>
									</tr>

									<%
										}
									%>
								</table>
						</td>
					</tr>
					</form>
				</table> <!-- 상품목록 -->
			</td>
		</tr>
	</table>
</body>
</html>