<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/common/settings.jsp" %>
</head>
<body>
<script>
$(document).attr('title', 'O Lotto - 포인트 충전하기');
$(document).ready(function(){
	
});

function tossCharge() {
	var balance = $("input:radio[name=value]:checked").val();
	if(balance == "" || balance == undefined) {
		alert("충전금액을 확인하세요!");
		return;
	} else {
		$("#chargeForm").attr('action', '${root}/myinfo/tosscharge');
		$("#chargeForm").submit();
	}
}
function kakaoCharge() {
 	var balance = $("input:radio[name=value]:checked").val();
	if(balance == undefined || balance == undefined) {
		alert("충전금액을 확인하세요!");
		return;
	} else {
		$("#chargeForm").attr('action', '${root}/myinfo/kakaocharge');
		$("#chargeForm").submit();
	}
}
</script>

<div id="charge">

	<header class="sticky-top" style="background-color: white;">
		<nav class="navbar navbar-expand-md border-b">
			<div class="container">
				<img class="" src="${root}/resources/img/mainlogo.png" style="height: 26px;">
			</div>
		</nav>
	</header>

	<div class="container py-5">

	<form name="chargeForm" method="POST" action="" onsubmit="return false;">

	<h6 class="text-dark"><strong>포인트충전</strong></h6>
	<h6>충전하실 금액을 선택해주세요.</h6>
	<div class="border-b my-2"></div>

		<div class="form-group row px-2 mx-0 mb-0" style="font-size: 14px;">
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value1" value="1000" checked>
						<label for="radio1">1000원</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value2" value="3000">
						<label for="radio2">3000원</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value3" value="5000"> <label for="radio3">5000원</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value1" value="10000"> <label for="radio4">10000원</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value2" value="30000"> <label for="radio5">30000원</label>
					</div>
					<div class="form-check mb-0 col-4">
						<input class="form-check-input" type="radio" name="value"
							id="value3" value="50000"> <label for="radio6">50000원</label>
					</div>
		</div>
		
	<div class="py-4"></div>
	
	<h6><strong>충전방법</strong></h6>
	<h6>충전방법을 선택해주세요.</h6>
	<div class="border-b my-2"></div>
	
	<div class="text-center">
	<a href="javascript: tossCharge();"><img src="${root}/resources/img/mypage/toss.png" class="img-fluid mx-1" style="border-radius: 5px;"></a>
	<a href="javascript: kakaoCharge();"><img src="${root}/resources/img/mypage/kakaopay.png" class="img-fluid mx-1" style="border-radius: 5px;"></a>
	</div>
	</form>
</div>

	<div id="footer" class="fixed-bottom" style="background-color: #F7F7F7;">
		<div class="container py-3">
		<div class="row">
			<div class="col-md-12 text-center text-muted">
				<small>O! Lotto! 온라인 로또 구매 대행 서비스</small>
			</div>
		</div>
		</div>
	</div>

</div> <!-- charge -->
<jsp:include page="/views/common/optional.jsp"></jsp:include>
</body>
</html>