<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div id="header">
	<header class="sticky-top" style="background-color: white;">

		<div id="top-header" class="py-2 text-right border-b">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<span style="margin-right: 20px;">이선민님 반갑습니다</span> <a href="#"
							style="margin-right: 20px">로그인</a> <a href="#">회원가입</a>
					</div>
				</div>
			</div>
		</div>

		<nav id="main-header" class="navbar navbar-expand-lg border-b py-2">
			<div class="container">
				<a class="navbar-brand" href="#"> <img
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
						<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
						<li class="nav-item"><a class="nav-link" href="#">로또정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#">로또구매</a></li>
						<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
					</ul>

					<div class="my-2 my-lg-0">
						<span id="resultno">790회 추첨번호</span>
						<img class=""
							src="${root}/resources/img/lottoball/ball_1.png" height="30"
							alt=""> <img class=""
							src="${root}/resources/img/lottoball/ball_21.png" height="30"
							alt=""> <img class=""
							src="${root}/resources/img/lottoball/ball_24.png" height="30"
							alt=""> <img class=""
							src="${root}/resources/img/lottoball/ball_28.png" height="30"
							alt=""> <img class=""
							src="${root}/resources/img/lottoball/ball_31.png" height="30"
							alt=""> <img class=""
							src="${root}/resources/img/lottoball/ball_44.png" height="30"
							alt="">
							<i class="fas fa-plus" style="vertical-align: middle;"></i>
							<img class=""
							src="${root}/resources/img/lottoball/ball_16.png" height="30"
							alt="">
					</div>
				</div>

			</div>
		</nav>
	</header>

</div>