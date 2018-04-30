<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
$(document).attr('title', 'O Lotto - 마이페이지');
$(document).ready(function(){

	var balance = ${userinfo.balance};
	$("#balance").text(balance.toLocaleString());
	
	$("#chargeBtn").on('click', function() {
		window.open("${root}/mypage/charge", "포인트 충전", "width=360,height=545,top=100,left=100,location=no,status=no,titlebar=no,toolbar=no,resizable=no,scrollbars=no");
	});
	
});
</script>

<div id="myhome">

<div id="myinfo" class="py-5 bg-dark text-white">
<div class="container">
	<h4>마이페이지</h4>
	<div style="margin-bottom: .5rem;">
	<span id="myname"><strong>${userinfo.name}</strong>님</span>
	<span><a href="#" style="color: inherit;"><i class="fas fa-cog"></i>&nbsp;회원정보수정</a></span>
	</div>
	<span style="vertical-align: middle;">로또포인트&nbsp;<strong id="balance"></strong>&nbsp;원</span>
	<button id="chargeBtn" type="button" class="ml-2 btn btn-sm btn-primary">충전</button>
	<button id="" type="button" class="ml-2 btn btn-sm btn-outline-primary">출금</button>
</div>
</div>

<div id="" class="py-5">
<div id="my_nav" class="">
	<div class="container py-5">
		<div class="d-flex justify-content-center">
			<div id="my_tab1" class="p-2 mx-4 my_nav_inner text-dark active"><a href="" style="color: inherit;">마이 로또</a></div>
			<div id="my_tab2" class="p-2 mx-4 my_nav_inner text-dark"><a href="" style="color: inherit;">포인트 내역</a></div>
			<div id="my_tab3" class="p-2 mx-4 my_nav_inner text-dark"><a href="" style="color: inherit;">1:1 문의</a></div>
		</div>
		<div class="border-b p-0"></div>
	</div>
</div>


<div id="" class="">
	<div class="container">
<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
</div>
</div>
</div>

<div class="py-5"></div>
</div> <!-- myhome -->

<%@ include file="/views/common/footer.jsp" %>