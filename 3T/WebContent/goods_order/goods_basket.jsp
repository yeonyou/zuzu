<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="basket.db.*"%>
<%@ page import = "goods.db.*" %>

<%
	List basketList = (ArrayList) request.getAttribute("basketlist");
	List goodsList = (ArrayList) request.getAttribute("goodslist");

	String item = request.getParameter("item");
	String gr_goods_num = request.getParameter("gr_goods_num");
	String isitem = request.getParameter("isitem");
%>
<html>
<head>
<title>���θ�</title>
</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0"
		align="Center">
		<tr>
			<td colspan=2>
				<!-- ��ٱ��� -->
				<p align="center">
				<form action="./OrderStart.or" name="basketform" method="post">
					<input type="hidden" name="order" value="basket">
					<table width="80%">
						<tr align=center>
							<td><b>�� �� �� ��</b></td>
						</tr>
					</table>
					<table width="80%" cellpadding="0" cellspacing="0">
						<tr height=26 bgcolor="94d7e7">
							<td height="3" colspan="7" align=right></td>
						</tr>
						<tr bgcolor="#f0f8ff" align="center">
							<td width="5%"><font size="2">��ȣ</font></td>
							<td width="5%"><font size="2">����</font></td>
							<td width="25%"><font size="2">��ǰ��</font></td>
							<td width="8%"><font size="2">����</font></td>
							<td width="8%"><font size="2">����</font></td>
							<td width="8%"><font size="2">���</font></td>
						</tr>
						<%
							if (basketList != null && basketList.size() != 0) {
								for (int i = 0; i < basketList.size(); i++) {
									BasketBean dto = (BasketBean) basketList.get(i);
									GoodsBean goods = (GoodsBean) goodsList.get(i);
						%>
						<tr align="center">
							<td><font size="2"><%=dto.getBASKET_NUM()%></font></td>
							<td><font size="2"><img
									src="./upload/<%=goods.getGOODS_IMAGE().split(",")[0]%>"
									width=50 height=50></font></td>
							<td><font size="2"><%=goods.getGOODS_NAME()%></font></td>
							<td><font size="2"> <%=dto.getBASKET_GOODS_AMOUNT()%>
							</font></td>
							<td><font size="2"><%=goods.getGOODS_PRICE()%></font></td>
							<td><font size="2"> <a
									href="BasketDelete.ba?num=<%=dto.getBASKET_NUM()%>"
									onclick="return confirm('����Ͻðڽ��ϱ�?')">���</a>
							</font></td>
						</tr>
						<%
							}
							} else {
						%>
						<tr>
							<td colspan="7" align="center"><font size="2">��ٱ��Ͽ�
									��� ��ǰ�� �����ϴ�.</font></td>
						</tr>
						<%
							}
						%>
					</table>

					<table width="80%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="2" bgcolor="94d7e7"></td>
						</tr>
					</table>
					<br>

					<table width="80%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">
								<%
									if (basketList != null && basketList.size() != 0) {
								%> <a href="javascript:basketform.submit()"> [�����ϱ�] </a> <%
 	} else {
 %> <a
								href="#" onclick="javascript:alert('�ֹ��� ��ǰ�� �����ϴ�.')"> [�����ϱ�]
							</a> <%
 	}
 	if (item == null) {
 %> <a href="./GoodsList.go?item=new_item"> [���
									�����ϱ�]</a> <%
 	} else {
 %> <a
								href="./Goods_Detail.go?item=<%=item%>
			&gr_goods_num=<%=gr_goods_num%>
			&isitem=<%=isitem%>">
									[��� �����ϱ�]</a> <%
 	}
 %>
							</td>
						</tr>
					</table>
				</form> <!-- ��ٱ��� -->
				</p>
			</td>
		</tr>
	</table>
</body>
</html>