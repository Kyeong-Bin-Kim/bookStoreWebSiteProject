<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>       
<c:url var='root' value='/'/>  <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 정보 보기 화면 - 마이페이지</title>
  <script src="https://kit.fontawesome.com/ece1cdce53.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
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
<script>

function delDv(mb_id, dv_nick){
	 var conFirm = confirm('삭제 하시겟습니까');
	 if (conFirm) {
		 $.ajax({
				url: '${root }delivery/DvDelete/' + mb_id +'/'+ dv_nick,
				type: 'get',
				dataType: 'text',
				error : function(e) {
					alert("삭제 실패"+ e);
					//alert(e);
				},
				success: function(){
					alert("삭제되었습니다.")
					location.href="${root}member/Mbselect?mb_id2="+mb_id;
				}
			})
	 	}
}
</script>
</head>
<body>

<div class="container" >
<div class="input-form col-md-12 mx-auto">	
	<table class="table table-hover" id='dv_list'>
		<thead>
			<tr>
				
				<th class=" d-none d-md-table-cell"style="width:450px;font-family: 'Noto Sans KR', sans-serif;">닉네임</th>
				<th class=" d-none d-md-table-cell"style="width:450px;font-family: 'Noto Sans KR', sans-serif;">전화번호</th>
				<th class="w-50"style="font-family: 'Noto Sans KR', sans-serif;">배송지</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dvl" items="${Deliverylist }">
			<tr>
				
				<td height="20" width="120">${dvl.dv_nick }</td>
				<td height="20" width="150">${dvl.dv_tel }</td>
				<td height="20" width="300">${dvl.dv_address }</td>
				<td><a href="${root}delivery/DvUpdate?mb_id2=${dvl.mb_id}&dv_nick=${dvl.dv_nick}" class="btn btn-dark" style="font-size:15px; font-family:'Noto Sans KR', sans-serif; width: 58px;height: 38px;">수정</a>
			<td><input style="font-family: 'Noto Sans KR', sans-serif;"class="btn btn-dark" type="button" onclick="javascript:delDv('${dvl.mb_id }','${dvl.dv_nick}')" style="width:32px; height:24px;" value="삭제"/>
			</tr>
			</c:forEach>
		</tbody>
		
	</table>
	<div class="mb-4">
		<a href="${root}delivery/DvInsert?mb_id2=${mb_id2}" class="btn btn-dark"style="font-size:15px;font-family: 'Noto Sans KR', sans-serif;">배송지 추가</a>
				
				</div>	
		
<footer class="my-3 text-center text-small">
     
    </footer>
</div>

</div>
 <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
  
 
</body>
</html>