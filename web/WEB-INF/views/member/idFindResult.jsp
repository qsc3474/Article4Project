<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="home-version-1" class="home-version-1 sticky-header transparent-header menu-two" data-style="default">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div id="main_content">

		<!-- id/pwd 찾기 -->
		<section class="login-sec">
            <div class="section-title text-center" data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>아이디 찾기</h2>

			</div>
			<div class="login-box">
				
					<div class="form-group">
						<h2>아이디 찾기</h2>
					</div>
					<!-- /.form-group -->
					<div class="form-group">
					<h3>당신의 아이디는 <span><c:out value="${requestScope.memberId.id }"/></span> 입니다 </h3>
					</div>
					<!-- /.form-group -->
					<a href="${ pageContext.servletContext.contextPath }/member/login"class="gp-btn btn-primary larg br-null b-null" >돌아가기 </a>
				
			</div>
		</section>
		<!-- id/pwd 찾기 -->
	
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>