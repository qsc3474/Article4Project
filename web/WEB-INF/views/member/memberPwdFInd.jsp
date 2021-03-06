<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h2>비밀번호 찾기</h2>

			</div>
			<div class="login-box">
				<form action="" method="post">
					<div class="form-group">
						<label for="exampleInputName1">아이디</label>
						<input type="text" class="form-control" name="id" id="exampleInputName1" placeholder="고객님의 이름을 입력하세요">
					</div>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="exampleInputEmail1">이름</label>
						<input type="text" class="form-control" name="name" id="exampleInputEmail1" placeholder="가입시등록하신 이메일을 입력하세요">
					</div>
					<!-- /.form-group -->
					<div class="form-group">
						<label for="exampleInputEmail1">이메일</label>
						<input type="email" class="form-control" name="email" id="exampleInputEmail1" placeholder="가입시등록하신 이메일을 입력하세요">
					</div>
					<input type="submit" class="gp-btn btn-primary larg br-null b-null" value="확인">
				</form>
			</div>
		</section>
		<!-- id/pwd 찾기 -->
	
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>