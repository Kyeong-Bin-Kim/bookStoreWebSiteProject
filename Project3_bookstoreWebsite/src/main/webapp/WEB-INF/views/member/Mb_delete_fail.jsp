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
		alert("올바른 비밀번호를 입력 해주세요.")
		location.href="${root}member/Mbdelete?mb_id2=${mb_id2}"
	</script>
</body>
</html>