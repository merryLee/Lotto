<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 로그인');
$(document).ready(function(){
	
	$("#loginBtn").on('click', function() {
		var id = $("#id").val();
		var pass = $("#pass").val();
		$.get({
			url: '${root}/user/logincheck',
			data: {'id':id, 'pass':pass},
			success: function(data) {
				loginProcess(data);
			},
			error: function() {
				alert('error');
			},
			dataType: 'text'
		});
	});
	
});
function loginProcess(data) {
	if(data == "1") {
		$("#loginForm").attr('action', '${root}/user/login');
		$("#loginForm").submit();
	} else {
		alert("회원정보를 확인해주세요");
	}
}
</script>

<div id="login">

<div class="container py-5">
	<div class="row py-5">
		<div class="col-md-4 offset-md-4">
			<h3 class="text-center text-dark">로그인</h3>
			<div class="border-b my-4"></div>
			<form id="loginForm" name="loginForm" method="post">
				<div class="form-group form-row">
					<label for="inputId" class="col-3 col-form-label col-form-label-sm">아이디</label>
					<div class="col-9">
						<input type="text" class="form-control form-control-sm" id="id" name="id" placeholder="" required="required">
					</div>
				</div>
				<div class="form-group form-row">
					<label for="inputPass" class="col-3 col-form-label col-form-label-sm">비밀번호</label>
					<div class="col-9">
						<input type="password" class="form-control form-control-sm" id="pass" name="pass" required="required">
					</div>
				</div>
				<div class="border-b my-4"></div>
				<div class="form-group form-row mb-0">
					<div class="col-md-12 text-right">
						<input type="button" id="loginBtn" class="btn btn-block btn-primary" value="로그인">
					</div>
				</div>
			</form> <!-- loginForm -->
			<div class="d-flex bd-highlight mb-3">
 				<div class="mr-auto py-2 bd-highlight"><a class="col-form-label-sm text-dark" href="${root}/user/findid" >아이디찾기</a></div>
 				<div class="py-2 bd-highlight"><a class="col-form-label-sm text-dark" href="${root}/user/findpass">비밀번호재설정</a></div>
			</div>
		</div> <!-- col4 -->
	</div>
</div>
</div> <!-- login -->
<%@ include file="/views/common/footer.jsp" %>