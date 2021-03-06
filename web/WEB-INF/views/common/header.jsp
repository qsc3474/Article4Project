<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/css/app.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://cdn.sobekrepository.org/includes/jquery-rotate/2.2/jquery-rotate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script src="/creation/resources/js/event.js"></script>

</head>
<body id="home-version-1" class="home-version-1 sticky-header transparent-header menu-two" data-style="default">

	<!-- header -->
	<header id="discohead" class="dt-header fixed">
		<div class="menu-wrap">
			<a id="logo" href="${ pageContext.servletContext.contextPath }">
				<img
				src="${ pageContext.servletContext.contextPath }/resources/media/img/logo.png"
				alt="discovery" class="logo-contrast"> <img
				src="${ pageContext.servletContext.contextPath }/resources/media/img/logo.png"
				alt="discovery" class="logo-normal">
			</a>
			<div id="discovery-main-menu" class="discovery-main-menu">
				<ul id="menu-home" class="menu">
					<li class="menu-item-has-children"><a href="about.html">????????????</a>
						<ul class="sub-menu">
							<li><a href="${ pageContext.servletContext.contextPath }/hp/about" >????????????</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/hp/about#Introduce">???????????????</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/hp/about#Facility">????????????</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="mg.html">????????????</a>
						<ul class="sub-menu">
							<li><a href="${ pageContext.servletContext.contextPath }/hp/mg">??????</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/hp/gs">??????</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/hp/ey">??????</a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/hp/dental">??????</a></li>
						</ul></li>
					<li><a href="${ pageContext.servletContext.contextPath }/hp/info/price">????????????</a></li>
					<li><a href="${ pageContext.servletContext.contextPath }/hp/book/insert">????????????</a></li>
					<li class="menu-item-has-children"><a href="notice.html">????????????</a>
						<ul class="sub-menu">
							<li><a
								href="${ pageContext.servletContext.contextPath }/hp/notice/select/list">????????????</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/hp/faq/select/list">??????????????????</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/hp/qna/select/list">Q&amp;A</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/hp/review/select/list">????????????</a></li>			

						</ul>
					</li>
				</ul>
				<c:if test="${ empty sessionScope.loginMember }">
					<div class="secondary-navigation pull-right">
						<ul>
							<li><a
								href="${ pageContext.servletContext.contextPath }/member/regist">????????????</a>
							</li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/member/login">?????????</a></li>
						</ul>
					</div>
				</c:if>
				<c:if test="${ sessionScope.loginMember.kind eq 'C' }">
					<ul>
						<li><c:out value="${ sessionScope.loginMember.name }" />??????
							????????? ???????????????.</li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/logout">????????????</a></li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/update">???????????????</a></li>
							<li><a
							href="${ pageContext.servletContext.contextPath }/hp/book/list">????????????</a></li>
					</ul>
				</c:if>
				<c:if test="${ sessionScope.loginMember.kind eq 'M' }">
					<ul>
						<li><c:out value="${ sessionScope.loginMember.name }" />??????
							????????? ???????????????.</li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/logout">????????????</a></li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/admin/book/List">?????????</a></li>
						<li><a
							href="${ pageContext.servletContext.contextPath }/member/update">???????????????</a></li>
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