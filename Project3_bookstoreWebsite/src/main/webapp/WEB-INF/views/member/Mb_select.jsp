<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var='root' value='/' />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Mb_select</title>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 정보 보기 화면 - 마이페이지</title>
  <script src="https://kit.fontawesome.com/ece1cdce53.js"></script>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@900&display=swap" rel="stylesheet">
<style>
    body {
      min-height: 100vh;
		background-color:#F3E8EB;
      
    }

    .input-form {
      max-width: 1000px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    h4{
    text-align :center;
    }
     h2{
    text-align :center;
    }
  </style>
</head>
<body>
<div class="container" align="center">
	<div class="input-form col-md-12 mx-auto">	
      <a href="#" onclick="location.href='${root}Main/center'" style="font-size:30px; font-family:'Frank Ruhl Libre', serif;">
		Ezen Book Store</a> 
		
        <br>
        	<h4 class="mb-3" style="font-family: 'Noto Sans KR', sans-serif;">회원 정보 보기 화면 - 마이 페이지</h4>
						<div class="form-group" style="font-family: 'Noto Sans KR', sans-serif;">
						<label for="mb_id">아이디</label>
						<input type="text" id="mb_id" name="mb_id" class="form-control" value="${mbBean.mb_id }" disabled="disabled"/>
						</div>
						<div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
						<label for="mb_name">이름</label>
						<input type="text" id="mb_name" name="mb_name" class="form-control" value="${mbBean.mb_name }" disabled="disabled"/>
						</div>
						<div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
						<label for="mb_email">이메일</label>
						<input type="text" id="mb_email" name="mb_email" class="form-control" value="${mbBean.mb_email }" disabled="disabled"/>
						</div>
						<div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
						<label for="mb_tel">연락처</label>
						<input type="text" id="mb_tel" name="mb_tel" class="form-control" value="${mbBean.mb_tel }" disabled="disabled"/>
						</div>
						<div class="mb-4"></div>
         				<button class="btn btn-info" onclick="location.href='${root }member/Mbupdate?mb_id2=${mbBean.mb_id }'" style="font-family: 'Noto Sans KR', sans-serif;">정보수정</button>
         				<button class="btn btn-dark" onclick="location.href='Mbdelete?mb_id2=${mbBean.mb_id }'" style="font-family: 'Noto Sans KR', sans-serif;">회원탈퇴</button>
         				<a href="${root }Main/center" class="btn btn-danger" style="font-family: 'Noto Sans KR', sans-serif;">메인화면</a>
					
					<c:import url="/delivery/DvList">
							
					</c:import>
		</div>	
	</div>
</body>
</html>