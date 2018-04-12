<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 비밀번호재설정');
$(document).ready(function() {
	$("#findPassBtn").on('click', function() {
		$("#findPassForm").attr('action', '${root}/user/findpass');
		$("#findPassForm").submit();
	});
});
</script>
<div id="findpass">

<div class="container py-5">
	<div class="row py-5">
		<div class="col-md-4 offset-md-4">
			<h3 class="text-center text-dark">비밀번호 재설정</h3>
			<div class="border-b my-4"></div>
			
			<form id="findPassForm" name="findPassForm" method="post">
			
				<div class="form-group form-row">
					<label for="inputId" class="col-3 col-form-label col-form-label-sm">아이디</label>
					<div class="col-9">
						<input type="text" class="form-control form-control-sm" id="id" name="mid" placeholder="" required="required">
					</div>
				</div>
			
				<div class="form-group form-row">
					<label for="inputName" class="col-3 col-form-label col-form-label-sm">이름</label>
					<div class="col-9">
						<input type="text" class="form-control form-control-sm"	id="name" name="name" placeholder="" maxlength="10" required="required">
					</div>
				</div>
				
				<div class="form-group form-row">
					<label for="inputTel" class="col-3 col-form-label col-form-label-sm">전화번호</label>
					<div class="col-3">
						<select id="tel1" name="tel1" class="form-control form-control-sm">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="col-3">
						<input type="text" class="form-control form-control-sm" id="tel2" name="tel2" placeholder="" maxlength="4" required="required">
					</div>
					<div class="col-3">
						<input type="text" class="form-control form-control-sm" id="tel3" name="tel3" placeholder="" maxlength="4" required="required">
					</div>
				</div>
				
				<div class="border-b my-4"></div>
				<div class="form-group form-row mb-0">
					<div class="col-md-12 text-right">
						<input type="button" id="findPassBtn" class="btn btn-block btn-primary" value="임시 비밀번호 발송">
					</div>
				</div>
			</form> <!-- findPassForm -->
			<div class="d-flex bd-highlight mb-3">
 				<div class="mr-auto py-2 bd-highlight"><a class="col-form-label-sm text-dark" href="${root}/user/login" >로그인</a></div>
 				<div class="py-2 bd-highlight"><a class="col-form-label-sm text-dark" href="${root}/user/findid">아이디찾기</a></div>
			</div>
		</div> <!-- col4 -->
	</div>
</div>
</div> <!-- findpass -->
<%@ include file="/views/common/footer.jsp" %>