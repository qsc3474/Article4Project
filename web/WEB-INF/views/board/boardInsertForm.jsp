<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">       
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>개편한병원- 게시판 작성</title>
    
    <style>
    .custom-select{height: 24px !important;}
    </style>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- title -->
	<section class="step-title bg-white pb-null">
		<div class="section-title ht-title text-center"
			data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>게시판 작성</h2>
		</div>
	</section>
	<!-- /title -->
	<section>
		<div class="container">
			<div role="main">
				<form name="form" id="form" role="form"
					action="${ pageContext.servletContext.contextPath }/hp/board/insert"
					method="post">
					<div class="mb-12">
						<label for="title">카테고리</label> 
						<select  class="form-control" name="boardCategory" id="boardCategory">
							<c:if test="${ requestScope.categoryNo eq 'HP_RV' }">
								<option value="HP_RV" selected>후기게시판</option>
							</c:if>
							<c:if test="${ requestScope.categoryNo eq 'HP_QNA' }">
								<option value="HP_QNA" selected>QnA</option>
							</c:if>
							<c:if test="${ requestScope.categoryNo eq 'HP_FAQ' }">
								<option value="HP_FAQ" selected>자주묻는질문</option>
							</c:if>
							<c:if test="${ requestScope.categoryNo eq 'HP_NTC' }">
								<option value="HP_NTC" selected>공지사항</option>
							</c:if>
						</select>
					</div>
					<div class="mb-12">
						<label for="title">제목</label> <input type="text"
							class="form-control" name="title" id="title"
							placeholder="제목을 입력해 주세요">
					</div>
					<div class="mb-12">
						<label for="reg_id">작성자</label> 
						<input type="text"
							class="form-control" name="writer" id="writer"
							value="${ sessionScope.loginMember.name }" readonly> 
						<input
							type="hidden" name="memberNo"
							value="${ sessionScope.loginMember.no }">
					</div>
					<div class="mb-12">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content"
							id="content" placeholder="내용을 입력해 주세요"></textarea>
					</div>
					<div class="mb-12" id="fileUploadDiv" style="background: #fff; margin-top: 10px;">
						<label for="content" style="margin-top: 10px;">사진 업로드</label>
						<div class="input-group" style="margin-top: 10px; background:#eee;" >
							<c:if test="${ requestScope.categoryNo eq 'HP_NTC' }">
								<label for="tag" class="input-group-text" for="inputGroupFile">파일</label>
								<input type="file" class="form-control" name="inputGroupFile" id="inputGroupFile" >
							</c:if>
							<c:if test="${ requestScope.categoryNo eq 'HP_RV' }">
								<label for="tag" class="mb-12" for="thumbnailFile" style="padding-top:10px">썸네일</label>
								<input type="file" name="thumbnailFile" id="thumbnailFile" class="mb-12 bg-white"  >
								<div class="cf"></div>
								<label for="tag"  for="inputGroupPicture" style="margin-top:10px;">사진</label>
								<input type="file" name="inputGroupPicture" id="inputGroupPicture" class="bg-white" style="margin-bottom:15px">
							</c:if>
						</div>
					</div>
					
					<div class="text-center" style="margin-top: 20px;">
						<button type="button" class="gp-btn btn-dark" id="btnSave">저장</button>
						<button type="button" class="gp-btn btn-primary"
							id="btnList">목록</button>
					</div>
				</form>
			</div>
			<script>
	            $(document).on('click', '#btnList', function (e) {
	
	                e.preventDefault();
	                if(${ requestScope.categoryNo eq 'HP_RV' }){
	                	
	                	location.href = "${pageContext.request.contextPath}/hp/review/select/list";
	                	
	                } else if(${ requestScope.categoryNo eq 'HP_NTC' }){
	                	
	                	location.href = "${pageContext.request.contextPath}/hp/notice/select/list";
	                	
	                } else if(${ requestScope.categoryNo eq 'HP_QNA' }){
	                	
	                	location.href = "${pageContext.request.contextPath}/hp/qna/select/list";
	                	
	                } else if(${ requestScope.categoryNo eq 'HP_FAQ' }){
	                	
	                	location.href = "${pageContext.request.contextPath}/hp/faq/select/list";
	                	
	                }
	
	            });
	            
	            if (document.getElementById("btnSave")) {
	    			const $btnSave = document.getElementById("btnSave");
	    			var theForm = document.getElementById("form");
	    			$btnSave.onclick = function() {
	    				if(document.getElementById("boardCategory").value == "def") {
	    					
	    					alert("카테고리를 선택해주세요!");
	    					return false;
	    					
	    				} else if(document.getElementById("title").value == null || document.getElementById("title").value == "") {
	    					
	    					alert("제목을 입력해주세요!");
	    					return false;
	    					
	    				} else if(document.getElementById("content").value == null || document.getElementById("content").value == "") {
	    					
	    					alert("내용을 입력해주세요!");
	    					return false;
	    					
	    				} else {
	    					
	    					if(${ requestScope.categoryNo eq "HP_NTC" }){
	    						
	    						theForm.action = "${ pageContext.servletContext.contextPath }/hp/notice/file/insert";
	    						theForm.encoding = "multipart/form-data";
	    						
	    					} else if (${ requestScope.categoryNo eq "HP_RV" }){
	    						
	    						theForm.action = "${ pageContext.servletContext.contextPath }/hp/review/file/insert";
	    						theForm.encoding = "multipart/form-data";
	    						
	    					}
	    					
	    					document.getElementById("form").submit();
	    					
	    				}
	    				
	    			}
	    			
	    			
	    			
	    		}
	            
	            if(document.getElementById("fileUploadDiv")) {
	            	
	            	if(!${ requestScope.categoryNo eq 'HP_RV' } && !${ requestScope.categoryNo eq 'HP_NTC' }){ // 후기, 공지사항 게시판만 파일업로드 가능
	            		
	            		var fileUploadDiv = document.getElementById("fileUploadDiv");
		            	fileUploadDiv.style.display = "none";
	            		
	            	}
	            	
	            	
	            }
        	</script>
		</div>
	</section>
</body>
</html>