<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="https://cdn.sobekrepository.org/includes/jquery-rotate/2.2/jquery-rotate.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>


<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/css/app.css"
	type="text/css">

<style>
html, body, button {
	font-family: Arial, "돋움", Dotum, "굴림", Gulim, "Apple SD Gothic Neo",
		AppleGothic, sans-serif;
}

button {
	border: 0;
	margin: 0;
	padding: 0;
}

.title {
	margin-top: 50px;
	text-align: center;
}

.box-roulette {
	position: relative;
	margin: 50px auto;
	width: 500px;
	height: 500px;
	border: 10px solid #ccc;
	border-radius: 50%;
	background: #ccc;
	overflow: hidden;
}

.box-roulette .markers {
	position: absolute;
	left: 50%;
	top: 0;
	margin-left: -25px;
	width: 0;
	height: 0;
	border: 25px solid #fff;
	border-left-color: transparent;
	border-right-color: transparent;
	border-bottom-color: transparent;
	z-index: 9999;
}

.box-roulette .roulette {
	position: relative;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.box-roulette .item {
	position: absolute;
	top: 0;
	width: 0;
	height: 0;
	border: 0 solid transparent;
	transform-origin: 0 100%;
}

.box-roulette .label {
	position: absolute;
	left: 0;
	top: 0;
	color: #fff;
	white-space: nowrap;
	transform-origin: 0 0;
}

.box-roulette .label .text {
	display: inline-block;
	font-size: 20px;
	font-weight: bold;
	line-height: 1;
	vertical-align: middle;
}

#btn-start {
	display: block;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -50px 0 0 -50px;
	width: 100px;
	height: 100px;
	font-weight: bold;
	background: #fff;
	border-radius: 50px;
	z-index: 9999;
	cursor: pointer;
}
</style>
</head>
<body id="home-version-1"
	class="home-version-1 sticky-header transparent-header menu-two"
	data-style="default">

	<jsp:include page="/WEB-INF/views/hotel/common/header.jsp"></jsp:include>



	<section class="step-title bg-white">
		<div class="section-title ht-title text-center"
			data-wow-duration="1000ms" data-wow-delay="0.3s">
			<h2>이벤트</h2>
			<p>프로젝트 모두 고생하셨습니다.</p>
		</div>
	</section>

	<section class="bg-white pt-null" style=" height: 650px;">

		<div class="box-roulette">
			<div class="markers"></div>
			<button type="button" id="btn-start">GO</button>
			<div class="roulette" id="roulette"></div>
		</div>
	</section>

	<script
		src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js'></script>
	<script
		src='https://cdn.sobekrepository.org/includes/jquery-rotate/2.2/jquery-rotate.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js'></script>
	<script id="rendered-js">
(function ($) {
  $.fn.extend({

    roulette: function (options) {

      var defaults = {
        angle: 0,
        angleOffset: -45,
        speed: 5000,
        easing: "easeInOutElastic" };


      var opt = $.extend(defaults, options);

      return this.each(function () {
        var o = opt;

        var data = [
        {
          color: '#3f297e',
          text: '꽝' },

        {
          color: '#1d61ac',
          text: '당첨' },

        {
          color: '#169ed8',
          text: '꽝' },

        {
          color: '#209b6c',
          text: '꽝' },

        {
          color: '#60b236',
          text: '당첨' },

        {
          color: '#efe61f',
          text: '꽝' },

        {
          color: '#f7a416',
          text: '꽝' },

        {
          color: '#e6471d',
          text: '당첨' },

        {
          color: '#dc0936',
          text: '꽝' },

        {
          color: '#e5177b',
          text: '당첨' },

        {
          color: '#be107f',
          text: '꽝' },

        {
          color: '#881f7e',
          text: '꽝' }];



        var $wrap = $(this);
        var $btnStart = $wrap.find("#btn-start");
        var $roulette = $wrap.find(".roulette");
        var wrapW = $wrap.width();
        var angle = o.angle;
        var angleOffset = o.angleOffset;
        var speed = o.speed;
        var esing = o.easing;
        var itemSize = data.length;
        var itemSelector = "item";
        var labelSelector = "label";
        var d = 360 / itemSize;
        var borderTopWidth = wrapW;
        var borderRightWidth = tanDeg(d);

        for (i = 1; i <= itemSize; i += 1) {if (window.CP.shouldStopExecution(0)) break;
          var idx = i - 1;
          var rt = i * d + angleOffset;
          var itemHTML = $('<div class="' + itemSelector + '">');
          var labelHTML = '';
          labelHTML += '<p class="' + labelSelector + '">';
          labelHTML += '	<span class="text">' + data[idx].text + '<\/span>';
          labelHTML += '<\/p>';

          $roulette.append(itemHTML);
          $roulette.children("." + itemSelector).eq(idx).append(labelHTML);
          $roulette.children("." + itemSelector).eq(idx).css({
            "left": wrapW / 2,
            "top": -wrapW / 2,
            "border-top-width": borderTopWidth,
            "border-right-width": borderRightWidth,
            "border-top-color": data[idx].color,
            "transform": "rotate(" + rt + "deg)" });


          var textH = parseInt(2 * Math.PI * wrapW / d * .5);

          $roulette.children("." + itemSelector).eq(idx).children("." + labelSelector).css({
            "height": textH + 'px',
            "line-height": textH + 'px',
            "transform": 'translateX(' + textH * 1.3 + 'px) translateY(' + wrapW * -.3 + 'px) rotateZ(' + (90 + d * .5) + 'deg)' });


        }window.CP.exitedLoop(0);

        function tanDeg(deg) {
          var rad = deg * Math.PI / 180;
          return wrapW / (1 / Math.tan(rad));
        }


        $btnStart.on("click", function () {
          rotation();
        });

        function rotation() {

          var completeA = 360 * r(5, 10) + r(0, 360);

          $roulette.rotate({
            angle: angle,
            animateTo: completeA,
            center: ["50%", "50%"],
            easing: $.easing.esing,
            callback: function () {
              var currentA = $(this).getRotateAngle();

              console.log(currentA);

            },
            duration: speed });

        }

        function r(min, max) {
          return Math.floor(Math.random() * (max - min + 1)) + min;
        }

      });
    } });

})(jQuery);

$(function () {

  $('.box-roulette').roulette();

});
//# sourceURL=pen.js
    </script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>