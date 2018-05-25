<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 마이페이지');
$(document).ready(function(){

});
</script>

<div id="mylotto">

<%@ include file="/views/mypage/myinfo.jsp" %>

<div id="mymenu" class="py-5">

<div id="my_nav" class="">
	<div class="container py-5">
		<div class="d-flex justify-content-center text-center">
			<div id="my_tab1" class="p-2 mx-4 my_nav_inner text-dark active"><a href="${root}/mypage/mylotto" style="color: inherit;">마이 로또</a></div>
			<div id="my_tab2" class="p-2 mx-4 my_nav_inner text-dark"><a href="${root}/mypage/mypoint" style="color: inherit;">포인트 내역</a></div>
			<div id="my_tab3" class="p-2 mx-4 my_nav_inner text-dark"><a href="${root}/mypage/myqna" style="color: inherit;">1:1 문의</a></div>
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

<c:forEach varStatus="i" var="article" items="${articles}">	  
	    <tr>
	      <th scope="row">${article.lottono}회</th>
	      <td>${article.order_no}</td>
	      <td>${article.lnum1} ${article.lnum2} ${article.lnum3} ${article.lnum4} ${article.lnum5} ${article.lnum6}</td>
	      <td>${article.date}</td>
	<c:choose>	   
		<c:when test="${article.code == '구매신청'}"><td><a href="#" class="text-dark">${article.code}</a></td></c:when>
		<c:when test="${article.code == '구매중'}"><td class="text-muted">${article.code}</td></c:when>
		<c:when test="${article.code == '구매완료'}"><td><a href="#" class="text-dark">${article.code}</a></td></c:when>
		<c:when test="${article.code == '취소'}"><td class="text-muted">${article.code}</td></c:when>
		<c:otherwise><td class="text-muted">오류</td></c:otherwise>
	</c:choose>   
	    </tr>
</c:forEach>
	  </tbody>
	</table>
	</div> <!-- table-responsive -->

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&lt;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&gt;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>

---${navigator.navigator}


</div> <!-- container -->
</div> <!-- my_content -->
</div> <!-- mymenu -->

<div class="py-5"></div>
</div> <!-- mylotto -->

<%@ include file="/views/common/footer.jsp" %>