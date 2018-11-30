<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <link href="/web/project/css/menu.css" rel="stylesheet"> 

<title>BongsMall</title>
</head>

<body>
	<div class="headerTop">
		<div class="innerLeft">
			<div class="bookmark">
				<a href="mainPage.jsp"><img src="/web/project/img/menu/북마크.png" alt="bookmark"></a>
			</div>
			<div class="search">
				<form name="search" action="#">
					<input  type="text" class="검색" title="검색어를 입력하세요" 
						onfocus="this.value='';"
						onblur="if (this.value == '') {this.value='환영합니다! 검색어를 입력해 주세요.';}"
						value="환영합니다! 검색어를 입력해 주세요." id="searchText" name="search_keyword"
						style="width: 264px;" > <input type="image" class="검색버튼"
						src="/web/project/img/menu/돋보기.png" alt="검색" title="검색" >
				</form>
				<table class="innerRight">
					<td><a href="/web/project/login.jsp"><font class="font" color="black" size="3px">LOGIN</font></a></td>
					<td><a href="gaipPage.jsp"><font class="font" color="black" size="3px">JOIN</font></a></td>
					<td><a href="#"><font class="font" color="black" size="3px">CART</font></a></td>
					<td><a href="#"><font class="font" color="black" size="3px">ORDER</font></a></td>
					<td><a href="#"><font class="font" color="black" size="3px">MYPAGE</font></a></td>
				</table>
			</div>
		</div>
	</div>
	<div class="headerMiddle">
			<br><br><br><font style="font-size: 50px; margin-left: 43%; margin-top: 10%;">Bong's Mall</font>
	</div>
	<div class="headerfooter">
		<table class="menubar">
			<th width="7%"><a href="#"><font color="black">NEW</font></a></th>
			<th width="7%"><a href="#"><font color="black">BEST</font></a></td>
			<th width="7%"><a href="#"><font color="black">DRESS</font></a></th>
			<th width="7%"><a href="#"><font color="black">TOP</font></a></th>
			<th width="7%"><a href="#"><font color="black">OUTER</font></a></th>
			<th width="7%"><a href="#"><font color="black">KNIT</font></a></th>
			<th width="7%"><a href="#"><font color="black">SKIRT</font></a></th>
			<th width="7%"><a href="#"><font color="black">PANTS</font></a></th>
			<th width="10%"><a href="community.jsp"><font color="black">COMMUNITY</font></a>
			</td>


		</table>
	</div>
  

</body>
</html>