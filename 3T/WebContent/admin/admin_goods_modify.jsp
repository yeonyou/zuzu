
<%@page import="admin.goods.db.GoodsBean"%>

<%@ page contentType="text/html; charset=EUC-KR"%>

<%
	GoodsBean agb = (GoodsBean) request.getAttribute("agb");
%>

<html>
<head>
<title>���θ�</title>
</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0"
		color="gray" align="center">
		<tr>
			<td colspan=2>
				<!-- ��ǰ ���� -->
				<table border="0" width="80%">
					<form name="goodsform" action="./GoodsModifyAction.ag"
						method="post">
						<input type="hidden" name="goods_num"
							value=<%=agb.getGOODS_NUM()%>>
						<tr>
							<td>
								<p align="center">
									<span style="font-size: 26pt;">�� ǰ �� ��</span>
								</p>
							</td>
						</tr>

						<tr>
							<td height="331">
								<table border="1" align="center" width="558">
									<tr>
										<td width="196" height="30">
											<p align="center">
												<font size=2>ī�װ�</font>
											</p>
										</td>

										<td width="346" height="30"><select name="goods_category"
											size="1" value=<%=agb.getGOODS_CATEGORY()%>>
												<option value="outwear">�ƿ�����</option>
												<option value="fulldress">����/�Ż纹</option>
												<option value="tshirts">Ƽ����</option>
												<option value="shirts">���̼���</option>
												<option value="pants">����</option>
												<option value="shoes">����</option>
										</select></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>��ǰ�̸�</font>
											</p>
										</td>
										<td><input type="text" name="goods_name"
											value=<%=agb.getGOODS_NAME()%>></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>�ǸŰ�</font>
											</p>
										</td>
										<td><input type="text" name="goods_price"
											value=<%=agb.getGOODS_PRICE()%>></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>����</font>
											</p>
										</td>
										<td><input type="text" name="goods_color"
											value=<%=agb.getGOODS_COLOR()%>></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>����</font>
											</p>
										</td>
										<td><input type="text" name="goods_amount"
											value=<%=agb.getGOODS_AMOUNT()%>></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>�α��ǰ</font>
											</p>
										</td>
										<td><input type="radio" name="goods_best" value=1
											<%if (agb.getGOODS_BEST() == 1) {%> CHECKED <%}%>> <font
											size=2>��</font> <input type="radio" name="goods_best" value=0
											<%if (agb.getGOODS_BEST() == 0) {%> CHECKED <%}%>> <font
											size=2>�ƴϿ�</font></td>
									</tr>
									<tr>
										<td width="196">
											<p align="center">
												<font size=2>��ǰ����</font>
											</p>
										</td>
										<td width="346"><textarea name="goods_content" cols=50
												rows=15>
                                        <%=agb.getGOODS_CONTENT()%>
                                </textarea></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="75">
								<p align="center">
									<input type="submit" value="����">&nbsp; <input
										type="reset" value="�ٽþ���">
								</p>
							</td>
						</tr>
					</form>
				</table> <!-- ��ǰ ���� -->
			</td>
		</tr>
	</table>
</body>
</html>