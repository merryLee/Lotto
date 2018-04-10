<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<script>
$(document).attr('title', 'O Lotto - 회원가입');

$(document).ready(function(){

	$("#mvjoin").on('click', function() {
		$(location).attr('href', '${root}/user/join');
    });
    
});
</script>

<div id="joinfail">

	<div class="container py-5">
		<div class="row py-5">
			<div class="col-md-6 offset-md-3 py-5 text-center">
				
				<img class="mb-3" src="${root}/resources/img/logo.png" height="48" alt="">
			
				<h3 class="text-center text-dark mb-5">회원가입에 실패했습니다.</h3>
				
				<input type="button" id="mvjoin" class="btn btn-primary my-5" onclick="" value="재시도">
			</div>
		</div>
	</div>
	
</div>

<%@ include file="/views/common/footer.jsp"%>