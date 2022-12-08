<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mb_insert_success</title>
</head>
<body>
	<h1>회원가입 완료</h1>
	<script type="text/javascript">
		alert("회원 가입이 정상적으로 완료되었습니다.")
		location.href="${root}Main/center"
	</script>
</body>
</html>