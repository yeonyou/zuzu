<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>���θ�</title>
</head>
<body>
	<table width="960" cellspacing="0" cellpadding="0" border="0"
		color="gray" align="center">
		<tr>
			<td colspan=2>
				<!-- ��ǰ ��� -->
				<table border="0" width="80%">
					<form name="goodsform" action="./GoodsAddAction.ag" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="goods_best" value="0">
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
											size="1">
												<option value="outwear" selected>�ƿ�����</option>
												<option value="fulldress">����/�Ż纹</option>
												<option value="Tshirts">Ƽ����</option>
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
										<td><input type="text" name="goods_name"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>�ǸŰ�</font>
											</p>
										</td>
										<td><input type="text" name="goods_price"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>����</font>
											</p>
										</td>
										<td><input type="text" name="goods_color"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>����</font>
											</p>
										</td>
										<td><input type="text" name="goods_amount"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>������</font>
											</p>
										</td>
										<td><input type="text" name="goods_size"></td>
									</tr>
									<tr>
										<td width="196">
											<p align="center">
												<font size=2>��ǰ����</font>
											</p>
										</td>
										<td width="346"><textarea name="goods_content" cols=50
												rows=15></textarea></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>���� ��ǰ�̹���(gif)</font>
											</p>
										</td>
										<td><input type="file" name="file4"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>��ǰ�̹���1(gif)</font>
											</p>
										</td>
										<td><input type="file" name="file3"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>��ǰ�̹���2(gif)</font>
											</p>
										</td>
										<td><input type="file" name="file2"></td>
									</tr>
									<tr>
										<td>
											<p align="center">
												<font size=2>��ǰ�̹���3(gif)</font>
											</p>
										</td>
										<td><input type="file" name="file1"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="75">
								<p align="center">
									<input type="submit" value="���">&nbsp; <input
										type="reset" value="�ٽþ���">
								</p>
							</td>
						</tr>
				</table>
				</form> <!-- ��ǰ ��� -->
			</td>
		</tr>
	</table>
</body>
</html>