<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- RedirectTag.jsp -->
<c:set var="requestvar" scope="request" value="리퀘스트영역"/>
<%--
	response.sendRedirect(request.getContextPath()+"/JSTL10/ImportedPage.jsp?user=KIM&pass=1234");
--%>

<%-- Context Root를 안써야 한다. --%>
<%-- 
<c:redirect url="/JSTL10/ImportedPage.jsp">
	<c:param name="user" value="PARK"/>
	<c:param name="pass" value="1234"/>
</c:redirect>
--%>
<!-- 다른 어플안에 있는 페이지로 redirect로 
	context속성 : 다른 웹 어플의 /로 시작하는 프로젝트 명
	url속성 : 프로젝트명을  -->
	
<!-- 
<c:redirect url="/Index.jsp" context="/TestProj">
	<c:param name="user" value="PARKDFDSAA"/>
	<c:param name="pass" value="123444444"/>
</c:redirect>
 -->