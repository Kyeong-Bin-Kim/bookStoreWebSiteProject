<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mb_login_fail</title>
</head>
<body>
	<script type="text/javascript">
		alert("로그인을 실패 하였습니다.\n아이디와 비밀번호를 확인해주십시오.")
		location.href="${root}member/Mblogin"
	</script>
</body>
</html>