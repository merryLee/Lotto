<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 아이디찾기');
$(document).ready(function() {
	
	$(".datepic").datepicker({
		altFormat:"yy-mm-dd",
		altField: "#birth",
		changeYear: "true",
		changeMonth: "true",
		yearRange: "-100:+0"
	});
	
	$("#findIdBtn").on('click', function() {
		$("#findIdForm").attr('action', '${root}/user/findid');
		$("#findIdForm").submit();
	});
	
});
</script>
<div id="findid">

<div class="container py-5">
	<div class="row py-5">
		<div class="col-md-4 offset-md-4">
			<h3 class="text-center text-dark">아이디찾기</h3>
			<div class="border-b my-4"></div>
			
			<form id="findIdForm" name="findIdForm" method="post">
			
				<div class="form-group form-row">
					<label for="inputName" class="col-3 col-form-label col-form-label-sm">이름</label>
					<div class="col-9">
						<input type="text" class="form-control form-control-sm"	id="name" name="name" placeholder="" maxlength="10" required="required">
					</div>
				</div>

				<div class="form-group form-row">
					<label for="inputName" class="col-3 col-form-label col-form-label-sm">생년월일</label>
					<div class="col-9">
						<input type="text" class="datepic form-control form-control-sm"	id="birth" name="birthdate" placeholder="" required="required" readonly>
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
						<input type="button" id="findIdBtn" class="btn btn-block btn-primary" value="찾기">
					</div>
				</div>
				
			</form> <!-- findIdForm -->
			<div class="d-flex bd-highlight mb-3">
 				<div class="mr-auto py-2 bd-highlight"><a class="col-form-label-sm text-dark" href="${root}/user/login" >로그인</a></div>
 				<div class="py-2 bd-highlight"><a class="col-form-label-sm text-dark" href="${root}/user/findpass">비밀번호재설정</a></div>
			</div>
		</div> <!-- col4 -->
	</div>
</div>
</div> <!-- findid -->
<%@ include file="/views/common/footer.jsp" %>