<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<c:url var='root' value='/'/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
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
<body>
<c:import url="/Main/header"></c:import>

<form name="orderdetail" id="orderdetail" method="post" class="orderdetail">
	<br>
	<h1 class="display-5" style="font-family: 'Noto Sans KR', sans-serif;">구매 정보</h1>
	<br>
	<div class="container">
	<c:forEach var="orBean" items="${infoOrBean}" varStatus="status">
	        
	        
	        <table class="table table-hover">
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>주문 번호</td>
	        <td>${orBean.or_number }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>아이디</td>
	        <td>${orBean.mb_id }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">	
			<td>구매자 이름</td>
	        <td>${orBean.mb_name }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>구매자 연락처</td>
	        <td>${orBean.mb_tel }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>배송 상태</td>
	        <td>${orBean.or_status }</td>
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
			<td>배송비</td>
	        <td><fmt:formatNumber value="${orBean.or_deliveryCost }" pattern="#,###"/>원</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>총 구매 가격</td>
			<td><fmt:formatNumber value="${allprice + orBean.or_deliveryCost }" pattern="#,###"/>원</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>받는 사람</td>
	        <td>${orBean.dv_name }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>받는 사람 연락처</td>
	        <td>${orBean.dv_tel }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>배송지</td>
	        <td>${orBean.dv_address }</td>
		</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>
			<button type="button" class="btn btn-dark" style="width: 86px; height: 44px;" onClick="location.href='${root}order/Or_list?mb_id=${orBean.mb_id }'">주문 목록</button>
			</td>
			<td>
			<c:if test="${orBean.or_status ne '환불'}">
			<button type="button" class="btn btn-dark" style="width: 86px; height: 44px;" onClick="location.href='${root}order/Or_after?mb_id=${orBean.mb_id }&or_number=${orBean.or_number }'">주문 변경</button>
			</c:if>
			</td>
			<c:if test="${mb_id eq 'admin' }">
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td>
			<button type="button" class="btn btn-dark" style="width: 128px; height: 44px;" onClick="location.href='${root}order/Or_alllist'">주문 전체 목록</button>
			</td>
			<td>
			</td>
			
			</tr>
			</c:if>
    	</tr>
			
	           	 </table>         
	           	 
	           	 <c:set var= "or_num" value="${orBean.or_number}"/>
    </c:forEach>
    </div>
    <br>
    <h3 style="font-family: 'Noto Sans KR', sans-serif;">주문 품목</h3>
    <br>
    <div class="container">
    <c:forEach var="oriBean" items="${itemsOrBean }" varStatus="status">
    <div class="container">
    <table class="table table-hover">
    
    	<%-- <tr>
    		<td>주문 번호</td>
	        <td>${oriBean.or_number }</td>
    	</tr> --%>
		<%-- <tr>
    		<td>책 번호</td>
	        <td>${oriBean.bk_number }</td>
		</tr> --%>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
			<td rowspan="5"><div class="img" style="width: 170px; height: 220px; padding-left: 180px;"><img src="${pageContext.request.contextPath}/upload/${oriBean.bk_image }" style="width: 170px; height: 220px;"></div></td>
	        <td colspan="2"><a href="${root}book/Bk_select?bk_number=${oriBean.bk_number }">${oriBean.bk_title }</a></td>
    	</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
    		<td>책 가격</td>
	        <td><fmt:formatNumber value="${oriBean.bk_price }" pattern="#,###"/>원</td>
    	</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
    		<td>할인율</td>
	        <td>${oriBean.ori_bkdiscount }</td>
    	</tr>
		<tr style="font-family: 'Noto Sans KR', sans-serif;">
    		<td>구매 개수</td>
	    	<td>${oriBean.ori_bkcount }개</td>
    	</tr>
    	<tr style="font-family: 'Noto Sans KR', sans-serif;">
    		<td>구매 가격</td>
    		<c:set var= "sumprice" value="${oriBean.bk_price * oriBean.ori_bkcount}"/>
	    	<td><fmt:formatNumber value="${sumprice }" pattern="#,###"/>원</td>
    	</tr>
    </table>
    </div>
    </c:forEach>
    </div>
    
    <!-- 페이지네이션 -->
    		<div class=hi>
            	<ul id="hiyo" class="pagination" style="padding-left:90px;">
					
					<li class="page-item">
						<a href="${root}order/Or_select?mb_id=${mb_id}&or_number=${or_num }&page=1" class="page-link">First</a>
					</li>					
														
				<c:forEach var="idx" begin="${pageCountBean.min }" end="${pageCountBean.max }">
					
					<li class="page-item active">
						<a href="${root}order/Or_select?mb_id=${mb_id}&or_number=${or_num }&page=${idx}" class="page-link">${idx}</a>
					</li>		
												
				</c:forEach>					
					
					<li class="page-item">
						<a href="${root}order/Or_select?mb_id=${mb_id}&or_number=${or_num }&page=${pageCountBean.pageCnt}" class="page-link">Last</a>
					</li>
					
				</ul>
			</div>
		</form>
<br>
<c:import url="/Main/footer"></c:import>
</body>
</html>