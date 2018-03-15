<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div id="header">
<header class="sticky-top" style="background-color: white;">
	<div id="top-header" class="py-2 text-right border-b">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span style="margin-right: 20px;">이선민님</span>
					<a href="#"	style="margin-right: 20px">포인트 : 0원</a>
					<a href="#"	style="margin-right: 20px">로그인</a>
					<a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<nav id="main-header" class="navbar navbar-expand-md border-b">
		<div class="container py-2">
			<a class="navbar-brand" href="#"> <img class="d-block"
				src="${root}/resources/img/mainlogo.png" style="height: 30px;"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item mx-1"><a class="nav-link" href="#">HOME</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#">로또정보</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#">로또구매</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#">공지사항</a></li>
				</ul>
			</div>
			
		</div>
	</nav>
</header>

</div>