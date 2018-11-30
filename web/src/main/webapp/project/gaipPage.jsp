<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/Style_login.css" type="text/css">
<link rel="stylesheet" href="./css/Style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JoinPage</title>
</head>
<script type="text/javascript">
function idCheck(){
	var obj=document.register_form;
	if(obj.id.value.length>0){
	document.location.href="idcheck.jsp?id="+obj.id.value;
	}else{
		alert('id를 입력해주세요.');
	}
}

function pwcheck(){
	obj=document.register_form;
	if(obj.pw.value.length<6){
		alert('pw는 6자이상 입력해주세요.');
		obj.pw.value='';
	}else{
		obj.pw1.value=obj.pw.value;
	}
}
function nameCheck() {
	var obj = document.register_form;
	var str = obj.name.value;
	var strLen = str.length;
	var array = new Array(strLen);
	for (var i = 0; i < array.length; i++) {
		array[i] = str.charAt(i);
	}
	if (!obj.name.value) {
		alert('NameCheck!');
		return false;
	} else {
		if (!(strLen >= 2 && strLen <= 6)||isNaN(obj.name.value)==false) {
			alert('2~6글자만 가능');
			obj.name.value = '';
			return false;
		}else{
			obj.name1.value=obj.name.value;
		}
	}
}
function phoneCk(){
	var obj = document.register_form;
	if(isNaN(obj.phone.value)==true ||obj.phone.value.length<10||obj.phone.value.length>11){
	alert('잘못된 유형의 전화번호입니다.');
	obj.phone.value='';
	}else{
		obj.phone1.value=obj.phone.value;
	}
}
function addrCk(){
	var obj = document.register_form;
	if(obj.addr.value.length<=0){
		alert('주소를 입력해 주세요.');
		obj.addr.value='';
	}else{
		obj.addr1.value=obj.addr.value;
	}
}
function join(){
	var obj = document.register_form;
	if(obj.id.value.length>0&& obj.pw.value.length>0&&obj.name.value.length>0&&obj.phone.value.length>0&&obj.addr.value.length>0){
		alert('가입해주셔서 감사합니다^^');
		obj.submit();
	}else{
		alert('제약조건을 확인해주세요.');
	}
}
</script>
<body>
<%
String id=request.getParameter("id");
%>
<div class="helloId">
	<h1 id="title">BongsMall </h1>
	</div><br/>
	<center>

		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<h6> Join us! </h6>
				</div>
				<div class="login-form">

					<form action="gaipinsert.jsp" name="register_form" method="post">
						<div class="control-group">
						<%
						
						if(id==null||id.equals("no")){ %>
							<input type="text" id="id" name="id" class="login-field" value=""
								placeholder="아이디" onblur="idCheck()">
								<%}else{ %>
								<input type="text" id="id" name="id" class="login-field" value="<%=id %>"
								>
								<%} %>
						</div>
						<div class="control-group">
							<input type="password" name="pw" class="login-field" value=""
								placeholder="비밀번호(6자이상)" onblur="pwcheck()">
							<input type="hidden" name="pw1" class="login-field" value=""
								>
						</div>
						<div class="control-group">
							<input type="text" name="name" class="login-field" value=""
								placeholder="이름" onblur="nameCheck()"> 
							<input type="hidden" name="name1" class="login-field" value=""
								> 
						</div>
						<div class="control-group">
							<input type="text" name="phone" class="login-field" value=""
								placeholder="전화번호(숫자만입력하세요!)" onblur="phoneCk()">
							<input type="hidden" name="phone1" class="login-field" value=""
								>
						</div>
						<div class="control-group">
							<input type="text" name="addr" class="login-field" value=""
								placeholder="주소" onblur="addrCk()">
							<input type="hidden" name="addr1" class="login-field" value=""
								>
						</div>

						<input type="button" value="Join!"
							class="btn btn-primary btn-large btn-block" onclick="join()">

						<a class="login-link" href="loginPage.jsp"> 돌아가기 </a>

					</form>
				</div>
			</div>
		</div>

	</center>
</body>
</html>