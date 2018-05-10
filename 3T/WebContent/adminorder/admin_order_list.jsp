<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="order.db.*"%>
<%@ page import="java.util.*"%>
<%
	List orderlist = (List) request.getAttribute("orderlist");
	int ordercount = ((Integer) request.getAttribute("ordercount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<table width="960" cellspacing="0" cellpadding="0" border="0" align="center">
		<tr>
			<td colspan=2 align=center>
				<table border=0 cellspacing=1 cellpadding=0 width=80%>
					<tr>
						<td align=right colspan=10 height=25 colspan=2 style="font-family: Tahoma; font-size: 8pt;">��ü �ֹ� �� : <b><%=ordercount%></b> ��&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr align=center height=20>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">�ֹ���ȣ</td>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">�ֹ���</td>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">�������</td>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">�ֹ��ݾ�</td>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">�ֹ�����</td>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">�ֹ��Ͻ�</td>
						<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">����/����</td>
					</tr>
					<tr>
						<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
					</tr>
					<%
						for (int i = 0; i < orderlist.size(); i++) {
							OrderBean order = new OrderBean();
							order = (OrderBean) orderlist.get(i);
					%>
					<tr align=center height=20>
						<td style="font-family: Tahoma; font-size: 7pt;"><%=order.getORDER_TRADE_NUM()%></td>
						<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_MEMBER_ID()%></td>
						<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_TRADE_TYPE()%></td>
						<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_SUM_MONEY()%></td>
						<td style="font-family: Tahoma; font-size: 8pt;">
							<%
								if (order.getORDER_STATUS() == 0) {
							%> ����� <%
								} else if (order.getORDER_STATUS() == 1) {
							%> �߼��غ� <%
								} else if (order.getORDER_STATUS() == 2) {
							%> �߼ۿϷ� <%
								} else if (order.getORDER_STATUS() == 3) {
							%> ����� <%
								} else if (order.getORDER_STATUS() == 4) {
							%> ��ۿϷ� <%
								} else if (order.getORDER_STATUS() == 5) {
							%> �ֹ���� <%
								}
							%>
						</td>
						<td style="font-family: Tahoma; font-size: 8pt;"><%=order.getORDER_DATE()%></td>
						<td style="font-family: Tahoma; font-size: 8pt;"><a href="./AdminOrderDetail.ao?num=<%=order.getORDER_NUM()%>"> Modify</a>/ <a href="./AdminOrderDelete.ao?num=<%=order.getORDER_NUM()%>" onclick="return confirm('�����Ͻðڽ��ϱ�?')">Delete</a></td>
					</tr>
					<tr>
						<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
					</tr>
					<%
						}
					%>
					<tr align=center height=20>
						<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
							<%
								if (nowpage <= 1) {
							%>[����]&nbsp; <%
 	} else {
 %> <a href="./AdminOrderList.ao?page=<%=nowpage - 1%>"> [����]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %>[<%=a%>] <%
 	} else {
 %> <a href="./AdminOrderList.ao?page=<%=a%>"> [<%=a%>]
						</a>&nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %>[����] <%
 	} else {
 %> <a href="./AdminOrderList.ao?page=<%=nowpage + 1%>">[����]</a> <%
 	}
 %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
