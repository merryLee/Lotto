<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/common/settings.jsp" %>
</head>
<body>
<script>
$(document).attr('title', 'O Lotto - 포인트 출금하기');
$(document).ready(function(){
	var balance = ${userinfo.balance};
	$("#balance").text(balance.toLocaleString());

	$("#withdrawBtn").on('click', function() {
		var value = $("#val").val();
		var bankcode = $("#bankcode :selected").val();
		if(value == "" || value == undefined || value > balance) {
			alert("출금금액을 확인하세요!");
			return;
		} else if(bankcode == "" || bankcode == undefined) {
			alert("출금은행을 확인하세요!");
			return;
		} else {
			$("#withdrawForm").attr('action', '${root}/myinfo/withdraw');
			$("#withdrawForm").submit();
		}
	});
	
});
</script>

<div id="withdraw">

	<header class="sticky-top" style="background-color: white;">
		<nav class="navbar navbar-expand-md border-b">
			<div class="container">
				<img class="" src="${root}/resources/img/mainlogo.png" style="height: 26px;">
			</div>
		</nav>
	</header>

	<div class="container py-5">

	<form id="withdrawForm" name="withdrawForm" method="post">

	<h6 class="text-dark"><strong>포인트출금</strong></h6>
	<h6>출금하실 금액을 입력해주세요.</h6>
	<div class="border-b my-2"></div>
		
		<div class="form-group form-row">
			<label for="withdrawInfo" class="col-12 col-form-label col-form-label-sm">출금가능잔액 : <strong id="balance"></strong>&nbsp;원</label>
			<label for="inputAccountNum" class="col-3 col-form-label col-form-label-sm">출금금액</label>
			<div class="col-9">
				<input type="text" class="form-control form-control-sm" id="val" name="val" required="required">
			</div>
		</div>
		
	<div class="py-4"></div>
	
	<h6><strong>출금은행</strong></h6>
	<h6>출금하실 은행을 선택해주세요.</h6>
	<div class="border-b my-2"></div>

		<div class="form-group form-row">
			<label for="selectBank" class="col-3 col-form-label col-form-label-sm">출금은행</label>
			<div class="col-9">
				<select id="bankcode" name="bankcode" class="form-control form-control-sm">
					<option value="" selected="selected">은행선택</option>
					<option value="004">국민</option>
					<option value="011">농협</option>
					<option value="088">신한</option>
					<option value="003">기업</option>
				</select>
			</div>
		</div>
		<div class="form-group form-row">
			<label for="inputAccountNum" class="col-3 col-form-label col-form-label-sm">계좌번호</label>
			<div class="col-9">
				<input type="text" class="form-control form-control-sm" id="accountNum" name="accountNum" required="required">
			</div>
		</div>
		<div class="form-group form-row">
			<label for="confirmName" class="col-3 col-form-label col-form-label-sm">예금주</label>
			<div class="col-9">
				<input type="text" class="form-control form-control-sm" id="name" name="name" value="${userinfo.name}" placeholder="${userinfo.name}" required="required" readonly>
			</div>
		</div>

	<div class="py-4"></div>
		<div class="form-group form-row" style="margin-bottom: 48px;">
			<div class="col-md-12 text-right">
				<input type="button" id="withdrawBtn" class="btn btn-block btn-primary" value="출금요청">
			</div>
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