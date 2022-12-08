<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mb_login_success</title>
</head>
<body>
	<script type="text/javascript">
		alert("로그인을 성공 하였습니다.")
		location.href="${root}Main/center"
	</script>
</body>
</html>