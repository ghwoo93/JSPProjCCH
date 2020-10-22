<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>페이지 영역</legend>
		<h2>페이지 영역에 저장된 속성 읽기</h2>
		<%
		Object object=pageContext.getAttribute("pageMemberFirst");
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
		MemberDTO second=(MemberDTO)pageContext.getAttribute("pageMemberSecond");
		
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer타입:<%=pageContext.getAttribute("pageInteger") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=pageContext.getAttribute("pageDate") %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			<li>MemberDTO타입 2:<%=second %></li>		
		</ul>
	</fieldset>
</body>
</html>