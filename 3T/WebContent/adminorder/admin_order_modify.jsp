<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="order.db.*"%>
<%@ page import="member.db.*"%>
<%
	OrderBean order = (OrderBean) request.getAttribute("order");
	MemberBean ordermember = (MemberBean) request
			.getAttribute("ordermember");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0" align="center">
		<tr>
			<td colspan=2 align=center>
				<!-- �ֹ� ���� ����(������) -->
				<form action="./AdminOrderModify.ao" name="orderform" method="post">
					<input type="hidden" name="num" value="<%=order.getORDER_NUM()%>">
					<table width=80% border="0" cellpadding="0" cellspacing="1">
						<tr>
							<td height=10></td>
						</tr>
						<tr>
							<td height=10></td>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;" width=130 height=24 bgcolor="f7f7f7">�����(���)��ȣ</td>
							<td width=320 height=24><input type="text" name="transportnum" size=15 maxlength=20 value=<%if (order.getORDER_TRANS_NUM() != null) {%> <%=order.getORDER_TRANS_NUM()%> <%}%>></td>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;" width=130 height=24 bgcolor="f7f7f7">�ֹ���ȣ</td>
							<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;"><%=order.getORDER_TRADE_NUM()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;" width=130 height=24 bgcolor="f7f7f7" colspan=2>��ǰ ����</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">��ǰ�̸�</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_GOODS_NAME()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=23>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">����</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_GOODS_AMOUNT()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">������</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_GOODS_SIZE()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">����</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_GOODS_COLOR()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;" width=130 height=24 bgcolor="f7f7f7" colspan=2>����� ����</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">�޴»��</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_RECEIVE_NAME()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=23>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">����ȭ</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_RECEIVE_PHONE()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">�޴���</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_RECEIVE_MOBILE()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">����� �ּ�</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_RECEIVE_ADDR1()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">����� ������ �ּ�</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_RECEIVE_ADDR2()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;" width=130 height=24 bgcolor="f7f7f7" colspan=2>�ֹ��� ����</td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">�̸����ּ�</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=ordermember.getMEMBER_EMAIL()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=23>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">����ȭ</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=ordermember.getMEMBER_PHONE()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">�޴���</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><%=ordermember.getMEMBER_MOBILE()%></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr height=20>
							<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">��Ÿ �䱸����</td>
							<td style="font-family: Tahoma; font-size: 8pt;"><textarea name="memo" cols=60 rows=12><%=order.getORDER_MEMO()%>
		</textarea></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
					</table>

					<table width=80% border=0 cellpadding="0" cellspacing="1">
						<tr>
							<td height=10></td>
						</tr>
						<tr>
							<td height=10></td>
						</tr>
						<tr>
							<td><b><font size=2>���� ����</font></b></td>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" width=200 height=24 bgcolor="f7f7f7">�ֹ� �հ�ݾ� :</td>
							<td width=320 height=24><font size=2><%=order.getORDER_SUM_MONEY()%>��</font></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" width=200 height=24 bgcolor="f7f7f7">������� :</td>
							<td width=320 height=24><font size=2><%=order.getORDER_TRADE_TYPE()%></font></td>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" width=200 height=24 bgcolor="f7f7f7">�Ա��ڸ� :</td>
							<td width=320 height=24><font size=2><%=order.getORDER_TRADE_PAYER()%></font></td>
						</tr>
						<tr>
							<td style="font-family: Tahoma; font-size: 8pt;" width=200 height=24 bgcolor="f7f7f7">�ֹ� ���� :</td>
							<td width=320 height=24><select name="status">
									<option value="0" <%if (order.getORDER_STATUS() == 0) {%> selected <%}%>>�����</option>
									<option value="1" <%if (order.getORDER_STATUS() == 1) {%> selected <%}%>>�߼� �غ�</option>
									<option value="2" <%if (order.getORDER_STATUS() == 2) {%> selected <%}%>>�߼� �Ϸ�</option>
									<option value="3" <%if (order.getORDER_STATUS() == 3) {%> selected <%}%>>�����</option>
									<option value="4" <%if (order.getORDER_STATUS() == 4) {%> selected <%}%>>��� �Ϸ�</option>
									<option value="5" <%if(order.getORDER_STATUS()==5){%> selected <%}%>>�ֹ� ���</option>
							</select></td>
						</tr>


						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
						</tr>
						<tr>
							<td align=center style="background-color: #F0F0F0; height: 1px;" colspan=6><input type=submit value="����">&nbsp; <input type=button onclick="javascript:location.href('./AdminOrderList.ao')" value="���"></td>
						</tr>


					</table>

				</form> <!-- �ֹ� ���� ���� -->
			</td>
		</tr>
	</table>
</body>
</html>




