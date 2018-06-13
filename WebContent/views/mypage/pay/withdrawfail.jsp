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
	$("#withdrawFailBtn").on('click', function() {
		$(opener.location).attr('href','${root}/mylotto/list');
		self.close();
	});
});
</script>

<div id="withdrawfail">

	<header class="sticky-top" style="background-color: white;">
		<nav class="navbar navbar-expand-md border-b">
			<div class="container">
				<img class="" src="${root}/resources/img/mainlogo.png" style="height: 26px;">
			</div>
		</nav>
	</header>

	<div class="container py-5">

		<div class="row text-center py-5">
		<div class="col-md-12 align-self-center">
			<h6 class="text-dark"><strong>출금실패</strong></h6>
			<label>포인트 출금에 실패하였습니다.</label>
			<div class="border-b"></div>
			<div class="py-5">
				<button id="withdrawFailBtn" type="button" class="btn btn-sm btn-primary">확인</button>
			</div>
		</div>
		</div>
		
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

</div> <!-- withdrawfail -->
<jsp:include page="/views/common/optional.jsp"></jsp:include>
</body>
</html>