<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//1]서버 물리적 경로 가져오기
	String ggyongro = application.getRealPath("/Upload");
	File file = new File(ggyongro);
	File[] fileArr = file.listFiles();
	
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp</title>
</head>
<body>
	<fieldset>
		<legend>업로드된 파일 목록</legend>
		<ul style="list-style:decimal;">
			<%for(File fil:fileArr){ %>
				<li>파일명 : <%=fil.getName()%>,파일크기 :<%=(int)Math.ceil((fil.length()/1024.0)) %>KB</li>
			<%} %>
		</ul>
	</fieldset>
	<fieldset>
		<legend>업로드된 파일 목록(forEach)</legend>
		
		<c:set var="fileList" value="<%=fileArr %>"/>
		<c:forEach var="filelist" items="${fileList }" varStatus="loop">
				${loop.count}. 파일명 : ${filelist.name} <br/>
		</c:forEach>
	</fieldset>
</body>
</html>
