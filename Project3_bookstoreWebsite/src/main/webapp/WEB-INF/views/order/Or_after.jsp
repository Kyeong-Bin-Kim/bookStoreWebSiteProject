<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 변경</title>
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
<br>
			<div class="container">
			<h1 class="display-5">주문 변경</h1>
	<br>
<form:form action="${root }Or_afterPro" method="post" modelAttribute="updateOrBean">
	<form:hidden path="mb_id"/>
    <form:hidden path="or_number"/>
	<form:hidden path="mb_name"/>
	<form:hidden path="mb_tel"/>
	<form:hidden path="or_date"/>
	<form:hidden path="or_delivery"/>
	<form:hidden path="or_deliveryCost"/>
	<form:hidden path="dv_name"/>
	<form:hidden path="dv_tel"/>
	<form:hidden path="dv_address"/>
	<form:hidden path="bk_number"/>
	        <table class="table table-hover">
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>주문 번호</td>
	        <td><a href="${root}Or_select?mb_id=${updateOrBean.mb_id }&or_number=${updateOrBean.or_number }">${updateOrBean.or_number }</a></td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>아이디</td>
	        <td>${updateOrBean.mb_id }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">	
			<td>구매자 이름</td>
	        <td>${updateOrBean.mb_name }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>구매자 연락처</td>
	        <td>${updateOrBean.mb_tel }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>배송 상태</td>
	        <td>${updateOrBean.or_status }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>구매날짜</td>
	        <td>${updateOrBean.or_date }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>송장번호</td>
	        <td>${updateOrBean.or_delivery }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>배송비</td>
	        <td><fmt:formatNumber value="${updateOrBean.or_deliveryCost }" pattern="#,###"/>원</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>받는 사람</td>
	        <td>${updateOrBean.dv_name }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>받는 사람 연락처</td>
	        <td>${updateOrBean.dv_tel }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>배송지</td>
	        <td>${updateOrBean.dv_address }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
		<td colspan="2">
    	<form:radiobutton path="or_status" value="교환" label="교환"/>
    	<form:radiobutton path="or_status" value="환불" label="환불"/>
		</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td colspan="2" style="font-family: 'Noto Sans KR', sans-serif;">
    	<form:button class="btn btn-dark" type="submit">주문 변경</form:button>
    	<a href="javascript:window.history.back();" class="btn btn-dark" role="button">뒤로가기</a>
			</td>
    	</tr>
			
	           	 </table>  
	         
</form:form>
</div>
<br>
<c:import url="/Main/footer"></c:import>

</body>
</html>