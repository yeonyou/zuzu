<%@page import="basket.db.BasketBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="member.db.MemberBean"%>
<%@ page import="goods.db.GoodsBean"%>
<script>
function goback(){
	window.history.go(-1);
}
</script>
<%
	MemberBean member = (MemberBean) request.getAttribute("member");
	String ordertype = (String) request.getAttribute("ordertype");
	List orderinfo = null;
	List basketlist = null;
	List goodslist = null;

	if (ordertype.equals("goods")) {
		orderinfo = (ArrayList) request.getAttribute("orderinfo");
	} else {
		basketlist = (ArrayList) request.getAttribute("basketlist");
		goodslist = (ArrayList) request.getAttribute("goodslist");
	}
%>
<html>
<head>
<title>���θ�</title>
</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0"
		align="center">
		<tr>
			<td colspan=2 align=right>
				<!-- �ֹ� ������ -->
				<form action="./OrderAdd.or" method="post" name="orderform">
					<input type="hidden" name="ordertype" value="<%=ordertype%>">
					<%
						if (ordertype.equals("goods")) {
					%>
					<input type="hidden" name="goodsnum" value="<%=orderinfo.get(0)%>">
					<input type="hidden" name="goodsname" value="<%=orderinfo.get(1)%>">
					<input type="hidden" name="goodsamount"
						value="<%=orderinfo.get(2)%>"> <input type="hidden"
						name="goodscolor" value="<%=orderinfo.get(3)%>"> <input
						type="hidden" name="goodssize" value="<%=orderinfo.get(4)%>">
					<input type="hidden" name="goodsprice"
						value="<%=orderinfo.get(5)%>">
					<%
						}
					%>
					<input type="hidden" name="memberid"
						value="<%=member.getMEMBER_ID()%>">

					<!-- �ֹ� �󼼳��� -->
					<table border=0 cellspacing=1 cellpadding=0 width=80%>
						<tr>
							<p align=left>
								<b><font size=2>�ֹ� �󼼳���</font></b>
							</p>
						</tr>
						<tr align=center height=20>
							<td
								style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">����</td>
							<td
								style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">��ǰ��</td>
							<td
								style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">����</td>
							<td
								style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">����</td>
							<td
								style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">������</td>
							<td
								style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">����</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<%
							if (ordertype.equals("goods")) {
						%>
						<tr align=center height=20>
							<td style="font-family: Tahoma; font-size: 7pt;"><img
								src="./upload/<%=orderinfo.get(6)%>" width=50 height=50></td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=orderinfo.get(1)%></td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=orderinfo.get(2)%></td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=orderinfo.get(3)%></td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=orderinfo.get(4)%></td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=orderinfo.get(5)%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<%
							} else {
								for (int i = 0; i < basketlist.size(); i++) {
									BasketBean basket = (BasketBean) basketlist.get(i);
									GoodsBean goods = (GoodsBean) goodslist.get(i);
						%>
						<tr align=center height=20>
							<td style="font-family: Tahoma; font-size: 7pt;"><img
								src="./upload/<%=goods.getGOODS_IMAGE().split(",")[0]%>"
								width=50 height=50></td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=goods.getGOODS_NAME()%>
							</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=basket.getBASKET_GOODS_AMOUNT()%>
							</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=basket.getBASKET_GOODS_COLOR()%>
							</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=basket.getBASKET_GOODS_SIZE()%>
							</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=goods.getGOODS_PRICE()%>
							</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<%
							}
							}
						%>
					</table>

					<table width=80% border=0 cellpadding="0" cellspacing="1">
						<tr>
							<td height=10>
							<td>
						</tr>
						<tr>
							<td height=10>
							<td>
						</tr>
						<tr>
							<td><b><font size=2>�ֹ��� ����</font></b></td>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" width=80
								height=24 bgcolor="f7f7f7">�̸�</td>
							<td width=320 height=24><font size=2><%=member.getMEMBER_NAME()%></font>
							</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" height=24
								bgcolor="f7f7f7">�޴���</td>
							<td width=320 height=24><font size=2><%=member.getMEMBER_MOBILE()%></font>
							</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" height=24
								bgcolor="f7f7f7">�̸��� �ּ�</td>
							<td width=320 height=24><font size=2><%=member.getMEMBER_EMAIL()%></font>
							</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
					</table>

					<table width=80% border=0 cellpadding="0" cellspacing="1">
						<tr>
							<td height=10>
							<td>
						</tr>
						<tr>
							<td height=10>
							<td>
						</tr>
						<tr>
							<td><b><font size=2>����� ����</font></b></td>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">�޴»��</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><input
								type="text" name="ORDER_RECEIVE_NAME" size=12
								value="<%=member.getMEMBER_NAME()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=23>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">�� ��ȭ</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><input
								type="text" name="ORDER_RECEIVE_PHONE" size=15
								value="<%=member.getMEMBER_PHONE()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">�޴���</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><input
								type="text" name="ORDER_RECEIVE_MOBILE" size=15
								value="<%=member.getMEMBER_MOBILE()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">����� �����ȣ</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><input
								type="text" name="ORDER_RECEIVE_ZIPCODE" size=7
								value="<%=member.getMEMBER_ZIPCODE()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">����� �ּ�</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><input
								type="text" name="ORDER_RECEIVE_ADDR1" size=50
								value="<%=member.getMEMBER_ADDR1()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">����� ������ �ּ�</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><input
								type="text" name="ORDER_RECEIVE_ADDR2" size=50
								value="<%=member.getMEMBER_ADDR2()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130
								height=24 bgcolor="f7f7f7">��Ÿ �䱸����</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><textarea
									name="ORDER_MEMO" cols=60 rows=12></textarea></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
					</table>

					<table width=80% border=0 cellpadding="0" cellspacing="1">
						<tr>
							<td height=10>
							<td>
						</tr>
						<tr>
							<td height=10>
							<td>
						</tr>
						<tr>
							<td><b><font size=2>���� ����</font></b></td>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" width=200
								height=24 bgcolor="f7f7f7">�Ա��ڸ�(�¶����Ա��� ���) :</td>
							<td width=320 height=24><input type="text"
								name="ORDER_TRADE_PAYER" size=20
								value="<%=member.getMEMBER_NAME()%>"></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td align=center style="background-color: #F0F0F0; height: 1px;"
								colspan=6><input type=submit value="�ֹ�">&nbsp; <input
								type=button value="���" onclick="goback()"></td>
						</tr>
					</table>
				</form> <!-- �ֹ� ������ -->
			</td>
		</tr>
	</table>
</body>
</html>