<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<script>
$(document).attr('title', 'O Lotto - 아이디찾기');

$(document).ready(function(){

	$("#mvlogin").on('click', function() {
		$(location).attr('href', '${root}/user/login');
    });
    
});
</script>

<div id="findid-ok">

	<div class="container py-5">
		<div class="row py-5">
			<div class="col-md-6 offset-md-3 py-5 text-center">
				
				<img class="mb-3" src="${root}/resources/img/logo.png" height="48" alt="">
			
				<h3 class="text-center text-dark mb-5">문의하신 아이디는<br/>${fid} 입니다.</h3>
				
				<input type="button" id="mvlogin" class="btn btn-primary my-5" onclick="" value="로그인">
			</div>
		</div>
	</div>
	
</div>

<%@ include file="/views/common/footer.jsp"%>