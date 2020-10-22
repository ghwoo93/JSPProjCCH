<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h2>삽입된 페이지</h2>
	<hr/>
	<ul style="list-style: upper-roman;">
		<li>Integer타입:<%=pageContext.getAttribute("pageInteger") %></li>
		<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
		<li>Date타입:<%=pageContext.getAttribute("pageDate") %></li>
		<li>MemberDTO타입 1:<%=firstMemberString %></li>
		<li>MemberDTO타입 2:<%=second %></li>		
	</ul>