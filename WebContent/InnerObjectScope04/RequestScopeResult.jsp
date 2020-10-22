<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeResult.jsp</title>
</head>
<body>
<fieldset>
		<legend>리퀘스트 영역</legend>
		<h2>리퀘스트 영역에 저장된 속성 읽기</h2>
		<%
		Object object=request.getAttribute("requestMemberFirst");
		String firstMemberString="";
		if(object instanceof MemberDTO){
			firstMemberString=String.format(
					"이름:%s,아이디:%s,비번:%s,나이:%s",
					((MemberDTO)object).getName(),
					((MemberDTO)object).getId(),
					((MemberDTO)object).getPwd(),
					((MemberDTO)object).getAge()
					);
		}
		MemberDTO second=(MemberDTO)request.getAttribute("requestMemberSecond");
		
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=request.getAttribute("requestInteger") %></li>
			<li>String타입:<%=request.getAttribute("requestString") %></li>
			<li>Date타입:<%=request.getAttribute("requestDate") %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			<li>MemberDTO타입 2:<%=second %></li>		
		</ul>
	</fieldset>
</body>
</html>