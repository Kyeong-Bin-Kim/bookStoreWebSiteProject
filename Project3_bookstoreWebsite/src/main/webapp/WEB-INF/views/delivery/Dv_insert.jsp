<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<c:url var='root' value='/'/>  
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>배송지 추가</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@900&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- 검색 api -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

  <style>
    body {
 		background-color:#F3E8EB;	
 		text-align:center;
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
<script>
	function CheckDvNick(){
				
		var dv_nick = $("#dv_nick").val()
		var dv_id = $("#mb_id").val()
		var dv_pk = $("#mb_id").val()+"."+$("#dv_nick").val()
		
		if(dv_nick.length == 0){
			alert("닉네임를 입력해 주세요.")
			return;
		}
		
		$.ajax({
			url: '${root}delivery/CheckDvNick/' + dv_pk,
			type: 'get',
			dataType: 'text',
			success: function(result){
				
				if(result.trim() == 'true'){
					alert('사용 할 수 있는 아이디 입니다.')
					$("#dv_nickExist").val('true')
				}else{
					alert('사용 할 수 없는 아이디 입니다.')
					$("#dv_nickExist").val('false')
					
				}				
			}			
		})
	}
	function ResetDvNick(){
		$("#dv_nickExist").val('false')
	}
</script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<body>

    <div class="input-form-backgroud row" style="font-family: 'Noto Sans KR', sans-serif;">
      <div class="input-form col-md-12 mx-auto">
      <a href="#" onclick="location.href='Main/center'" style="font-size:30px;font-family:'Frank Ruhl Libre', serif;">
					Ezen Book Store
				</a> <br>
        <h4 class="mb-3" style="font-family: 'Noto Sans KR', sans-serif;">배송지 추가</h4>
        <form:form action="${root}delivery/DvInsertPro" method="post" modelAttribute="InsertDvBean">          
            <form:hidden path="mb_id"/>
            <div class="form-group" style="font-family: 'Noto Sans KR', sans-serif;">
              <form:label path="dv_nick">닉네임</form:label>
              <div class="input-group">
              <form:input path="dv_nick" class="form-control"/>             
              <div class="input-group-append">
			  	<form:button type="button" class="btn btn-dark" onclick="CheckDvNick()">중복확인</form:button>
			  </div>
			  </div>
			  <form:errors path="dv_nick" style="color:red"/>
            </div>
            <div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
              <form:label path="dv_name">이름</form:label>
              <form:input path="dv_name" class="form-control"/>
              <form:errors path="dv_name" style="color:red"/>
            </div>
            <div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
              <form:label path="dv_tel">연락처</form:label>
              <form:input path="dv_tel" class="form-control" placeholder="xx(x)-xxx(x)-xxxx"/> 
              <form:errors path="dv_tel" style="color:red"/>                                
           <div class="form-group"style="font-family: 'Noto Sans KR', sans-serif;">
              <form:label path="dv_address">배송지</form:label>
              <div class="input-group">
              <form:input path="dv_address" class="form-control postcodify_address" readonly="true"/>
              <div class="input-group-append">
              <button type='button' class="btn btn-dark" id="postcodify_search_button">검색</button>
              </div>
              </div>         
              <form:input path="dv_addressDetail" class="form-control"/>
              <form:errors path="dv_address" style="color:red"/>             
           </div>         
          <div class="row">
            </div>
            <div class="col-md-4 mb-3">
           
            </div>
          </div>
          <hr class="mb-4">
          <div class="hi"style="font-family: 'Noto Sans KR', sans-serif;">
          <form:button class="btn btn-dark" type="submit">입력 완료</form:button>
          </div>
        </form:form>
      </div>
    </div>
  
 
</body>

</html>
