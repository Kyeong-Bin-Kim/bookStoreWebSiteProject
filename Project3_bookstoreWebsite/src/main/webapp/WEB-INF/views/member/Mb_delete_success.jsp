<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mb_delete_success</title>
</head>
<body>
	<h1>회원정보 삭제(임시삭제) 완료</h1>
	<script type="text/javascript">
	alert("회원탈퇴를 완료 하였습니다. 그동안 성원에 감사드립니다!.")
	location.href="${root}member/Mblogout"
</script>
	
</body>
</html>
