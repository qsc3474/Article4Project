<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리</title>

<link rel="stylesheet" href="/creation/resources/css/common2.css">

<style>
html{background:#f8f8f8;}
.notice-sec { padding: 0 70px; }
.panel { border: 0 !important;}
thead, .list-group {border-top: 2px solid #FDC647 !important;}
table{text-align: center;}
.list-group-item:hover {
    z-index: 2;
    color: #fff;
    background-color: #FDC647 !important;
    border-color: #FDC647 !important;
}
.list-group-item{padding: 15px 15px !important; letter-spacing: 0px; font-size:15px; }
.list-group-item sapn{ font-weight: bold;}
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- title -->
	<section class="step-title bg-white">
		<div class="section-title ht-title text-center"
			data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>신고관리</h2>
		</div>
	</section>
	<!-- /title -->

	<section class="notice-sec bg-white">
		<div class="full-container">
			<div class="row">
				<div class="col-lg-2">
					<div class="page-submenu">
						<div class="list-group">
							<a
							href="${ pageContext.servletContext.contextPath }/admin/book/List"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 예약관리</span> <br />
						</a> <a href="${ pageContext.servletContext.contextPath}/admin/board"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 관리자 게시판관리</span> <br />
						</a> 
						<a
							href="${ pageContext.servletContext.contextPath }/admin/nonAnswer/qna"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 미응답 Q&amp;A관리</span> <br />
						</a>
						<a
							href="${ pageContext.servletContext.contextPath }/admin/member/list"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 회원관리</span> <br />
						</a> <a
							href="${ pageContext.servletContext.contextPath }/hp/report/count/list"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 신고관리</span> <br /> 
						</a>
						</div>
					</div>
				</div>
				<div class="col-lg-10">
					<div id="page-wrapper">
					<div id="page-inner">
							<div class="col-md-12">
								<div class="table-container inner-bordered center fc01">
									<table class="table table-hover table-bordered"
										id="dataTables-example"
										aria-describedby="dataTables-example_info">
											<thead>
												<tr>

													<th>신고번호</th>
													<th>신고자</th>
													<th>글 작성자</th>
													<th>신고사유</th>
													<th>상세내역</th>

												</tr>
											</thead>
											<tbody>

												<c:forEach var="report" items="${requestScope.reportList }">
													<tr>


														<td><c:out value="${report.reportNo }" /></td>
														<td><c:out value="${report.reporter.name }" /></td>
														<td><c:out value="${report.reportedWriter.name }" /></td>
														<td><c:out
																value="${report.reportCategoryName.reportCategoryName }" /></td>
														<td><c:out value="${report.reportReasonContent }" /></td>
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