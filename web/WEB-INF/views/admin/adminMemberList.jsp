<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원조회</title>

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
            <div class="section-title ht-title text-center" data-wow-duration="1000ms" data-wow-delay="0.3s">
                <h2>회원조회</h2>
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
										<colgroup>
		                                <col width="6%">
		                                <col width="8%">
		                                <col width="8%">
		                                <col width="10%">
		                                <col width="15%">
		                                <col width="24%">
		                                <col width="10%">
		                                <col width="10%">
		                                <col width="5%">
		                                <col width="4%">
		                            	</colgroup>
										<thead>
											<tr>

												<th>회원번호</th>
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>주소</th>
												<th>생일</th>
												<th>가입 날짜</th>
												<th>상태</th>
												<th>종류</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="mem" items="${requestScope.allMemberList }">
												<tr>

													<td><c:out value="${mem.no }" /></td>
													<td><c:out value="${mem.id }" /></td>
													<td><c:out value="${mem.name }" /></td>
													<td><c:out value="${mem.phone }" /></td>
													<td><c:out value="${mem.email }" /></td>
													<td><c:out value="${mem.address }" /></td>
													<td><c:out value="${mem.birthday }" /></td>
													<td><c:out value="${mem.enrollDate }" /></td>
													<td><c:out value="${mem.status }" /></td>
													<td><c:out value="${mem.kind }" /></td>
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