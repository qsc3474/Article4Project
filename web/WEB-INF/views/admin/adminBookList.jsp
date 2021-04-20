<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>

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

	<section class="step-title bg-white">
		<div class="section-title ht-title text-center"
			data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>예약조회</h2>
		</div>
	</section>
	

      <section class="notice-sec bg-white">
		<div class="full-container">
		<div class="row">
			<div class="col-md-2">
				<div class="page-submenu">
					<div class="list-group">
						<a
							href="${ pageContext.servletContext.contextPath }/admin/book/List"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 예약관리</span> <br />
						</a> <a href="${ pageContext.servletContext.contextPath} /admin/board"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 관리자 게시판관리</span> <br />
						</a> 
						<a
							href="${ pageContext.servletContext.contextPath }/admin/nonAnswer/qna"
							class="list-group-item text-center">
							<span class="glyphicon glyphicon-pencil "> 미응답 Q&A관리</span> <br />
						</a>
						<a
							href="${ pageContext.servletContext.contextPath }/hp/report/count/list"
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
               <div class="col-md-10">
					<div id="page-wrapper">
						<div id="page-inner">
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default panel-wrap">
									   <form action="${pageContext.request.contextPath}/admin/book/update" method="get">
										<table class="table table-hover table-bordered"
											id="dataTables-example"
											aria-describedby="dataTables-example_info">
											<thead>
                                                  <tr>
                                                                
                                                                <th>예약번호</th>                                    
                                                                <th>회원번호</th>
                                                                <th>예약시간</th>
                                                                <th>동물 종류</th>                                    
                                                                <th>동물 이름</th>                                    
                                                                <th>동물 나이</th>                                    
                                                                <th>중성화 여부</th>
                                                                <th>특이사항</th>
                                                                <th>예약상태</th>
                                                                 <th>완료/취소</th>
                                                            </tr>
                                                        </thead>
                                                       
                                                        
                                                        <tbody>
                                                       <c:forEach var="book" items="${requestScope.allBookList }">                                                           <tr>
                                                              
                                                               
                                                                <td><c:out  value="${book.no }"/></td>
                                                                <td><c:out value="${book.memberNo }"/></td>
                                                                <td><c:out value="${book.time }"/></td>
                                                                <td><c:out value="${book.petKind }"/></td>
                                                                <td><c:out value="${book.petName }"/></td>
                                                                <td><c:out value="${book.petAge }"/> </td>                                   
                                                                <td><c:out value="${book.petNeut }"/></td>
                                                                <td><c:out value="${book.message }"/></td>
                                                                <td><c:out value="${book.status }"/></td>
                                                                <td>
                                                                    <input type="hidden"  name="no" value="${book.no }" >                                          
                                                                    <button type="submit" class="btn btn-primary btn-sm" title="Edit" ><i class="fa fa-edit"></i></button>
                                                                    <button type="button" class="btn btn-danger btn-sm deleteBtn" title="Delete" id="deleteBook"><i class="fa fa-trash-o" > </i></button>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                            
                                                          </c:forEach> 
                                                          
                                                        </tbody>
                                                       
                                                    </table>
                                                     </form>
                                                </div>
                                            </div>
                                        </div>
                        </div>
                    </div>
                </div>
          </div>          
        </div>

       <script type="text/javascript">
              $(".deleteBtn").click(function(){
                 
                 var $parent = this.parentNode;
                 console.log($parent);
                var getNo = $parent.children[0];
                console.log(getNo);
                var no = getNo.value;
                console.log(no);
                location.href = "${pageContext.request.contextPath}/admin/book/delete?no=" + no;
                
                 
              });

        <script type="text/javascript">
        function deleteButtonAction(){
            	
            	$(".deleteBtn").click(function(){
            		
            		var $parent = this.parentNode;
    			    var getNo = $parent.children[0];
    			    var no = getNo.value;
    			    location.href = "${pageContext.request.contextPath}/admin/book/delete?no=" + no;
    			    
            		
            	})
            	
            }

        </script>

        <!-- container -->
      </section>

</body>
</html>