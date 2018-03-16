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
<div id="join">

<div class="py-5 mx-auto" style="max-width: 1140px;">

	<div class="row py-5">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h2 class="text-dark mb-5 px-3">회원가입</h2>
			<form id="joinForm" name="joinForm" method="post">
			<input type="hidden" name="act" id="act" value="regist">
			
			
			
			

				
				<div class="form-group row px-3">
					<label for="inputId" class="col-sm-2 col-12 col-form-label">아이디</label>
					<div class="col-sm-8 col-8">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="">
					</div>
					
					<div class="col-sm-2 pl-0 col-4">
						<input type="button" class="btn btn-primary" value="중복확인" onclick="javascript:idcheck();">
					</div>
				</div>

				<div class="form-group row px-3">
					<label for="inputName" class="col-sm-2 col-12 col-form-label">이름</label>
					<div class="col-sm-4 col-12">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="">
					</div>
				</div>
				
				<div class="form-group row px-3">
					<label for="inputName" class="col-sm-2 col-12 col-form-label">생년월일</label>
					<div class="col-sm-4 col-12">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="">
					</div>
				</div>
								
				
				
				<div class="form-group row px-3">
				<label for="inputId" class="col-sm-2 col-12 col-form-label"></label>
				<div class="col-sm-8 col-8" id="idckresult"></div>
				</div>
				<div class="form-group row px-3">
					<label for="inputPassword1" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pass" name="pass"
							placeholder="비밀번호를입력해주세요">
					</div>
				</div>
				<div class="form-group row px-3">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="passok" name="passok"
							placeholder="비밀번호를 다시한번입력해주세요">
					</div>
				</div>


				<div class="form-group row align-items-center px-3">
					<label for="inputEmail1" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-3">
						<input type="text" class="form-control mb-2 mb-sm-0"
							id="email1" name="email1" placeholder="">
					</div>
					<div class="col-sm-4">
						<div class="input-group mb-2 mb-sm-0">
							<div class="input-group-addon">@</div>
							<input type="text" class="form-control" id="email2" name="email2"
								placeholder="">
						</div>
					</div>
					<div class="col-sm-3">
						<select id="inputEmailAddress" class="form-control" onchange="javascript:changemail(this);">
							<option selected="selected">직접입력</option>
							<option>kitri.re.kr</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>hanmail.net</option>
						</select>
					</div>
				</div>


				<div class="form-group row px-3">
					<label for="inputTel" class="col-sm-2 col-12 col-form-label">전화번호</label>
					<div class="col-sm-3 col-4">
						<select id="tel1" name="tel1" class="form-control">
							<option selected>010</option>
							<option>011</option>
							<option>02</option>
							<option>031</option>
							<option>033</option>
						</select>
					</div>
					<label class="tellabel text-center px-0 mb-0 align-self-center">-</label>
					<div class="col-sm-3 col-4">
						<input type="text" class="form-control mb-2 mb-sm-0"
							id="tel2" name="tel2" placeholder="">
					</div>
					<label class="tellabel text-center px-0 mb-0 align-self-center">-</label>
					<div class="col-sm-3 col-4">
						<input type="text" class="form-control mb-2 mb-sm-0"
							id="tel3" name="tel3" placeholder="">
					</div>
				</div>


				<div class="form-group row align-items-center px-3">
					<label for="inputAddress" class="col-sm-2 col-form-label">우편주소</label>
					<div class="col-sm-4 col-8">
						<label class="sr-only" for="inputZipcode">zipcode</label>
						<input type="text" class="form-control mb-2 mb-sm-0" id="zip1" name="zip1"
							placeholder="" readonly>
					</div>
					<div class="col-sm-2 pl-0 col-4 align-self-center">
						<input type="button" class="btn btn-primary" value="주소검색" onclick="javascript:zipsearch();">
					</div>
				</div>

				<div class="form-group row px-3">
					<label for="inputAddress2" class="col-sm-2 col-form-label">상세주소</label>
					<div class="col-sm-4">
						<div class="input-group mb-2 mb-sm-0">
							<input type="text" class="form-control" id="addr1" name="addr1"
								placeholder="" readonly>
						</div>
					</div>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="addr2" name="addr2"
							placeholder="">
					</div>
				</div>

				<div class="border-b mb-2 px-3"></div>

				<div class="px-3 py-3">
					<input type="button" class="btn btn-lg btn-block btn-primary" onclick="javascript:register();" value="회원가입">
				
				</div>
			</form>
		</div>
	</div>

</div>



</div>
<jsp:include page="/views/common/footer.jsp"></jsp:include>
<jsp:include page="/views/common/optional.jsp"></jsp:include>
  </body>
</html>