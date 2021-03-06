<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta Data -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>νΈνν€λ</title>
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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/css/app.css" type="text/css">

<script src="/creation/resources/js/event.js"></script>
</head>

<body id="home-version-1" class="home-version-1 sticky-header transparent-header menu-two" data-style="default">

	<!-- header -->
	<header id="discohead" class="dt-header fixed">
		<div class="menu-wrap">
			<a id="logo" href="${ pageContext.servletContext.contextPath }/ht/main">
				<img
				src="${ pageContext.servletContext.contextPath }/resources/media/img/logo.png"
				alt="discovery" class="logo-contrast"> <img
				src="${ pageContext.servletContext.contextPath }/resources/media/img/logo.png"
				alt="discovery" class="logo-normal">
			</a>
			<div id="discovery-main-menu" class="discovery-main-menu">
				<ul id="menu-home" class="menu">
					<li class="menu-item-has-children"><a href="${ pageContext.servletContext.contextPath }/ht/about">νΈνμκ°</a>
						<ul class="sub-menu">
							<li><a href="${ pageContext.servletContext.contextPath }/ht/about">νΈνμκ°</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/ht/about#portfolio">μμ€μκ°</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="${ pageContext.servletContext.contextPath }/ht/service">μλΉμ€μλ΄</a>
						<ul class="sub-menu">
							<li><a href="${ pageContext.servletContext.contextPath }/ht/service">μλΉμ€ νλ‘κ·Έλ¨</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/ht/package">νΌν€μ§ νλ‘κ·Έλ¨</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/ht/event/roulette">μ΄λ²€νΈ</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="booking.html">μμ½νκΈ°</a>
						<ul class="sub-menu">
							<li><a href="${ pageContext.servletContext.contextPath }/ht/info">μ΄μ©μλ΄</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/ht/room">ROOM</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/ht/room/insert">λ£Έ μμ½</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/ht/event/Insert">μ΄λ²€νΈ μμ½</a></li>
						</ul>
					</li>
					<li class="menu-item-has-children"><a href="notice.html">μ»€λ?€λν°</a>
						<ul class="sub-menu">
							<li><a
								href="${ pageContext.servletContext.contextPath }/ht/NTC/notice/list">κ³΅μ§μ¬ν­</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/ht/FAQ/list">FAQ</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/ht/QNA/list">Q&amp;A</a></li>
						</ul>
					</li>
				</ul>
				<c:if test="${ empty sessionScope.loginMember }">
					<div class="secondary-navigation pull-right">
						<ul>
							<li><a
								href="${ pageContext.servletContext.contextPath }/member/regist">νμκ°μ</a>
							</li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/member/login">λ‘κ·ΈμΈ</a></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${ sessionScope.loginMember.kind eq 'C' }">
					<ul>
						<li><c:out value="${ sessionScope.loginMember.name }" />λμ
							λ°©λ¬Έμ νμν©λλ€.</li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/logout">λ‘κ·Έμμ</a></li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/update">λ§μ΄νμ΄μ§</a></li>
						<li class="menu-item-has-children"><a href="reservation.html">μμ½νμΈ</a>
							<ul class="sub-menu">
								<li><a href="${ pageContext.servletContext.contextPath }/ht/room/list">λ£Έμμ½</a></li>
								<li><a href="${ pageContext.servletContext.contextPath }/ht/event/list">μ΄λ²€νΈλ£Έμμ½</a></li>
							</ul>
						</li>	
						
					</ul>
				</c:if>
				<c:if test="${ sessionScope.loginMember.kind eq 'M' }">
					<ul>
						<li><c:out value="${ sessionScope.loginMember.name }" />λμ
							λ°©λ¬Έμ νμν©λλ€.</li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/logout">λ‘κ·Έμμ</a></li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/admin/book/List">κ΄λ¦¬μ</a></li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/update">λ§μ΄νμ΄μ§</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</header>
	<!-- header -->


	<!-- Dependency Scripts -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/jquery/jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/jquery-ui/jquery-ui.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/swiper/js/swiper.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/swiperRunner/js/swiperRunner.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/magnific-popup/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/jquery.appear.bas2k/jquery.appear.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/jquery.parallax-scroll/jquery.parallax-scroll.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/wow/js/wow.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/jquery.spinner/js/jquery.spinner.min.js"></script>
	<!--<script src="${ pageContext.servletContext.contextPath }/resources/dependencies/gmap3/gmap3.min.js"></script> -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/bootstrap-star-rating/js/star-rating.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/isotope/isotope.pkgd.min.js"></script>

	<!-- Revolution Slider Plugin -->

	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/extensions/revolution.extension.actions.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/extensions/revolution.extension.navigation.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/dependencies/revslider/js/extensions/revolution.extension.parallax.min.js"></script>
	<!-- Site Scripts -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/js/smooth_scroll.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/assets/js/app.js"></script>

</body>

</html>