<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>���θ�</title>
<script>
function check(){
	var id=joinform.MEMBER_ID.value;
	var password1=joinform.MEMBER_PW.value;
	var password2=joinform.MEMBER_PW2.value;
	var email1=joinform.MEMBER_EMAIL1.value;
	var email2=joinform.MEMBER_EMAIL2.value;
	var phone=joinform.MEMBER_PHONE.value;
	var addr1=joinform.MEMBER_ADDR1.value;
	var addr2=joinform.MEMBER_ADDR2.value;
	var mobile=joinform.MEMBER_MOBILE.value;
	
	var forms = document.getElementById("joinform");
	
	if((forms.MEMBER_NAME.value=="")||(forms.MEMBER_NAME.value.length<=1)){
		alert("�̸��� ����� �Է��� �ּ���.");
		forms.MEMBER_NAME.focus();
		return false;
	}
	if(id.length == 0){
		alert("���̵� �Է��ϼ���.");
		joinform.MEMBER_ID.focus();
		return false;
	}
	if(password1.length == 0){
		alert("��й�ȣ�� �Է��ϼ���.");
		joinform.MEMBER_PW.focus();
		return false;
	}
	if(password1 != password2){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		joinform.MEMBER_PW.value="";
		joinform.MEMBER_PW2.value="";
		joinform.MEMBER_PW.focus();
		return false;
	}
	if((forms.MEMBER_JUMIN1.value=="")||(forms.MEMBER_JUMIN1.value.length<6)){
		alert("�ֹε�Ϲ�ȣ ���� 6�ڸ��� �Է��� �ּ���.");
		forms.MEMBER_JUMIN1.focus();
		return false;
	}
	if((forms.MEMBER_JUMIN2.value=="")||(forms.MEMBER_JUMIN2.value.length<7)){
		alert("�ֹε�Ϲ�ȣ ���� 7�ڸ��� �Է��� �ּ���.");
      	forms.MEMBER_JUMIN2.focus();
        return false;
	} 
	if(email1.length == 0 || email2.length ==0){
		alert("�̸����� ����� �Է��ϼ���.");
		joinform.MEMBER_EMAIL1.focus();
		return false;
	}
	if(phone.length == 0){
		alert("�� ��ȭ�� �Է��ϼ���.");
		joinform.MEMBER_PHONE.focus();
		return false;
	}
	if((forms.MEMBER_ZIPCODE1.value=="")||(forms.MEMBER_ZIPCODE1.value.length<3)){
		alert("�����ȣ ���� 3�ڸ��� �Է��� �ּ���.");
      	forms.MEMBER_ZIPCODE1.focus();
        return false;
 	}
 	if((forms.MEMBER_ZIPCODE2.value=="")||(forms.MEMBER_ZIPCODE2.value.length<3)){
		alert("�����ȣ ���� 3�ڸ� �Է��� �ּ���.");
      	forms.MEMBER_ZIPCODE2.focus();
        return false;
	}  
	if(addr1.length == 0){
		alert("�� �ּҸ� �Է��ϼ���.");
		joinform.MEMBER_ADDR1.focus();
		return false;
	} 
	if(addr2.length == 0){
		alert("�� �ּҸ� �Է��ϼ���.");
		joinform.MEMBER_ADDR2.focus();
		return false;
	} 
	if(mobile.length == 0){
		alert("�޴��� ��ȣ�� �Է��ϼ���.");
		joinform.MEMBER_MOBILE.focus();
		return false;
	}
	return true;
}

function openConfirmId(joinform){
	var id=joinform.MEMBER_ID.value;
	var url="./MemberIDCheckAction.me?MEMBER_ID="+joinform.MEMBER_ID.value;
	
	if(id.length == 0){
		alert("���̵� �Է��ϼ���.");
		joinform.MEMBER_ID.focus();
		return false;
	}
	open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no,"+"scrollbars=no,resizable=no,width=400,height=200");
}
function openZipcode(joinform){
	var url="./Zipcode.me"
	open(url, "confirm", "toolbar=no,location=no,"+"status=no,menubar=no,"+"scrollbars=yes,resizable=no,"+"width=410,height=400");
}
function gNumCheck(){
	if(event.keyCode >= 48 && event.keyCode <= 57){
		return true;
	}else{
		event.returnValue=false;
	}
}
</script>
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0" align="center">
	<tr>
	<td colspan=2>
	<!-- ȸ������ -->
	<form name="joinform" action="./MemberJoinAction.me" method="post" onsubmit="return check()">
	<p align="center">
	<table border="1" width="80%" height="80%">
	<tr>
		<td width="17%" bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;�̸�</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_NAME" size="20"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;���̵�</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_ID" size="10" maxlength="15"/>
			<input type="button" name="confirm_id" value="�ߺ�Ȯ��" onclick="openConfirmId(this.form)"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;��й�ȣ</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="password" name="MEMBER_PW" size="15"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;��й�ȣ Ȯ��</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="password" name="MEMBER_PW2" size="15" />
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">&nbsp;</td>
		<td>
		<font size="2">&nbsp;&nbsp;&nbsp;
		(���̵�� ��й�ȣ�� ���ڿ� ���ڸ� �����Ͽ� 2~12�ڸ��� ����� �ּ���)</font>
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;�ֹε�Ϲ�ȣ</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_JUMIN1" size="12" 
				onkeypress="gNumCheck()" maxlength="6"/>-	
			<input type="text" name="MEMBER_JUMIN2" size="12" 
				onkeypress="gNumCheck()" maxlength="7"/>
		</td>
	</tr>
	<tr>
		<td bgcolor="#f5f5f5">
			<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;�̸��� �ּ�</font>
		</td>
		<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_EMAIL1" size="13"/>@
			<input type="text" name="MEMBER_EMAIL2" size="15"/> 
		</td>
		</tr>
		<tr>
		<td bgcolor="#f5f5f5">
		<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;���� ���� ����</font>
		</td>
		<td>
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="MEMBER_EMAIL_GET" value="YES" checked/>
		<font size="2">����</font>
		&nbsp;&nbsp;<input type="radio" name="MEMBER_EMAIL_GET" value="NO"/>
		<font size="2">���� ����</font>
		</td>
		</tr>
		<tr>
			<td bgcolor="#f5f5f5">
				<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;����ȭ</font>
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_PHONE" size="24"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#f5f5f5">
				<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;�����ȣ</font>
			</td>
			<td>
			&nbsp;&nbsp;&nbsp;
			<input type="text" name="MEMBER_ZIPCODE1" size="6" 
				onkeypress="gNumCheck()" maxlength="3"/>- 
			<input type="text" name="MEMBER_ZIPCODE2" size="6" 
				onkeypress="gNumCheck()" maxlength="3" />&nbsp;&nbsp;
			<input type="button" name="zipcode" value="�����ȣ �˻�" 
				onclick="openZipcode(this.form)" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#f5f5f5">
				<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;���ּ�</font>
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_ADDR1" size="50" />
			</td>
		</tr>
		<tr>
			<td bgcolor="#f5f5f5">
				<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;���ּ�</font>
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_ADDR2" size="50"/>
			</td>
		</tr>
		<tr>
			<td bgcolor="#f5f5f5">
				<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;�޴���</font>
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="MEMBER_MOBILE" size="24"/>
			</td>
		</tr>
	</table>
	<table width="80%">
		<tr>
			<td align="center">
				<br/><input type="submit" value="Ȯ ��"/>
			</td>
		</tr>
	</table>
	</form>
	<!-- ȸ������ -->
	</td>
	</tr>
</table>
</body>
</html>
