<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>개편한 병원-F&amp;Q</title>
<style>
html{background: #f8f8f8;}
.title-sec {
	margin-top: 107.628px;
	height: 100px;
	margin-bottom: 0;
	padding: 30px;
}

.section-title {
	margin-bottom: 10px;
}

.notice-sec .container {
	padding: 100px 0;
}
.panel-body {
    background-color: #fff!important;
}
.top-buttom {float:right; margin-top: -50px; margin-right:20px;}
.update-buttom {margin-right:10px; margin-top: 20px; padding:7px 15px;}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- title -->
	<section class="step-title bg-white">
		<div class="section-title ht-title text-center"
			data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>이용안내</h2>
		</div>
	</section>
	<!-- /title -->

	<section id="reviewdetail" class="notice-sec bg-white pt-null">
		<div class="container">
			<jsp:include page="/WEB-INF/views/board/pageSubmenu.jsp"></jsp:include>
			<c:if test="${ sessionScope.loginMember.kind eq 'M' }">
				<button type="button" id="insertFAQboard" class="gp-btn btn-dark small top-buttom">작성하기</button>
			</c:if>
			<div class="col-lg-10">
				<div class="col-md-12 mb">
					<div class="choose wow fadeInUp" data-wow-delay="0.5s">
						<div class="panel-group" id="accordion"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	    var currentPage = 1;
	    
	    $(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
	         getList(currentPage);
	         currentPage++;
	    }); 
	    
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	        
		     if($(window).scrollTop() >= $(document).height() - $(window).height()){
		    	 // 처음 request로 넘어온 최대페이지를 넘어가면 더이상 스크롤 이벤트를 진행시키지 않는다.
		    	 if(currentPage <= ${ requestScope.pageInfo.maxPage }){
			          getList(currentPage);
			          currentPage++;
		    	 }
		     }
		});
		 
		function getList(currentPage){
		 
		    $.ajax({
		        type : 'POST',
		        data : {"currentPage" : currentPage},
		        url : '/creation/hp/faq/select/add/list',
		        success : function(returnData) {
		        	var $accordion = $("#accordion");
		        	var num = 1;
		        	if (currentPage == 1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
		                  $accordion.html("");
		            }

		        	for(var key in returnData){
	                     console.log(key);
	                  
	                     var $div1 = $("<div>").addClass("panel panel-default");
	                     var $div2 = $("<div>").addClass("panel-heading");
	                     var $div3 = $("<div>").addClass("panel-title");
	                     
	                     var $accordionTitle2 = "<a data-toggle='collapse' class='panel-toggle' data-parent='#accordion' href='.collapse" + returnData[key].no + "'>" + "Q" + ((currentPage - 1) * 10 + num) + ". " + returnData[key].title + "</a>";
	                     var $div4 = $("<div>").addClass("panel-collapse collapse collapse" + returnData[key].no);
	                     var $accordionBody = $("<div>").addClass("panel-body").text(returnData[key].content);
	                     var $line = $("<br>");
	                     var $buttons = $("<c:if test='${ sessionScope.loginMember.kind eq \'M\' }'><input type='hidden' value='" + returnData[key].no + "'><button type='button' class='updateFAQboard gp-btn btn-dark update-buttom'>수정하기</button><button type='button' class='deleteFAQboard gp-btn btn-dark update-buttom'>삭제하기</button></c:if>");
	                     
	                     $div3.append($accordionTitle2);
	                     $div2.append($div3);
	                     $div4.append($accordionBody);
	                     $div1.append($div2);
	                     $div1.append($div4);
	                     $accordionBody.append($line);
	                     $accordionBody.append($buttons);
	                     
	                     $accordion.append($div1);
	                     num++;
	                     
		        	}
		        	$(".updateFAQboard").off('click');
		 	        $(".deleteFAQboard").off('click');
		        	deleteAndUpdateButtonAction();
		            
		       },error: function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseTest + "\n" + "error:" + error);
			   }
		    });
		}
		
		function deleteAndUpdateButtonAction(){
			
			var no = 0;
			
			$(".updateFAQboard").click(function() {
			    var $parent = this.parentNode;
			    var getNo = $parent.children[1];
			    no = getNo.value;			    
			    location.href = "${pageContext.request.contextPath}/hp/board/update?no=" + no;
		    });
	
		    $(".deleteFAQboard").click(function () {
		    	var $parent = this.parentNode;
			    var getNo = $parent.children[1];
			    no = getNo.value;
			    location.href = "${pageContext.request.contextPath}/hp/board/delete?no=" + no + "&categoryNo=HP_FAQ";
		    });
			
		}
		
		if (document.getElementById("insertFAQboard")) {
			const $insertFAQboard = document.getElementById("insertFAQboard");
			$insertFAQboard.onclick = function() {
				location.href = "${pageContext.request.contextPath}/hp/board/insert?categoryNo=HP_FAQ";
			}
		}
	</script>
</body>
</html>