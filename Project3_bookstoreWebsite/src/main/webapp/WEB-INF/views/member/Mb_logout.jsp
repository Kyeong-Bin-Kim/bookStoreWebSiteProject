<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mb_logout</title>
</head>
<body>
	<% session.setAttribute("mb_id","0"); %>
	<script type="text/javascript">
		alert("로그아웃이 되었습니다.")
		location.href='${root}Main/center'
	</script>
</body>
</html>