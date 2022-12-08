<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<c:url var='root' value='/'/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<title>배송지 수정</title>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@900&display=swap" rel="stylesheet">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <style>
    body {
      min-height: 100vh;
background-color:#F3E8EB;
text-aling:center;
      
    }

    .input-form {
      max-width: 680px;

      margin-top: 50px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    button{
    text-align:center;
    display:block;
    margin:auto;
    }
 h4{
 text-align:center;
 }
 .hi{
 text-align:center;
 }
  </style>
</head>

<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<body>
 <div class="input-form-backgroud row" align="center">
      <div class="input-form col-md-12 mx-auto">
     <a href="#" onclick="location.href='${root}Main/center'" style="font-size:30px; font-family:'Frank Ruhl Libre', serif;">
		Ezen Book Store</a> 
              <h4 class="mb-3" style="font-family: 'Noto Sans KR', sans-serif;">배송지 수정</h4>
	<form:form action="${root }delivery/DvUpdatePro" method="post" modelAttribute="UpdateDvBean">
		<form:hidden path="mb_id"/>
		<form:hidden path="dv_pk"/>
		 <div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
			<form:label path="dv_nick">닉네임</form:label>
			<form:input path="dv_nick" class="form-control" readonly="true"/>
		</div>		
		<div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
			<form:label path="dv_name">이름</form:label>
			<form:input path="dv_name" class="form-control"/>
			<form:errors path="dv_name" style="color:red"/>
		</div>	
		<div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
			<form:label path="dv_tel">연락처</form:label>
			<form:input path="dv_tel" class="form-control"/>
			<form:errors path="dv_tel" style="color:red"/>
		</div>	
		<div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
			<form:label path="dv_address">배송지</form:label>
			<form:input path="dv_address" class="form-control"/>			
            <form:errors path="dv_address" style="color:red"/>
           </div>         
          <div class="row">
            </div>
            <div class="col-md-4 mb-3">
           
            </div>
          <hr class="mb-4">
          <div class="hi"style="font-family: 'Noto Sans KR', sans-serif;">
				<form:button class="btn btn-dark" type="submit">수정하기</form:button>				
          </div>
        </form:form>
      </div>
      </div>
</body>
</html>