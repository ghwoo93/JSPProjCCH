<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	BBSDto dto = new BBSDto(no,null,title,content,null,null);
	//4]CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected = dao.update(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("View.jsp?no="+no+"&nowPage="+nowPage);
	}
	else{%>
	<script>
		alert("수정 실패했어요");
		history.back();
	</script>	
	<%
	}//else


%>