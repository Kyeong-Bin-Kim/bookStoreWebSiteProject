<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<c:url var='root' value='/'/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
		.hi{
		    text-align:center;
		   } 
		#hiyo {
			  width: 300px;
			  margin-left: auto;
			  margin-right: auto;
			  }
</style>
</head>
<body bgcolor="WHITE">
<c:import url="/Main/header"></c:import>
<form name="orderlist" id="orderlist" method="post" class="orderlist">
	<br>
	<h1 class="display-5" style="font-family: 'Noto Sans KR', sans-serif;">구매 내역</h1>
	<br>
	<div class="container">
	<c:forEach var="orBean" items="${listOrBean}" varStatus="status">
	<c:if test="${pageCountBean.firstContent <= status.count and status.count <= pageCountBean.lastContent}">
			
 		<table class="table table-hover"> 
		<c:if test="${orBean.or_status ne '0'}">
				<tr style="font-family: 'Noto Sans KR', sans-serif;">
	            	<td width="300">주문번호</td>
	            	<td width="450"><a href="${root}order/Or_select?mb_id=${orBean.mb_id }&or_number=${orBean.or_number }"> ${orBean.or_number }</a></td>
	            </tr> 
	            <tr style="font-family: 'Noto Sans KR', sans-serif;">
					<td>구매날짜</td>
	            	<td>${orBean.or_date }</td>
				</tr>
	            <tr style="font-family: 'Noto Sans KR', sans-serif;">
					<td>송장번호</td>
	            	<td>${orBean.or_delivery }</td>
				</tr>
	            <tr style="font-family: 'Noto Sans KR', sans-serif;">
					<td>배송지</td>
	            	<td>${orBean.dv_address }</td>
				</tr>
				<tr style="font-family: 'Noto Sans KR', sans-serif;">
					<td>배송 상태</td>
	            	<td>${orBean.or_status }</td>
				</tr>
				<tr style="font-family: 'Noto Sans KR', sans-serif;">
					<td><td>
						<button type="button" class="btn btn-dark" style="width: 86px; height: 44px;" onClick="location.href='${root}order/Or_select?mb_id=${orBean.mb_id }&or_number=${orBean.or_number }'">주문 보기</button>
					<c:if test="${orBean.or_status ne '환불'}">
						<button type="button" class="btn btn-dark" style="width: 86px; height: 44px;" onClick="location.href='${root}order/Or_after?mb_id=${orBean.mb_id }&or_number=${orBean.or_number }'">주문 변경</button>
					</c:if>
					</tr>
					</c:if>
		</table>
	</c:if>
	</c:forEach>
	</div>
	<br>
	<!-- 페이지네이션 -->
    		<div class=hi>
            	<ul id="hiyo" class="pagination" style="padding-left:80px;">
					
					<li class="page-item">
						<a href="${root}order/Or_list?mb_id=${mb_id}&page=1" class="page-link">First</a>
					</li>					
														
				<c:forEach var="idx" begin="${pageCountBean.min }" end="${pageCountBean.max }">
					
					<li class="page-item active">
						<a href="${root}order/Or_list?mb_id=${mb_id}&page=${idx}" class="page-link">${idx}</a>
					</li>		
												
				</c:forEach>					
					
					<li class="page-item">
						<a href="${root}order/Or_list?mb_id=${mb_id}&page=${pageCountBean.pageCnt}" class="page-link">Last</a>
					</li>
					
				</ul>
			</div>
</form>
<br>
<c:import url="/Main/footer"></c:import>	
</body>
</html>