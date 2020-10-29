<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunctionsOfJSTL.jsp</title>
</head>
<body>
	<fieldset>
		<legend>JSTL의 함수 라이브러리</legend>
		<!--
			JSTL에서 제공하는 함수들은 EL에서호출해야 한다.
			호출방법 : \${접두어:함수명([매개변수들])}
			JSTL의 모든 함수는 하상 값을 반환한다. 
		 -->
		 <!-- 데이터 준비 -->
		 <%
		 	String[] mountains={"한라산","성인봉","태백산","덕유산"};
		 %>
		 <fmt:formatDate value="<%=new Date()%>" var="today" pattern="yyyy년MM월dd일"/>
		 <c:set var="todayString">Today는 ${today }입니다</c:set>
		 <c:set var="interString">Politics,Economics,Entertaionments,Sports</c:set>
		 <c:set var="array" value="<%=mountains %>"/>
		 <c:set var="collection" value="<%= new HashMap() %>"/>
		 <c:set target="${collecion }" property="user" value="KOSMO"/>
		 <c:set target="${collecion }" property="pass" value="1234"/>
		 
		 <h2>int length(Object)</h2>
		 <ul style="list-style:upper-roman;">
		 	<li>문자열의 길이:${fn:length(todayString) }</li>
		 	<li>배열의 크기:${fn:length(array) }</li>
		 	<li>컬렉션에 저장된 객체수(JSTL함수 이용) : ${fn:length(collection) }</li>
		 	<li>컬렉션에 저장된 객체수(EL함수 이용) : ${collection.size() }</li>
		 </ul>
		 
		 <h5>컬렉션에 저장된 객체 여부 판단:JSTL함수 이용</h5>
		 <c:if test="${fn:length(collection) != 0  }" var="result">
		 	<c:forEach items="${collection }" var="item">
		 		${item.key } : ${item.value }<br/>
		 	</c:forEach>
		 </c:if>
		 <c:if test="${!result }">
		 	저장된 객체가 없어요.
		 </c:if>
		 
		 <h5>컬렉션에 저장된 객체 여부 판단:EL함수 이용</h5>
		 <c:if test="${collection.size() !=0 or not empty collection }" var="result">
		 	<c:forEach items="${collection }" var="item">
		 		${item}<br/>
		 	</c:forEach>
		 </c:if>
		 <c:if test="${!result }">
		 	저장된 객체가 없어요
		 </c:if>
		 <h2>String subString (문자열.시작인덱스.끝인덱스)</h2>
		 <ul>
		 	<li>Today 추출 : ${fn:substring(todayString,0,5) }</li>
		 	<li>날짜부분부터 문자열 끝까지 추출 : ${fn:substring(todayString,7,-1) }</li>
		 </ul>
		 <h2>String subStringAfter(무자열,str) : str이후의 문자열 반환</h2>
		 "Today" 이후의 문자열 추출 : ${fn:substringAfter(todayString,"Today") }
		 <h2>String subStringBuffer(무자열,str) : str이후의 문자열 반환</h2>
		 "Today" 이후의 문자열 추출 : ${fn:substringAfter(todayString,"는") }
		 <h2>String trim(String) : 양쪽의 공백 제거</h2>
		 \${fn:trim(" J             S         T  L") }[트림 적용전] : X${" J             S         T  L"}Y<br/>
		 \${fn:trim(" J             S         T  L") }[트림 적용후] : X${fn:trim(" J             S         T  L") }Y<br/>
		 
		 <h2>String replace(문자열,srt,dest):문자열에서 src를 dest로 대체</h2>
		 ${fn:replace(todayString,'Today','Tomorrow') }<br/>
		 <h4>방법1</h4>
		 <c:set var="temp" value=" ${fn:replace(todayString,'Today','Tomorrow') }"/>
		 ${fn:replace(temp),'29','30') }
		 <h4>방법2</h4>
		 ${fn:replace(fn:replace(todayString,'Today','Tomorrow'),'29','30') }
		 <h2>boolean startsWith(문자열,str) : 문자열이 str로 시작하면 true,아니면 false</h2>
		 ${fn:endsWith(todayString,'입니다.') }
		 <h2>String[] split(문자열,delim):문자열에서 delim(구분자)로 문자열 분리</h2>
		 ${fn:split(interString,",") }<br/>
		 <c:forEach items="${fn:split(interString,',') }" var="item">
		 	${item }<br/>
		 </c:forEach>
		 <h2>String join(배열,str) : 모든 배열 요소를 str로 연결해서 하나의 문자열로 반환</h2>
		 ${ fn:join(array,'세모모양') }
		 <h2>String escapeXml(문자열) : HTML태그를 그대로 출려하고자 할때</h2>
		 함수 라이브러리 사용 : ${fn:escapeXml("<h3>함수 라이브러리 사용</h3>") } <br/>
		 코어 태그 라이브러리 사용:<c:out value="<h3>함수 라이브러리 사용</h3>"/>
		 <h2>int indexOf(str1,str2) : str1에서 str2의 인덱스 위치 반환</h2>
		 ${fn:indexOf(todayString,'Day') } <br/>
		 ${fn:indexOf(todayString,'day') }
		 <h2>boolean contains(str1,str2):str1에서 str2가 포함되었으면 true,아니면 false 반환</h2>
		 ${fn:contains(todayString,'Day') } <br/>
		 ${fn:contains(todayString,'day') }
		 <h2>boolean contains(str1,str2):대소문자 구분않고str1에서 true,아니면 false 반환</h2>
		 ${fn:containsIgnoreCase(todayString,'Day') } <br/>
		 ${fn:containsIgnoreCase(todayString,'day') }
		 <h2>String toUpperCase(String) 및  String toLowerCase(String)</h2>
		 대문자로 변경 : ${fn:toUpperCase((interString) }<br/>
		 소문자로 변경 : ${fn:toLowerCase((interString) }<br/>
		 
		 
	</fieldset>
</body>
</html>