<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%-- <%
request.setCharacterEncoding("euc-kr");

QnaBoardBean qnaBoardBean=new QnaBoardBean();
String job=request.getParameter("job");
/* qnaBoardBean.setNo(QnaBoardDao.getSequence()); */
try{
	
    String filePath="C:\\Users\\sjh\\front\\web\\WebContent\\project\\qnaBoardImg\\";	 
   if(FileUpload.isMultipartContent(request)){
	 DiskFileUpload diskFileUpload=new DiskFileUpload();
	 diskFileUpload.setRepositoryPath(filePath);
	 diskFileUpload.setSizeMax(1024*1024*10);
	 List<FileItem> list=diskFileUpload.parseRequest(request);
	 
	 for(int i=0;i<list.size();i++){
		 FileItem fileItem=list.get(i);
		 String name=fileItem.getFieldName();
		 if(name.equals("category")){
			 qnaBoardBean.setCategory(fileItem.getString("euc-kr"));
		 }
		 if(name.equals("title")){
			 qnaBoardBean.setTitle(fileItem.getString("euc-kr"));
		 }
		 if(name.equals("writer")){
			 qnaBoardBean.setWriter(fileItem.getString("euc-kr"));
		 }
		 if(name.equals("password")){
			 qnaBoardBean.setPassword(Integer.parseInt(fileItem.getString("euc-kr")));
		 }
		 if(name.equals("contents")){
			 qnaBoardBean.setContents(fileItem.getString("euc-kr"));
		 }
		 
			if (!fileItem.isFormField()) {
				if(fileItem.getName().length()==0){
					qnaBoardBean.setFilename("notImage.JPG");
				}else{
				qnaBoardBean.setFilename(fileItem.getName());
				File file = new File(filePath + qnaBoardBean.getFilename());
				fileItem.write(file);
				}
			}
	 }
   }
}catch(Exception e){
	e.printStackTrace();
}
 qnaBoardBean.setJob(job);
 int sequence=QnaBoardDao.getSequence();
 qnaBoardBean.setPnum(sequence);
 qnaBoardBean.setNo(sequence);
 QnaBoardDao.insertQnaBoard(qnaBoardBean);
 response.sendRedirect("qnaBoarda.jsp");
 
%> --%>
<body>
</body>
</html>