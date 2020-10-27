<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	/*
	검색후 수정시 주의 사항
	sendRedirect()메소드로 쿼리스트링 연결시 한글 깨짐
	해결책:
	1.검색어를  URLEncoder.encode()
	  단,검색후 총 레코드 수 구할때는 인코딩하지 않는 검색어 전달
	2.수정 완료후 뷰로 이동시 뷰(View.jsp)에서는 URLDecoder.decode()해야 한다
	
	단,form태그로 이동시에는  URL 인코딩 및 디코딩 불필요
	*/
	//검색과 관련된 파라미터 받기]
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = URLEncoder.encode(request.getParameter("searchWord"), "UTF-8");
	
	Map map = new HashMap();//검색후 수정시를 위한 맵	
	String queryString="";//검색용 쿼리 스트링
	if(searchColumn !=null){		
		//검색시 생성된 페이징번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString=String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
		map.put("columnName",searchColumn);
		//인코딩 하지 않는 검색어 전달
		map.put("keyword",request.getParameter("searchWord"));
	}//////
	
	//현재 페이지번호 받기
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	BBSDto dto = new BBSDto(no,null,title,content,null,null);
	//4]CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected = dao.update(dto);
	//수정 후에는 레코드수가 다를 수 있다
	
	
	int totalRowCount = dao.getTotalRowCount(map);
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int totalPage =(int)Math.ceil((double)totalRowCount/pageSize);
	if(totalPage < nowPage) nowPage=totalPage;	
	
	dao.close();
	if(affected == 1){
		response.sendRedirect("View.jsp?"+queryString+"no="+no+"&nowPage="+nowPage);
	%>
		
		<!--  
		<form action="View.jsp">
			<input type="hidden" name="no" value="<%=no%>"/>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
			<input type="hidden" name="searchWord" value="<%=searchWord%>"/>
			<input type="hidden" name="searchColumn" value="<%=searchColumn%>"/>		
		</form>
		<script>			
			document.forms[0].submit();
		</script>
		-->
    <%
    }
	else{%>
	<script>
		alert("수정 실패했어요");
		history.back();
	</script>	
	<%
	}//else


%>