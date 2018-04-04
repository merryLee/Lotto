<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/views/common/settings.jsp"></jsp:include>
<title>O Lotto - 회원가입</title>
</head>
<body>
	<jsp:include page="/views/common/header.jsp"></jsp:include>
	
<!-- joinForm
아이디 id, 이름 name, 생년월일 birth, 비밀번호pass, 비밀번호확인passok, 이메일아이디email1, 이메일주소email2, 이메일선택selectEmail
전화번호 (select)tel1, tel2, tel3, 우편번호zip, 상세주소addr1, 상세주소addr2
 -->
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){

	$("#idcheck").on('click', function() {
/* 		window.open("${root}/user?act=mvidck", "아이디 중복검사", "width=600,height=350,top=200,left=200,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=no"); */
		window.open("${root}/lotto/views/join/idcheck.jsp", "아이디 중복검사", "width=500,height=500,top=200,left=200,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=no");
	});
	
	var passReg = /^[A-Za-z0-9]{10,20}$/;
	var passFlag = false;
    $("#pass").on('keyup', function(){
    	var text = $(this).val();
    	var checkNum = (/[0-9]/).test(text);
    	var checkCh = (/[a-z]/i).test(text);
    	if (passReg.test(text) && checkNum && checkCh) {
        	$("#pwHelp").text('사용가능');
        	$("#pwHelp").removeClass('invalid-color');
       		$("#pwHelp").addClass('valid-color');
       		passFlag = true;
		} else {
       		$("#pwHelp").text('사용불가');
       		$("#pwHelp").removeClass('valid-color');
       		$("#pwHelp").addClass('invalid-color');
       		passFlag = false;
		}
	});
    $("#passok").on('keyup', function(){
    	if ($("#pass").val() == $("#passok").val()) {
        	$("#pwValid").text('일치');
        	$("#pwValid").removeClass('invalid-color');
       		$("#pwValid").addClass('valid-color');
		} else {
       		$("#pwValid").text('불일치');
       		$("#pwValid").removeClass('valid-color');
       		$("#pwValid").addClass('invalid-color');
		}
	});
	
	$(".datepic").datepicker({
		altFormat:"yy-mm-dd",
		altField: "#birth"
	});
	
	$("#selectEmail").on('change', function() {
 		$("#email2").val($(this).val());
	});
	
	$("#zipsearch").on('click', function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
                $("#zip").val(data.zonecode); //새우편번호
                $("#addr1").val(data.roadAddress); //도로명주소
			 	$("#addr2").focus();
	        }
	    }).open();
    });
	
	$("#register").on('click', function() {
		if($("#id").val() == "") {
			alert("아이디를 확인하세요!");
			return;
		} else if($("#birth").val() == "") {
			alert("생년월일을 확인하세요!");
			return;
		} else if($("#pass").val() == "" || passFlag == false) {
			alert("비밀번호를 다시입력하세요!");
			return;
		} else if($("#pass").val() != $("#passok").val()) {
			alert("비밀번호를 확인하세요!");
			return;
		} else if($("#zip").val() == "") {
			alert("우편번호를 확인하세요!");
			return;
		} else if($("#addr1").val() == "") {
			alert("주소를 확인하세요!");
			return;
		} else {
			alert("정상");
/* 			document.memberform.action = "${root}/user/join.kitri";
			document.memberform.submit(); */
		}
	});
    
});
</script>

	<div id="join">

		<div class="container py-5">
			<div class="row py-5">
				<div class="col-md-6 offset-md-3">
					<h3 class="text-center text-dark">회원가입</h3>
					<div class="border-b my-4"></div>

					<form id="joinForm" name="joinForm" method="post">
						<input type="hidden" name="act" id="act" value="">

						<div class="form-group form-row">
							<label for="inputId" class="col-sm-2 col-form-label col-form-label-sm">아이디</label>
							<div class="col-sm-6 col-9">
								<input type="text" class="form-control form-control-sm" id="id" placeholder="" required="required" readonly>
							</div>
							<div class="col-sm-2 col-3 ">
								<input type="button" id="idcheck" class="btn btn-sm btn-dark" value="중복확인" onclick="">
							</div>
						</div>

						<div class="form-group form-row">
							<label for="inputName" class="col-sm-2 col-form-label col-form-label-sm">이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control form-control-sm"	id="name" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group form-row">
							<label for="inputName" class="col-sm-2 col-form-label col-form-label-sm">생년월일</label>
							<div class="col-sm-6">
								<input type="text" class="datepic form-control form-control-sm"	id="birth" placeholder="" required="required" readonly>
							</div>
						</div>

						<div class="form-group form-row">
							<label for="inputPassword1" class="col-sm-2 col-form-label col-form-label-sm">비밀번호</label>
							<div class="col-sm-6">
								<input type="password" class="form-control form-control-sm" id="pass" placeholder="10-20자리 영문, 숫자 조합" required="required">
							</div>
							<small id="pwHelp" class="col-sm-4 align-self-center"></small>
						</div>
						
						<div class="form-group form-row">
							<label for="inputPassword2" class="col-sm-2 col-form-label col-form-label-sm">비밀번호확인</label>
							<div class="col-sm-6 align-self-center">
								<input type="password" class="form-control form-control-sm" id="passok" placeholder="비밀번호를 재입력해주세요" required="required">
							</div>
							<small id="pwValid" class="col-sm-4 align-self-center"></small>
						</div>

						<div class="form-group form-row align-items-center">
							<label for="inputEmail" class="col-sm-2 col-12 col-form-label col-form-label-sm">이메일</label>
							<div class="col-sm-2 col-4">
								<input type="text"class="form-control form-control-sm" id="email1" placeholder="" required="required">
							</div>
							<div class="col-sm-4 col-4">
								<div class="input-group input-group-sm">
      							  	<div class="input-group-prepend">
      							    	<span class="input-group-text" id="inputGroupPrepend">@</span>
      							 	</div>
									<input type="text" class="form-control form-control-sm"	id="email2" placeholder="" required="required">
								</div>
							</div>
							<div class="col-sm-3 col-4">
								<select id="selectEmail" class="form-control form-control-sm" onchange="">
									<option value="" selected="selected">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
							</div>
						</div>

						<div class="form-group form-row">
							<label for="inputTel" class="col-sm-2 col-12 col-form-label col-form-label-sm">전화번호</label>
							<div class="col-sm-2 col-4">
								<select id="tel1" name="tel1" class="form-control form-control-sm">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<div class="col-sm-2 col-4">
								<input type="text" class="form-control form-control-sm" id="tel2" placeholder="" required="required">
							</div>
							<div class="col-sm-2 col-4">
								<input type="text" class="form-control form-control-sm" id="tel3" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group form-row">
							<label for="inputAddress" class="col-sm-2 col-form-label col-form-label-sm">우편번호</label>
							<div class="col-sm-4 col-9">
								<input type="text" class="form-control form-control-sm"	id="zip" placeholder="" readonly required="required">
							</div>
							<div class="col-sm-2 col-3 ">
								<input type="button" id="zipsearch" class="btn btn-sm btn-dark" value="주소검색" onclick="">
							</div>
						</div>

						<div class="form-group form-row">
							<label for="inputAddress2" class="col-sm-2 col-form-label col-form-label-sm">상세주소</label>
							<div class="col-sm-4">
								<div class="input-group">
									<input type="text" class="form-control form-control-sm" id="addr1" placeholder="" readonly required="required">
								</div>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control form-control-sm"	id="addr2" placeholder="" required="required">
							</div>
						</div>

						<div class="border-b my-4"></div>
						
						<div class="form-group form-row">
							<div class="col-md-12 text-right">
								<input type="button" id="register" class="btn btn-primary" onclick="" value="회원가입">
							</div>
						</div>
					</form> <!-- joinForm -->
				</div>
			</div>
		</div>

	</div> <!-- join -->
	<jsp:include page="/views/common/footer.jsp"></jsp:include>
	<jsp:include page="/views/common/optional.jsp"></jsp:include>
</body>
</html>