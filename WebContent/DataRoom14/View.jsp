<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>View.jsp</title>

<!-- 부트스트랩 -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- 네비게이션바 시작 -->
	<jsp:include page="/Template/DataRoomTop.jsp"/>	
	<!-- 네비게이션바 끝 -->
	<!-- 실제 내용 시작 -->
	<div class="container">
		<!-- 점보트론(Jumbotron) -->
		<div class="jumbotron">
			<h1>
				자료실<small>상세보기 페이지</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="col-md-2 text-center">번호</th>
						<td>${dto.no}</td>
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td>${dto.title}</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
						<th class="text-center">첨부파일</th>
						<td>${dto.attachFile}</td>
					</tr>
					<tr>
						<th class="text-center">다운로드</th>
						<td>${dto.downCount}</td>
					</tr>
					<tr>
						<th class="text-center">등록일</th>
						<td>${dto.postDate}</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">내용</th>						
					</tr>
					<tr>
						<td colspan="2">${dto.content}</td>						
					</tr>
				</table>
				
			</div>		
		</div><!-- row -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
				<ul id="pillMenu" class="nav nav-pills center-block" style="width:200px;margin-bottom:10px">
					<li ><a href="#" class="btn btn-success" data-toggle="modal" data-target="#passwordModal">수정</a></li>
					<!-- alert창에서  취소시에는 모달창이 뜨지 않도록 data-toggle="modal" 제거 그리고 자스로 제어해서 모달창을 띄운다(삭제 확인버튼 클릭시에만) -->
					<li><a href="#" class="btn btn-success"  data-target="#passwordModal">삭제</a></li>
					<li><a href="<c:url value='/DataRoom/List.kosmo?nowPage=${param.nowPage}'/>" class="btn btn-success" >목록</a></li>
				
				</ul>
			</div>
		</div><!-- row -->		
		
	</div><!-- container -->
	
	<!-- 경고창 모달 시작 -->
    <div class="modal fade" id="small-modal" data-backdrop="static">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	    	<div class="modal-body">
	    		<button class="close" data-dismiss="modal">
	    			<span>&times;</button>
	    		</button>
	    		<h5 class="modal-title"><span class="glyphicon glyphicon-bullhorn"></span> 경고 메시지</h5>
	    		<h6 id="warningMessage"></h6>
	    	</div>
	      	
	    </div>
	  </div>
	</div>
	
	
	<!-- 실제 내용 끝 -->
	<!-- 푸터 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp"/>
	<!-- 푸터 끝 -->
	<script>
		
	</script>
	
</body>
</html>