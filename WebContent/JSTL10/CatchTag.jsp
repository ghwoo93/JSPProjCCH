<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CatchTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>catch태그 </legend>
		<c:set var="fnum" value="100"/>
		<c:set var="snum" value="0"/>
		<h2>에러가 안나는 경우 : 에러 내용 저장안됨</h2>
		<c:catch var="error">
		\${fnum/snum} : ${fnum/snum} <br/>
		</c:catch>
		\${error } : ${error }<br/>
		<h2>에러가 나는 경우 : 에러 내용 저장됨</h2>
		<c:catch var="error">
		\${"백"+100 } : ${"백"+100 } <br/>
		</c:catch>
		\${error } : ${error }<br/>
		<h2>JSTL문법오류는 CATCH안됨</h2>
		<!-- 아래 choose안에 주석달면 에러 처리나는데 그건 catch처리가 되지 않는다. -->
		<c:catch var="error">
			<c:choose>
				<c:when test="true">
					참이다
				</c:when>
			</c:choose>
		</c:catch>
		
	</fieldset>
</body>
</html>