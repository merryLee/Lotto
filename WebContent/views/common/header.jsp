<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/common/settings.jsp" %>
</head>
<body>
<c:if test="${ninfo == null}"><c:redirect url="/common/setninfo"/></c:if>
<c:set var="ballsrc" value="${root}/resources/img/lottoball/ball_"/> 
<script>
$(document).ready(function(){
   	$.get({
		url: '${root}/common/ninfo',
		data: {'path' : $(location).attr('href')},
		error: function() {
			alert('error');
		}
	});
});
</script>


<div id="header">
	<header class="sticky-top" style="background-color: white;">

		<div id="top-header" class="py-2 text-right border-b">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<c:if test="${userinfo == null}">
						<a href="${root}/user/login" style="margin-right: 20px">로그인</a>
						<a href="${root}/user/join">회원가입</a>
						</c:if>
						<c:if test="${userinfo != null}">
						<span style="margin-right: 20px;">${userinfo.name}님 반갑습니다</span>
						<a href="${root}/user/logout" style="margin-right: 20px">로그아웃</a>
						
							<c:if test="${userinfo.admin == 'N'}">
							<a href="${root}/mypage/myhome">마이페이지</a>
							</c:if>
							<c:if test="${userinfo.admin == 'Y'}">
							<a href="${root}}/mypage/myhome" style="margin-right: 20px">마이페이지</a>
							<a href="${root}/admin/adminhome">관리자페이지</a>
							</c:if>
							
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<nav id="main-header" class="navbar navbar-expand-lg border-b py-2">
			<div class="container">
				<a class="navbar-brand" href="${root}/common/index"> <img
					class="d-inline-block align-top"
					src="${root}/resources/img/mainlogo.png" height="30" alt="">
				</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link" href="${root}/common/index">HOME</a></li>
						<li class="nav-item"><a class="nav-link" href="#">로또정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#">로또구매</a></li>
						<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
					</ul>

					<div class="my-2 my-lg-0">
						<span id="resultno">${ninfo.nanumno}회 추첨번호</span>
						<img id="nimg1" src="${ballsrc}${ninfo.nanum1}.png" height="30" alt="">
						<img id="nimg2" src="${ballsrc}${ninfo.nanum2}.png" height="30" alt="">
						<img id="nimg3" src="${ballsrc}${ninfo.nanum3}.png" height="30" alt="">
						<img id="nimg4" src="${ballsrc}${ninfo.nanum4}.png" height="30" alt="">
						<img id="nimg5" src="${ballsrc}${ninfo.nanum5}.png" height="30" alt="">
						<img id="nimg6" src="${ballsrc}${ninfo.nanum6}.png" height="30" alt="">
 						<i class="fas fa-plus" style="vertical-align: middle;"></i>
						<img id="nimg7" src="${ballsrc}${ninfo.nanum7}.png" height="30" alt="">
					</div>
				</div>

			</div>
		</nav>
	</header>

</div>