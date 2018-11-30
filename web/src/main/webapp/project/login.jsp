<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/login.css" type="text/css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script>


function cambiar_login() {
  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";  
document.querySelector('.cont_form_login').style.display = "block";
document.querySelector('.cont_form_sign_up').style.opacity = "0";               

setTimeout(function(){  document.querySelector('.cont_form_login').style.opacity = "1"; },400);  
  
setTimeout(function(){    
document.querySelector('.cont_form_sign_up').style.display = "none";
},200);  
  }

function cambiar_sign_up(at) {
  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
  document.querySelector('.cont_form_sign_up').style.display = "block";
document.querySelector('.cont_form_login').style.opacity = "0";
  
setTimeout(function(){  document.querySelector('.cont_form_sign_up').style.opacity = "1";
},100);  

setTimeout(function(){   document.querySelector('.cont_form_login').style.display = "none";
},400);  


}    



function ocultar_login_sign_up() {

document.querySelector('.cont_forms').className = "cont_forms";  
document.querySelector('.cont_form_sign_up').style.opacity = "0";               
document.querySelector('.cont_form_login').style.opacity = "0"; 

setTimeout(function(){
document.querySelector('.cont_form_sign_up').style.display = "none";
document.querySelector('.cont_form_login').style.display = "none";
},500);  
  
  }

$(function(){
	 $("button#companyLogin").click(function(){
		 if($("input[name='id']").val().length==0 || $("input[name='pw']").val().length==0){
			 alert('ID PASS CHECK');
			 $("input[name='id']").val('');
			 $("input[name='pw']").val('');
			 $("input[name='id']").focus();
			 return false;
		 }else {
		  $("form[name='frm']").submit();    			  
		
		 }
	 }) ;
  });

$(function(){
	 $("button#cus_login").click(function(){
		 if($("input[name='cid']").val().length==0 || $("input[name='cpw']").val().length==0){
			 alert('ID PASS CHECK');
			 $("input[name='cid']").val('');
			 $("input[name='cpw']").val('');
			 $("input[name='cid']").focus();
			 return false;
		 }else {
		  $("form[name='frm2']").submit();    			  
		
		 }
	 }) ;
 });


</script>
</head>
<body>
<div class="cotn_principal" style="background-color: #ffdedd;">
<br><br><br><br><br><br>
<font style="font-family: 휴먼매직체; font-size: 50px; ">Bong's Mall</font>
<div class="cont_centrar">

  <div class="cont_login">
<div class="cont_info_log_sign_up">
      <div class="col_md_login">
<div class="cont_ba_opcitiy">
        
        <h2>일반회원</h2>  
  <p>Bong's Mall에 방문해주셔서 감사합니다. 즐겨운 쇼핑되세요!</p> 
  <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
  </div>
  </div>
<div class="col_md_sign_up">
<div class="cont_ba_opcitiy">
  <h2>기업회원</h2>
  
  <p>Bong's Mall의 파트너 여러분을 환영합니다.</p>

  <button class="btn_sign_up" onclick="cambiar_sign_up()">LOGIN</button>
</div>
  </div>
       </div>

    
    <div class="cont_back_info">
       <div class="cont_img_back_grey">
       <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
       </div>
       
    </div>
<div class="cont_forms" >
    <div class="cont_img_back_">
       <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
       </div>
   <form action="/web/customerLogin.do" name="frm2" method="post">
 <div class="cont_form_login">
<a href="#" onclick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
   <h2>LOGIN</h2>
 <input type="text" placeholder="Id" name="cid" />
<input type="password" placeholder="Password" name="cpw" />
<button class="btn_login" onclick="cambiar_login()" id="cus_login" >LOGIN</button>
<button class="btn_login" onclick="">JOIN</button>
<button class="btn_login" onclick="">ID/PW찾기</button>
  </div>
  </form>
<form action="/web/adminLogin.do" name="frm" method="post">
   <div class="cont_form_sign_up">
<a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
     <h2>LOGIN</h2>
<input type="text" placeholder="Id" name="id" >
<input type="password" placeholder="Password" name="pw" />
<button class="btn_sign_up" id="companyLogin" onclick="cambiar_sign_up()">LOGIN</button>
<button class="btn_sign_up" onclick="cambiar_sign_up()">JOIN</button>
  </div>
</form>
    </div>
<br><br><br>
<a href="#"><font color="black" style="font-size: 20px; ">HOME</font></a>
   
  </div>
 </div>
</div>
</form>
</body>
</html>