<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- Meta Data -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.servletContext.contextPath }/resources/assets/img/apple-touch-icon.png">
   <link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.servletContext.contextPath }/resources/assets/img/favicon-32x32.png">
   <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/assets/img/favicon-16x16.png">
   <title>index</title>

   <!-- Dependency Styles -->
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/bootstrap/css/bootstrap.min.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/font-awesome/css/font-awesome.min.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/font-awesome/css/gp-icons.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/gp-icons/style.css" type="text/css">
   <!-- <link rel="stylesheet" href="dependencies/etlinefont-bower/style.css" type="text/css"> -->
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/bootstrap-star-rating/css/star-rating.min.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/swiper/css/swiper.min.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/wow/animate.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/jquery-ui/css/jquery-ui.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/css/settings.css" type="text/css">
   <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/dependencies/magnific-popup/magnific-popup.css" type="text/css">

   <!-- Site Stylesheet -->
   <link rel="stylesheet" href="assets/css/app.css" type="text/css">
   
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
<section class="step-title pt-null">
         <div class="section-title text-center" data-wow-duration="1000ms" data-wow-delay="0.3s">
            <h2>관리자 페이지</h2>
         </div>
      </section>

      <section class="notice-sec">
		<div class="container">
			<div class="col-lg-2">
				<div class="page-submenu">
					<div class="list-group">
						<a
							href="${ pageContext.servletContext.contextPath }/hp/notice/select/list"
							class="list-group-item active text-center">
							<h4 class="glyphicon glyphicon"></h4>
							<br />예약관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/hp/notice/select/list"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4>
							<br />관리자 게시판 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/hp/notice/select/list"
							class="list-group-item text-center">
							<h4 class="glyphicon glyphicon"></h4>
							<br />Q&A 관리
						</a> <a href="${ pageContext.servletContext.contextPath }/hp/dental"
							class="list-group-item text-center">
							<h4 class="glyphicon"></h4>
							<br />리뷰 관리
						</a> <a
							href="${ pageContext.servletContext.contextPath }/admin/member/list"
							class="list-group-item text-center">
							<h4 class="glyphicon "></h4>
							<br /> 회원관리
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
                                                                
                                                                <th>글 번호</th>                                    
                                                                <th>제목</th>
                                                                <th>내용</th>
                                                                <th>작성일</th>                                    
                                                                <th>작성자번호</th>                                    
                                                              
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        
                                                         <c:forEach var="non" items="${requestScope.nonAnswerQnaList }">                                                           <tr>
                                                              
                                                               
                                                                <td><c:out  value="${non.no }"/></td>
                                                                <td><c:out value="${non.title }"/></td>
                                                                <td><c:out value="${non.content }"/></td>
                                                                <td><c:out value="${non.drawupDate }"/></td>
                                                                <td><c:out value="${non.writer.no }"/></td>
                                                                
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