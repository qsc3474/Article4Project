<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>


<!-- Site Stylesheet -->
<link rel="stylesheet" href="assets/css/app.css" type="text/css">

<!-- 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<style>
div.bhoechie-tab-menu div.list-group>a.active:after {
	display: none;
}

div.bhoechie-tab-menu div.list-group>a .fa {
	color: #ccc;
}

div.bhoechie-tab-menu div.list-group>a.active, div.bhoechie-tab-menu div.list-group>a.active .fa
	{
	background-color: #ccc;
	background-image: #ccc;
	color: #ffffff;
	border: #ccc;
}

.notice-sec {
	padding: 0 70px;
}
thead {border-top: 2px solid #FDC647 !important;}
 
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<section class="step-title pt-null">
		<div class="section-title text-center" data-wow-duration="1000ms"
			data-wow-delay="0.3s">
			<h2>미응답 QnA 조회</h2>
		</div>
	</section>

	<section class="notice-sec">
		<div class="container">
			<div class="row col-md-10">
			<div class="col-lg-2">
				<div class="page-submenu">
					<div class="list-group">
						<a
							href="${ pageContext.servletContext.contextPath }/admin/book/List"
							class="list-group-item active text-center">
							<h4 class="glyphicon glyphicon"></h4> <br />예약관리
						</a> <a href="${ pageContext.servletContext.contextPath}/admin/board"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4> <br />관리자 게시판 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/admin/nonAnswer/qna"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4> <br />미응답 Q&A 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/admin/member/list"
							class="list-group-item text-center">
							<h4 class="glyphicon"></h4> <br />회원 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/hp/report/count/list"
							class="list-group-item text-center">
							<h4 class="glyphicon "></h4> <br /> 신고 관리
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div id="page-wrapper">
					<div id="page-inner">
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default panel-wrap">
									<table class="table table-hover table-bordered"
										id="dataTables-example"
										aria-describedby="dataTables-example_info">
										<thead>
											<tr>

												<th>글 번호</th>
												<th>제목</th>
												<th>카테고리</th>
												<th>작성일</th>
												<th>작성자번호</th>

											</tr>
										</thead>
										<tbody>

											<c:forEach var="non"
												items="${requestScope.nonAnswerQnaList }">
												<tr>


													<td><c:out value="${non.no }" /></td>
													<td><c:out value="${non.title }" /></td>
													<td><c:out value="${non.categoryNo }" /></td>
													<td><c:out value="${non.drawupDate }" /></td>
													<td><c:out value="${non.writer.no }" /></td>

												</tr>
												<tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!-- container -->
	</section>

</body>
</html>