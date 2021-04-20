<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<style>
html{background:#f8f8f8;}
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

.panel {
    border: 0 !important;}
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<section class="step-title bg-white">
		<div class="section-title ht-title text-center"
			data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>관리자 게시판</h2>
		</div>
	</section>

	<section class="notice-sec bg-white pt">
		<div class="full-container">
			<div class="col-lg-2">
				<div class="page-submenu">
					<div class="list-group">
						<a
							href="${ pageContext.servletContext.contextPath }/admin/book/List"
							class="list-group-item active text-center">
							<h4 class="glyphicon glyphicon"></h4> <br />예약관리
						</a> <a href="${ pageContext.servletContext.contextPath} /admin/board"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4> <br />관리자 게시판 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/admin/nonAnswer/qna"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4> <br />미응답 Q&A 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/hp/report/count/list"
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
			<div class="col-lg-10">
				<div id="page-wrapper">
					<div id="page-inner">
						<div class="row">
							<div class="col-md-12">
								<div class="table-container inner-bordered center fc01">
									<table  class="table table-hover table-bordered"
										id="dataTables-example"
										aria-describedby="dataTables-example_info">
										<thead>
											<tr>

												<th>글 번호</th>
												<th>제목</th>
												<th>내용</th>
												<th>작성일</th>
												<th>작성자번호</th>

											</tr>
										</thead>
										<tbody>

											<c:forEach var="bd" items="${requestScope.adminBoardList }">
												<tr>


													<td><c:out value="${bd.no }" /></td>
													<td><c:out value="${bd.title }" /></td>
													<td><c:out value="${bd.content }" /></td>
													<td><c:out value="${bd.drawupDate }" /></td>
													<td><c:out value="${bd.writer.no }" /></td>

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
		<!-- container -->
	</section>

</body>
</html>