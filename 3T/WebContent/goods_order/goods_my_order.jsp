<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="order.db.*"%>
<%
	String id = (String) session.getAttribute("id");
	List goods_order_list = (List) request.getAttribute("goods_order_list");
	int ordercount = ((Integer) request.getAttribute("ordercount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();
	int totalmoney = ((Integer) request.getAttribute("totalmoney")).intValue();
%>
<html>
<head>
<title>���θ�</title>
</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0"
		align="center">
		<tr>
			<td colspan=2>
				<!-- ȸ���� �ֹ����� ���� -->
				<table width="700" border="0" align="center">
					<tr>
						<td>���� (<%=id%>)���Բ��� �ֹ��Ͻ� ������ �� (<%=ordercount%>)�� �ֽ��ϴ�.
						</td>
					</tr>
					<tr>
						<td height="62" align="center" valign="middle">
							<table width="700" border="1" cellspacing="0" cellpadding="0"
								bordercolor="#CCCCCC">
								<tr>
									<td height="20"><div align="center">��ǰ��</div></td>
									<td><div align="center">����/������</div></td>
									<td><div align="center">����</div></td>
									<td><div align="center">�� �ݾ�</div></td>
									<td><div align="center">�ֹ� ����</div></td>
									<td><div align="center">�ֹ� ��¥</div></td>
								</tr>
								<%
									if (goods_order_list.size() == 0) {
								%>
								<td align=center colspan=6>�ֹ� ������ �����ϴ�.</td>
								<%
									}

									for (int i = 0; i < goods_order_list.size(); i++) {
										OrderBean order = new OrderBean();
										order = (OrderBean) goods_order_list.get(i);
								%>
								<tr align=center>
									<td height="20"><%=order.getORDER_GOODS_NAME()%></td>
									<td><%=order.getORDER_GOODS_COLOR()%>/ <%=order.getORDER_GOODS_SIZE()%>
									</td>
									<td><%=order.getORDER_GOODS_AMOUNT()%></td>
									<td><%=order.getORDER_SUM_MONEY()%></td>
									<td>
										<%
											if (order.getORDER_STATUS() == 0) {
										%>����� <%
											} else if (order.getORDER_STATUS() == 1) {
										%>�߼��غ� <%
											} else if (order.getORDER_STATUS() == 2) {
										%>�߼ۿϷ� <%
											} else if (order.getORDER_STATUS() == 3) {
										%>����� <%
											} else if (order.getORDER_STATUS() == 4) {
										%>��ۿϷ� <%
											} else if (order.getORDER_STATUS() == 5) {
										%>�ֹ���� <%
											}
										%>
									</td>
									<td><%=order.getORDER_DATE()%></td>
								</tr>
								<%
									}
								%>
								<tr align=center height=20>
									<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
										<%
											if (nowpage <= 1) {
										%> [����]&nbsp; <%
 	} else {
 %> <a href="./OrderList.or?page=<%=nowpage - 1%>">[����]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./OrderList.or?page=<%=a%>">[<%=a%>]
									</a>&nbsp; <%
 	}
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [����] <%
 	} else {
 %> <a href="./OrderList.or?page=<%=nowpage + 1%>">[����]</a> <%
 	}
 %>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="28">
							<div align="right">
								�� �ֹ��ݾ� :
								<%=totalmoney%>��
							</div>
						</td>
					</tr>
				</table> <!-- ȸ���� �ֹ����� ���� -->
			</td>
		</tr>
	</table>
</body>
</html>