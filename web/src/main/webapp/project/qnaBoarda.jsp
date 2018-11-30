
<%@page import="java.util.List"%>

<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="community.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="./css/qnaBoard.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<script>
	function searchCheck() {
		var obj = document.searchFrm;
		if (obj.query.value == 'empty' || !(obj.data.value)) {
			alert('Query or Data Check');
			obj.query.selectedIndex = 0;
			obj.data.value = '';
			obj.query.focus();
		} else {
			obj.submit();
		}
	}
</script>
<%-- <%
	request.setCharacterEncoding("EUC-KR");
	String query = request.getParameter("query");
	String data = request.getParameter("data");
	HashMap<String, Object> map = new HashMap<String, Object>();

	int totalRow = 0;
	int totlaPage = 0;
	if (query != null && data != null) {
		map.put("query", query);
		map.put("data", data);
		totalRow = QnaBoardDao.getTotalRow(map);
	} else {
		totalRow = QnaBoardDao.getTotalRow(null);
	}
	int pageScale = 5;
	int blockScale = 10;
	int currentPage = 1;
	int totalPage = totalRow % pageScale == 0 ? (totalRow / pageScale) : (totalRow / pageScale) + 1;
	if (totalRow == 0) {
		totlaPage = 1;
	}
	try {
		currentPage = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {
		e.printStackTrace();
	}
	int start = 1 + (currentPage - 1) * pageScale;
	int end = pageScale + (currentPage - 1) * pageScale;
	int currentBlock = currentPage % blockScale == 0 ? (currentPage / blockScale)
			: (currentPage / blockScale) + 1;
	int startPage = 1 + (currentBlock - 1) * blockScale;
	int endPage = blockScale + (currentBlock - 1) * blockScale;
	if (totalPage <= endPage) {
		endPage = totalPage;
	}
	map.put("start", start);
	map.put("end", end);

	List<QnaBoardBean> list = null;
	list = QnaBoardDao.selectQnaBoard(map);
%>
 --%>
<body>
	<form action="" method="post" name="searchFrm">
		<div class="qnalogo">
			<br> <br> <br> <font color="orange" class="font-qna"
				size="20px">Q&A</font>
		</div>

		<div class="qnawri" align="right">
			<br> <br> <span class="qnawri-btn"><a
				href="qnaedit.jsp"><img src="./img/menu/글쓰기버튼.JPG" width="90px"
					height="35px"></a></span>
		</div>

		</div>
		<div class="qnainput">
			<fieldset>
				<table>
					<td width="10%" align="right"><select id="board_category"
						name="board_category">
							<option value="0" selected="selected">전체</option>
							<option value="1">상품문의</option>
							<option value="2">입금문의</option>
							<option value="3">배송문의</option>
							<option value="4">배송전 변경/취소 문의</option>
							<option value="5">배송후 교환/반품 문의</option>
					</select></td>
					<td width="50%" align="right"><select id="query" name="query">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer">작성자</option>



					</select></td>
					<td width="15%"><input id="data" name="data"
						class="inputTypeText" type="text" width="90%"></td>
					<td width="5%"><a href="javascript:searchCheck()"><img
							src="./img/menu/검색버튼.JPG" width="70px" height="40px"></a></td>
					</fieldset>
				</table>
		</div>
		<div class="qnaboardlist-div">
			<table class="qnaboardlist">
				<tr height="50px">
					<th width="10%"><font class="qna-fonttable">번호</font></th>
					<th width="20%"><font class="qna-fonttable">카테고리</font></th>
					<th width="35%"><font class="qna-fonttable">제목</font></th>
					<th width="20%"><font class="qna-fonttable">작성자</font></th>
					<th width="15%"><font class="qna-fonttable">작성일</font></th>
				</tr>
				<%-- <%
					for (int i = 0; i < list.size(); i++) {
						QnaBoardBean qnaBoardBean = list.get(i);
				%>
 --%>
				<tr height="30px">
					<th width="10%"><font class="qna-fonttable-list" size="2px">1</font></th>
					<th width="20%"><font class="qna-fonttable-list" size="2px">카테고리</font></th>
					<th width="35%"><a href="#"><font class="qna-fonttable-list" size="2px">타이틀</font></a></th>
					<th width="20%"><font class="qna-fonttable-list" size="2px">작성자</font></th>
					<th width="15%"><font class="qna-fonttable-list" size="2px">날짜</font></th>
				</tr>

				<%-- <%
					}
				%> --%>
			</table>

<%-- 			<div class="paging">
			<table align="center">
			<th width="100%">
                 <%if(currentPage>1){ %>
				<a href="qnaBoarda.jsp?page=1">
				<%} %>
				<img
					src="./img/menu/btn_first.gif" alt="처음페이지" /></a>
				<%
                 
					if (currentBlock > 1) {
				%>
				<a href="qnaBoarda.jsp?page=<%=startPage - 1%>"> <%
 	}
 %> <img src="./img/menu/btn_prev.gif" alt="이전" /></a> <span> <%
 	for (int i = startPage; i < endPage + 1; i++) {
 		if (i == currentPage) {
 %> <a href="#"><font color="red"><%=i%></font></a> <%
 	} else {
 %> <a href="qnaBoarda.jsp?page=<%=i%>"><%=i%></a> <%
 	}

 	}
 %>
				</span>

				<%
					if (endPage < totalPage) {
				%>
				<a href="qnaBoarda.jsp?page=<%=endPage + 1%>"> <%
 	}
 %> <img src="./img/menu/btn_next.gif" alt="다음" /></a> 
 <%if(currentPage!=totalPage){ %>
 <a
					href="qnaBoarda.jsp?page=<%=totalPage%>">
					<%} %>
					<img
					src="./img/menu/btn_last.gif" alt="마지막페이지" /></a>
					</th>
			</table>
			</div> --%>
		</div>
	</form>
</body>
</html>