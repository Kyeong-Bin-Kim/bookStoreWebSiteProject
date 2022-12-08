<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var='root' value='/' />
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Mb_login</title>
<style>
    body {
      min-height: 100vh;
      text-align: center;
      margin-top:20px;

      
    }
    </style>
<!-- Bootstrap CDN -->
</head>
<body style="margin-top:200px;">
	<a href="${root}Main/center" class="navbar-brand" style="font-family: 'Frank Ruhl Libre', serif; font-size:35px"><span class="material-symbols-outlined" style="font-size:36px; vertical-align: middle;">menu_book</span>Ezen Book Store</a>
	<br>
	<div class="container" style="margin-top: 20px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						
						<form:form action="${root }member/Mbloginpro" method="post"
							modelAttribute="tempMbBean">
							<h2 class="mb-3" style="font-family: 'Noto Sans KR', sans-serif;">로그인</h2>
							<hr>
							<div class="form-group" style="font-family: 'Noto Sans KR', sans-serif;">
								<form:label path="mb_id">아이디</form:label>
								<form:input path="mb_id" class="form-control" />
								<form:errors path="mb_id" style="color:red"></form:errors>
							</div>
							<div class="form-group" style="font-family: 'Noto Sans KR', sans-serif;">
								<form:label path="mb_pw">비밀번호</form:label>
								<form:input type="password" path="mb_pw" class="form-control" />
								<form:errors path="mb_pw" style="color:red"></form:errors>
							</div>
							<div class="form-group text-right" style="font-family: 'Noto Sans KR', sans-serif;">
								<form:button type="submit" class="btn btn-primary">로그인</form:button>
								<a href="${root }member/Mbinsert" class="btn btn-primary">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

</body>
</html>

