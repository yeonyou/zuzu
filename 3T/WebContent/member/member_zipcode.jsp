<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <%
    	String addr="";
    	String zipcode="";
    	String zip1="";
    	String zip2="";
    	
    	List zipcodeList=(ArrayList)request.getAttribute("zipcodelist");
    	
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function setZipcode(zip1,zip2,addr){
		opener.document.forms[0].MEMBER_ZIPCODE1.value=zip1;
		opener.document.forms[0].MEMBER_ZIPCODE2.value=zip2;
		opener.document.forms[0].MEMBER_ADDR1.value=addr;
		self.close();
}

</script>
</head>
<body bgcolor="#f5f5f5">
<center>
<table width="370" border="0" cellspacing="0" cellpadding="5">
	
		<tr align="center">
			<td align="center">
				<font color="#ff4500">-�����ȣ �˻�-</font><br>
				</td>
				</tr>
				
</table>
<form action="./MemberZipcodeAction.me" method="post" name="form">
<table width="370" border="0" cellspacing="0" cellpadding="5">
	<tr align="center">
		<td align="center">
			<font size="2">������:</font>
			<input type="text" name="dong"/>
			<input type="submit" value="�˻�"><br>
			<font size="2">���� �Է��ϼ���.(��:���,��õ,2�����̻��Է�)</font>
			</td>
			</tr>
</table>
</form>

<br>
<table width="370" border="0" cellspacing="0" cellpadding="5">
<tr height="35">
<td align="center" colspan="2">-�˻����-</td>
</tr>
<%
	if(zipcodeList!=null && zipcodeList.size()!=0){
		for(int i=0;i<zipcodeList.size();i++){
			String data=(String)zipcodeList.get(i);
			
			StringTokenizer st=new StringTokenizer(data,",");
			zipcode=st.nextToken();
			addr=st.nextToken();
			
			zip1=zipcode.split("-")[0];
			zip2=zipcode.split("-")[1];
	
	%>
	<tr>
			<td width="20%">
			<a href="#" onclick="setZipcode(<%=zip1 %>,<%=zip2 %>,'<%=addr%>')">
			<font size="2"><%=zipcode %></font>
			</a>
			</td>
			<td width="80%"><font size="2"><%=addr %></font></td>
			</tr>
			<%
		}
	}else{
				%>
				<tr>
				<td colspan="2" align="center">�˻������ �����ϴ�.</td>
				</tr>
				<%} %>
</table>



</center>
</body>
</html>