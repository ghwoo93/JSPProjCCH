<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImportTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>ImportTag.jsp</legend>
		<!-- jsp:include액션태그와 같다. request 영역을 공유한다. -->
		<!-- url속성에 절대 경로 설정시 프로젝트명은 제외 - java로 코드로 변환되는것들은 절대경로할때 contextRoot 넣지 않는다. 자동으로 붙게된다  -->
		
		<!-- 리퀘스트 영역에 속성 저장 -->
		<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
		<h2>var속성 미 지정,현재 위치에 바로 삽입된다(include액션태그와 같다.)</h2>
		<c:import url="ImportedPage.jsp" >
			<c:param name="user" value="KIM"/>
			<c:param name="pass" value="1234"/>
		</c:import>
		<h2>var속성 지정,원하는 위치에 바로 삽입하고자 할때</h2>
		<c:import url="ImportedPage.jsp" var="content">
			<c:param name="user" value="PARK"/>
			<c:param name="pass" value="9999"/>
		</c:import>
		<h3>아래 import된 페이지 내용 출력</h3>
		${content}
		<h2>외부에 있는 컨텐트 삽입</h2>
		<%--<c:import url="http://www.nate.com"/>--%>
		 
		 <iframe style="border:none;width:100%;heigth:500px" src="ImportedNate.jsp"></iframe>
		 
	</fieldset>
</body>
</html>