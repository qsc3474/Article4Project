<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>

   <!-- 추가 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <style>
        div.bhoechie-tab-menu div.list-group>a.active:after {display: none;}
        div.bhoechie-tab-menu div.list-group>a .fa {color: #ccc;}
        div.bhoechie-tab-menu div.list-group>a.active,
        div.bhoechie-tab-menu div.list-group>a.active .fa {background-color: #ccc; background-image: #ccc; color: #ffffff; border: #ccc;}

.notice-sec {padding: 0 70px;}
    </style>

</head>
<body>

<jsp:include page="../common/header.jsp"></jsp:include>
	
		<!-- title -->
        <section class="step-title bg-white mt">
            <div class="section-title ht-title text-center" data-wow-duration="1000ms" data-wow-delay="0.3s">
                <h2>신고관리</h2>
            </div>
        </section>
        <!-- /title -->

      <section class="notice-sec">
		<div class="container">
			<div class="col-lg-2">
				<div class="page-submenu">
					<div class="list-group">
						<a
							href="${ pageContext.servletContext.contextPath }/admin/book/List"
							class="list-group-item active text-center">
							<h4 class="glyphicon glyphicon"></h4>
							<br />예약관리
						</a> <a
							href="${ pageContext.servletContext.contextPath}/admin/board"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4>
							<br />관리자 게시판 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/admin/nonAnswer/qna"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4>
							<br />미응답 Q&A 관리
						</a> <a href="${ pageContext.servletContext.contextPath }/admin/member/list"
							class="list-group-item text-center">
							<h4 class="glyphicon"></h4>
							<br />회원 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/hp/report/count/list"
							class="list-group-item text-center">
							<h4 class="glyphicon "></h4>
							<br /> 신고 관리
						</a>
					</div>
				</div>
				</div>
               <div class="col-lg-10">
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
                                                                
                                                                <th>신고번호</th>                                    
                                                                <th>신고자</th>
                                                                <th>글 작성자</th>
                                                                <th>신고사유</th>
                                                                <th>상세내역</th>                                  
                                                              
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        
                                                         <c:forEach var="report" items="${requestScope.reportList }">                                                           <tr>
                                                              
                                                               
                                                                <td><c:out  value="${report.reportNo }"/></td>
                                                                <td><c:out value="${report.reporter.name }"/></td>
                                                                <td><c:out value="${report.reportedWriter.name }"/></td>
                                                                <td><c:out value="${report.reportCategoryName.reportCategoryName }"/></td>
                                                                <td><c:out value="${report.reportReasonContent }"/></td>
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
  
</body>
</html>