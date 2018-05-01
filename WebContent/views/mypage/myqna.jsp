<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 마이페이지');
$(document).ready(function(){

});
</script>

<div id="myqna">

<%@ include file="/views/mypage/myinfo.jsp" %>

<div id="mymenu" class="py-5">

<div id="my_nav" class="">
	<div class="container py-5">
		<div class="d-flex justify-content-center text-center">
			<div id="my_tab1" class="p-2 mx-4 my_nav_inner text-dark"><a href="${root}/mypage/mylotto" style="color: inherit;">마이 로또</a></div>
			<div id="my_tab2" class="p-2 mx-4 my_nav_inner text-dark"><a href="${root}/mypage/mypoint" style="color: inherit;">포인트 내역</a></div>
			<div id="my_tab3" class="p-2 mx-4 my_nav_inner text-dark active"><a href="${root}/mypage/myqna" style="color: inherit;">1:1 문의</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div> <!-- my_nav -->


<div id="my_content">

<div class="container">
	<div class="table-responsive-md">
	<table class="table table-hover text-center">
	  <thead class="thead-light">
	    <tr>
	      <th scope="col">회차</th>
	      <th scope="col">주문번호</th>
	      <th scope="col">로또번호</th>
	      <th scope="col">구매일시</th>
	      <th scope="col">진행상태</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21 오전 9시 20분</td>
	      <td><a href="#" class="text-dark">구매완료</a></td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매중</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	    <tr>
	      <th scope="row">803회</th>
	      <td>0000000001</td>      
	      <td>13 23 29 32 38 40</td>
	      <td>2018/04/21</td>
	      <td class="text-muted">구매신청</td>
	    </tr>
	  </tbody>
	</table>
	</div> <!-- table-responsive -->
</div> <!-- container -->
</div> <!-- my_content -->
</div> <!-- mymenu -->

<div class="py-5"></div>
</div> <!-- myqna -->

<%@ include file="/views/common/footer.jsp" %>