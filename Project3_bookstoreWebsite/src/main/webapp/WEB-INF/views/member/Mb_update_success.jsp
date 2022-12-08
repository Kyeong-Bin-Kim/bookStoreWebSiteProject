<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mb_update_success</title>
</head>
<body>
	<h1>회원정보 수정 완료</h1>
	<script type="text/javascript">
		alert("회원정보 수정을 성공 하였습니다!.")
		location.href="${root}Main/center"
	</script>
</body>
</html>