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
		<div class="col-md-6 offset-md-3">
		
			<h3 class="text-center text-dark">로그인</h3>
			<div class="border-b my-4"></div>
			
			<form id="loginForm" name="loginForm" method="post">
		
						<input type="text" class="form-control form-control-sm" id="id" name="id">
						<input type="text" class="form-control form-control-sm" id="pass" name="pass">
						
						<input type="button" id="loginBtn" class="btn btn-sm btn-primary" value="로그인">

			</form> <!-- loginForm -->
		</div>
	</div>
</div>

</div> <!-- login -->
<%@ include file="/views/common/footer.jsp" %>