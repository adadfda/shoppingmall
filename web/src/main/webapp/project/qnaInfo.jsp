
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="community.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="./css/qnaInfo.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%-- <%
int no=Integer.parseInt(request.getParameter("no"));
QnaBoardBean qnaBoardBean=(QnaBoardBean)QnaBoardDao.selectQnaInfo(no);

%> --%>
<div id="wrapper">
<div id="container">

					<div class="qnainfobtn">
						
							<span class="button"><a href="#"><font class="qnainfo-font" color="black">����</font></a></span>
							<span class="button"><a href="#" value="delect"><font  class="qnainfo-font" color="black">����</font></a></span>
							<span class="button"><a href="#" ><font  class="qnainfo-font" color="black">���</font></a></span>
							<span class="button"><a href="#"><font  class="qnainfo-font" color="black">���</font></a></span>
					
					</div>
			<div id="contentsWrap" class="contentsWrap">
					<table class="bbsList">
	                     <tr bgcolor="#eaeaea">
	                     <td width="268"><font class="table-inner-font">No.1</font></td>
	                     <th><font class="table-inner-font"> [ī�װ�] Ÿ��Ʋ</font></th>
	                     </tr>
	                     <tr bgcolor="#eaeaea"><td width="268"><font class="table-inner-font">�ۼ���: ������</font></td><td align="right"><font class="table-inner-font">�����: 2018/09/02</font></td></tr>
					
                        <tr>
                        
                          <td class="fir" rowspan="7"><img src="./qnaBoardImg/3.gif" width="268" height="204"/></td>
                          
                         
                        </tr>
                        
                        <tr>
                         
                          <td height="200"><font class="table-inner-font">������</font></td>
                        </tr>
                       
                      
                                           
                      
					</table>
					
				
			</div>
		</div>
</div>
</body>
</html>