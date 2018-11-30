<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	 <%--  	<%@include file="/project/menu.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
 <link href="./css/contents.css" rel="stylesheet" type="text/css" /> 
<link href="./css/default.css" rel="stylesheet" type="text/css" /> 
<style type="">
#container {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}
a#modify:hover{
cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("a#save").click(function(){
			if($("a#save").text()=='저장'){
				if($("input[name='productName']").val().length==0||$("input[name='productPrice']").val().length==0||$("input[name='productOrigin']").val().length==0||$("select[name='productCategory']").val()=='empty'||$("input[name='file']").val().length==0){
					$("input[name='productName']").val('');
					$("input[name='productPrice']").val('');
					$("input[name='productOrigin']").val('');
					$("select[name='productCategory']").prop("selectedIndex",0);
					$("input[name='file']").val('');
					$("input[name='productName']").focus();
					return false;
				}else{
					if($("form[name='frm']").attr("action")=='productInsert.do'){
						$("form[name='frm']").submit();
					}else{
					$("form[name='frm']").attr("action","productInsert.do").submit();
					}
				}
			}else if ($("a#save").text()=='수정'){
				if($("input[name='productName']").val().length==0
						||$("input[name='productPrice']").val().length==0
						||$("input[name='productOrigin']").val().length==0
						||$("select[name='productCategory']").val()=='empty'
						/* ||$("input[name='file']").val().length==0 */){
					$("input[name='productName']").val('');
					$("input[name='productPrice']").val('');
					$("input[name='productOrigin']").val('');
					$("select[name='productCategory']").prop("selectedIndex",0);
					$("input[name='productName']").focus();
					return false;
				}else{
					$("form[name='frm']").attr("action","modifyGO.do").submit();
				}
			}
		});
			
		$("a[name='modify']").click(function(){
			if($(this).text()=='수정'){
				$(this).text('취소');
				$.ajax({
					url:"modifyCart.do",
					dataType:"json",
					data:{"no":$(this).attr("class"),
							"job":"mod"	
					},success:function(v){
						$(v).each(function(index,dom){
							$("a#save").text("수정");
							$("input[name='productName']").val(dom.productName);
							$("input[name='productPrice']").val(dom.productPrice);
							$("input[name='productOrigin']").val(dom.productOrigin);
							$("select[name='productCategory']").val(dom.productCategory).prop("selected",true);
							$("input[name='nno']").val(dom.no);
						});
					},error:function(){
						alert('error');
					}
				});
			}else if($(this).text()=='취소'){
				$("input[name='productName']").val('');
				$("input[name='productPrice']").val('');
				$("input[name='productOrigin']").val('');
				$("select[name='productCategory']").val('empty').prop("selected",true);
				$("a#save").text("저장");
				$("a[name='modify']").text('수정');
			}
		});
	});
	$(function(){
		$("div#container").hide();
		$("a#chart").click(function(){
			if($("a#chart").text()=='차트'){
			$("a#chart").text('닫기');
			$("div#container").show();
			}else{
			$("a#chart").text('차트');
			$("div#container").hide();
			}
			$.ajax({
				url:"ajaxChart.do",
				type:"POST",
				dataType:"text",
				data:{"id":'${id}'},
				success:function(v){
					eval(v);
				},error:function(){
					alert('error');
				}
			});
			
		});
		
	});
</script>
</head>
<body>
	<div id="wrap" style="width: 100%; ">
 <!-- header -->
 	<jsp:include page="/include/topGnb.jsp"></jsp:include> 
		<!--// header --> 
		<div id="sub_container">
			<div id="contentsWrap" class="sub_con5">
				<div class="board_form">
					<div class="con_title">
						<p style="font-family: 휴먼매직체; font-size: 30px;">상품등록/보기/수정</p>
					</div>
					<div class="contents">
						<div class="btnSet clfix mgb15">
							<span class="fr"> <span class="button"><a href="#" style="color: white; text-decoration: none; background-color: gray; width: 50px; height: 30px;" >목록</a></span>
							</span>
						</div>
						<div id="container"></div>
						<table class="bbsWrite mgb35">
							<caption></caption>
							<colgroup>
								<col width="95" />
								<col width="395" />
								<col width="95" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th>업체명</th>
									<td><select style="width: 200px;">
											<option>선택하세요</option>
									</select></td>
									<th>상품명</th>
									<td><input type="text" name="data"
										style="border: 1px solid #ddd; height: 20px;"
										class="inputText" size="30" />
										<span class="button"><a href="#">검색</a></span>
										<span class="button"><a	href="#"id="chart">차트</a></span>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="clfix">
							<div class="tbWrapLt">
								<table class="bbsList">
									<colgroup>
										<col width="30" />
										<col width="100" />
										<col width="100" />
										<col width="100" />
										<col width="100" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">NO.</th>
											<th scope="col">상품 이미지</th>
											<th scope="col">모델</th>
											<th scope="col">가격</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pList}" var="i" varStatus="cnt">
											<tr>
												<td>${cnt.count}<input type="hidden" value="${i.no}"
													name="pListId" id="" />
												</td>
												<td><img src="/web/cartUp/${i.fileName}" width="50"
													height="50" /></td>
												<td>${i.productName }</td>
												<td>${i.productPrice}</td>
												<td><span class="buttonFuc"><a name="modify" class="${i.no}" id="">수정</a>
												</span><span class="buttonFuc"><a href="/web/deleteCart.do?no=${i.no}"/>삭제</a></span></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<div class="tbWrapRt">
								<ul class="tabA clfix mgb15">
									<li class="over"><a href="#info1">01. 상품등록</a></li>
								</ul>
								<form action="productInsert.do" name="frm" method=post
									enctype="multipart/form-data">
									<div id="info1" class="tbWrapCnt" style="display: block;">
										<table class="bbsWrite mgb10">
											<caption></caption>
											<colgroup>
												<col width="95" />
												<col />
											</colgroup>
											<tbody>
												<tr>
													<th>상품명</th>
													<td><input type="text"
														style="border: 1px solid #ddd; height: 20px;"
														name="productName" class="inputText" size="50" /></td>
												</tr>
												<tr>
													<th>원산지</th>
													<td><input type="text"
														style="border: 1px solid #ddd; height: 20px;"
														name="productOrigin" class="inputText" size="50" /></td>
												</tr>
												<tr>
													<th>상품가격</th>
													<td><input type="text"
														style="border: 1px solid #ddd; height: 20px;"
														name="productPrice" class="inputText" size="50" /> <input
														type="hidden" name="id" value="${id}" /></td>
												</tr>
												<tr>
													<th>카테고리</th>
													<td><select style="width: 200px;"
														name="productCategory" id="productCategory">
															<option selected="selected" value="empty">선택하세요</option>
															<option value="dress">DRESS</option>
															<option value="top">TOP</option>
															<option value="outer">OUTER</option>
															<option value="knit">KNIT</option>
															<option value="skirt">SKIRT</option>
															<option value="pants">PANTS</option>
													</select></td>
												</tr>
												<tr>
													<th>상품이미지1</th>
													<td class="alignM"><input type="file" name="file"
														class="inputText" size="10" /></td>
												</tr>
											</tbody>
										</table>
										<input type="hidden" name="nno" />
									</div>
								</form>
							</div>

							<p class="agr">
								<span class="button"><a href="#" id="save">저장</a></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!--Footer-->
		<%-- <jsp:include page="/include/footer.jsp"></jsp:include> --%>
		<!--END Footer-->
	</div>
</body>
</html>