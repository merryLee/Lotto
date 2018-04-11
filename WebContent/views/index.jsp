<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 온라인 로또 구매 대행');
$(document).ready(function(){

	
	if('${ninfo}' != null && '${ninfo}' != '') {
		alert('ninfo는 값이있음!');
		$("#nextno").html('<strong>${ninfo.nanumno + 1}회 추첨방송</strong>');
	}
	
	$.get({
		url: '${root}/common/nextday',
		success: function(data) {
			$("#nextbs").text(data);
		},
		error: function() {
			alert('error');
		},
		dataType: 'text'
	});

	nextTime();

	var w = $("#sec1").width();
	var h = w * 0.5625;
	$("#bc").attr('width', w);
	$("#bc").attr('height', h);
	$("#sec2").css('min-height', h);
	$("#sec3").css('min-height', h);
    $(window).resize(function(){
		var w = $("#sec1").width();
		var h = w * 0.5625;
		$("#bc").attr('width', w);
		$("#bc").attr('height', h);
		$("#sec2").css('min-height', h);
		$("#sec3").css('min-height', h);
    });
    
    $("#sec3>a").on('mouseover', function(){
		$("#sec3>a>div").css('background-color', '#AED1FE');
    });
    $("#sec3>a").on('mouseout', function(){
		$("#sec3>a>div").css('background-color', '#BEDAFE');
    });
});
function nextTime() {
	$.get({
		url: '${root}/common/nexttime',
		success: function(data) {
 			$("#nexttime").text(data);
		},
		error: function() {
			alert('error');
		},
		dataType: 'text'
	});
	setTimeout('nextTime()', 1000);
}
</script>

<div id="main">

<div id="main-image" class="py-5">
	<div class="container py-5">
		<div class="row py-5">
			<div class="mimg-padding col-md-12 py-5"></div>
			<div class="mimg-padding col-md-12 py-5"></div>
		</div>
	</div>
</div>
<%-- <div id="slider" class="" style=""></div> --%>

<div id="infosection" class="py-5" style="">
	<div class="container bg-white py-5">
		<div class="row">
			<div id="sec1" class="col-md-6 py-3 text-center">
				<iframe id="bc" width="544" height="306" src="http://serviceapi.nmv.naver.com/flash/convertIframeTag.nhn?vid=7941E1BE189EB18A370508BA95D58F5A04AF&outKey=V1268cd6a0cc975eddc826b00d40fb9e81a514cbf3970cfe322266b00d40fb9e81a51" frameborder="no" scrolling="no" allow='autoplay; encrypted-media' allowfullscreen></iframe>
			</div>
			<div id="sec2" class="col-md-3 py-3">
				<div class="p-3" style="background-color: #F2F8FE;">
					<div class="align-middle">
						<h4 id="nextno">추첨방송</h4><br/>
						<h5 id="nextbs"></h5><br/>
						<h6>남은시간</h6>
						<h5 id="nexttime"></h5>
					</div>
				</div>
			</div>
			<div id="sec3" class="col-md-3 py-3 text-white">
				<a style="color: inherit;" href="#">
				<div class="p-3" style="background-color: #BEDAFE;">
					<div class="align-middle text-center"><h4><strong>로또구매<br/>바로가기</strong></h4></div>
				</div></a>
			</div>
		</div>
	</div>
</div>
<div id="cologo" style="background-color: #F3F3F3;">
<div class="container py-5" >
<div class="row text-center">
<div class="col-md-3 py-3"><a href="http://www.nlotto.co.kr/" target="_blank">
<div class="px-3 bg-white"><img class="img-fluid" src="${root}/resources/img/cologo/cologo1.png" height="" alt=""></div></a></div>
<div class="col-md-3 py-3"><a href="http://www.bokgwon.go.kr/" target="_blank">
<div class="px-3 bg-white"><img class="img-fluid" src="${root}/resources/img/cologo/cologo2.png" height="" alt=""></div></a></div>
<div class="col-md-3 py-3"><a href="http://www.ngcc.go.kr/" target="_blank">
<div class="px-3 bg-white"><img class="img-fluid" src="${root}/resources/img/cologo/cologo3.png" height="" alt=""></div></a></div>
<div class="col-md-3 py-3"><a href="http://www.kcgp.or.kr/" target="_blank">
<div class="px-3 bg-white"><img class="img-fluid" src="${root}/resources/img/cologo/cologo4.png" height="" alt=""></div></a></div>
</div>
</div>
</div>
</div><!-- main -->

<%@ include file="/views/common/footer.jsp" %>