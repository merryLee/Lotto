<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/common/settings.jsp" %>
</head>
<body>
<script>
$(document).attr('title', 'O Lotto - 아이디 검사하기');
$(document).ready(function(){

	var idFlag = false;
	var checkedId;

	$("#idsearch").on('click', function(e) {
		var id = $("#id").val();
		var idReg = /^[A-Za-z0-9]{6,20}$/;
		if(idReg.test(id)) {
			$.get({
				url: '${root}/user/idcheck',
				data: {'id' : id},
				success: function(data) {
					checkResult(data);
				},
				error: function() {
					alert('error');
				},
				dataType: 'json'
			});
		} else {
			$("#idHelp").text('아이디는 6자-20자 영문, 숫자만 사용가능합니다.');
			idFlag = false;
			checkedId = '';
		}
	});
	
	function checkResult(data) {
		if(!data.idcount) {
			$("#idHelp").text(data.id.toUpperCase()+' 아이디는 사용가능합니다.');
			idFlag = true;
			checkedId = data.id.toUpperCase();
		} else {
			$("#idHelp").text(data.id.toUpperCase()+' 아이디는 사용할 수 없습니다.');
			idFlag = false; 
			checkedId = '';
		}
	}
	
	$("#use").on('click', function() {
		if(idFlag) {
			$("#id", opener.document).val(checkedId);
			checkedId = '';
			self.close();
		}
	});
});
</script>

<div id="idcheck">

	<header class="sticky-top" style="background-color: white;">
		<nav class="navbar navbar-expand-md border-b">
			<div class="container">
				<img class="" src="${root}/resources/img/mainlogo.png" style="height: 26px;">
			</div>
		</nav>
	</header>

	<div class="container py-5">
	<div class="row py-3 text-center">

		<div class="col-10 offset-1">
	
	<form name="idckform" method="get" action="" onsubmit="return false;">
		<input type="hidden" id="act" name="act" value="idcheck">	

		<h3 class="text-dark" align="center">아이디검색</h3>
		<h6 align="center">사용하실 아이디를 입력하세요</h6>
	
		<div class="form-group form-row my-4">		
			<div class="col-9">		
				<input type="text" class="form-control form-control-sm" id="id" placeholder="">
			</div>
			<div class="col-3">
				<input type="button" id="idsearch" class="btn btn-sm btn-dark" value="중복검사">
			</div>
		</div>
		<div class="form-group form-row">	
			<div class="col-12">
				<small id="idHelp">아이디는 6자-20자 영문, 숫자만 사용가능합니다.</small>
			</div>
		</div>
			
		<div class="border-b my-4"></div>
					
		<div class="form-group form-row mb-0">
			<div class="col-12 text-center">
				<input type="button" id="use" class="btn btn-sm btn-primary" value="사용하기" onclick="">
			</div>
		</div>

	</form>
	
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

	</div> <!-- idcheck -->
	<jsp:include page="/views/common/optional.jsp"></jsp:include>
</body>
</html>