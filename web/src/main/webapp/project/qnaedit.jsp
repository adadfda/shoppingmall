<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="./css/qnaedit.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function passck() {
		var obj = document.qnaeditform;
		if (isNaN(obj.password.value)) {
			obj.password.value = '';
		}
	}
	function sendCheck() {
		var obj = document.qnaeditform;

		if (!(obj.category.value) || !(obj.title.value) || !(obj.writer.value)
				|| !(obj.contents.value) || !(obj.password.value)
				|| isNaN(obj.password.value)) {
			alert('��� �Է��� �ּ���.');
		} else {
			
			obj.submit();
	         }
 
		}
	
	clerarData(obj);
	function clearData(obj) {
		obj.writer.value = '';
		obj.title.value = '';
		obj.password.value = '';
		obj.contents.value = '';
	}
</script>
<%
	String job = request.getParameter("job");
	job = job == null ? "new" : job;
%>
<body>

	<form action="qnaeditInsert.jsp?job=<%=job %>"
		class="qnaeditform" method="post" name="qnaeditform"
		enctype="multipart/form-data">

		<table class="qnaeditlist">
			<tr>
				<td width="150px"><font class="title">����</font></td>
				<td width="165px"><select id="qnacategory" class="qnacategory"
					name="category">
						<option value="��ǰ����">��ǰ����</option>
						<option value="�Աݹ���">�Աݹ���</option>
						<option value="��۹���">��۹���</option>
						<option value="����� ����/��� ����">����� ����/��� ����</option>
						<option value="����� ��ȯ/��ǰ ����">����� ��ȯ/��ǰ ����</option>
				</select></td>
				<td><input type="text" size="35px" class="titleinput"
					name="title"></td>
			</tr>
			<tr>
				<td width="150px"><font class="title">�ۼ���</font></td>
				<td><input type="text" size="23px" class="titleinput"
					name="writer"></td>
			</tr>
			<tr>
				<td width="150px"><font class="title">��й�ȣ</font></td>
				<td><input type="text" value="�����Է�" class="titleinput"
					size="23px" name="password" onclick="passck()"></td>
			</tr>

		</table>
		<textarea name="contents" class="qnaedit-contents"></textarea>
		<br>
		<br>
		<table class="qnaeditlist" id="qna-file">
			<tr>
				<td width="150px"><font class="title">�̹���÷��</font></td>
				<td><input type="file" name="file"  class="inputText" size="100" />
				</td>
			</tr>
		</table>
		<table>
			<td width="90%"><a href="#"><img src="./img/menu/���.JPG"
					width="90px" height="35px"></a></td>
			<td width="5%"><a href="javascript:sendCheck()"><img
					src="./img/menu/���.JPG" width="90px" height="35px"></a>
			<td>
			<td width="5%"><a href="#"><img src="./img/menu/���.JPG"
					width="90px" height="35px"></a></td>
		</table>
	</form>


</body>
</html>