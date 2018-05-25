<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).attr('title', 'O Lotto - 마이페이지');
$(document).ready(function(){

	var balance = ${userinfo.balance};
	$("#balance").text(balance.toLocaleString());
	
	$("#chargeBtn").on('click', function() {
		window.open("${root}/myinfo/charge", "포인트 충전", "width=360,height=545,top=100,left=100,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=no");
	});
	
});
</script>

<div id="myinfo" class="py-5 bg-dark text-white">
<div class="container">
	<h4>마이페이지</h4>
	<div style="margin-bottom: .5rem;">
	<span id="myname"><strong>${userinfo.name}</strong>님</span>
	<span><a href="#" style="color: inherit;"><i class="fas fa-cog"></i>&nbsp;회원정보수정</a></span>
	</div>
	<span style="vertical-align: middle;">로또포인트&nbsp;<strong id="balance"></strong>&nbsp;원</span>
	<button id="chargeBtn" type="button" class="ml-2 btn btn-sm btn-primary">충전</button>
	<button id="" type="button" class="ml-2 btn btn-sm btn-outline-primary">출금</button>
</div>
</div>