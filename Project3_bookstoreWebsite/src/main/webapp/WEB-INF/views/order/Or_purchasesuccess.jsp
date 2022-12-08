<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<link rel="Stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>책 정보 삭제</title>
</head>
<style>
#lulu {
  display: flex;
 
  align-items: center;
  min-height: 80vh;
}
#suo{
	  margin: 0 auto;
}
.ae1{
text-align:center;
}

</style>
<body>
<%-- <jsp:include page="header.jsp" /> --%>
<div id="lulu" class="jumbotron" style="padding-top:30px; padding-bottom: 30px;">
		<div class="container">
			<h1 style="text-align:center"id="suo" class="display-5">주문이 확정되었습니다.</h1>
			<c:forEach var="orBean" items="${infoOrBean }">
			<h1 style="text-align:center"id="suo" class="display-5">주문번호는 ${orBean.or_number } 입니다.</h1>
			</c:forEach>
				<div>
				<div class="ae1" style="padding-top:20px">
		<button type="button" class="btn btn-success btn-lg" onclick="location.href='${root}order/Or_list?mb_id=${mb_id}'">주문내역</button>
    	<button type="button" class="btn btn-danger btn-lg" onclick="location.href='${root}Main/center'">홈으로</button>
    	</div>
    </div>
			<div style="float:right;" class="find-btn">
</div>
		</div>
		
		</div>
	
		<%-- <jsp:include page="footer.jsp" /> --%>
</body>
</html>