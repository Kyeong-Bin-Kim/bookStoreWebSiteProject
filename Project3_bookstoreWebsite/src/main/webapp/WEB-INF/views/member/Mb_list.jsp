<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var='root' value='/' />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Mb_list.jsp</title>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@900&display=swap" rel="stylesheet">
<style>
<style>
body{
  text-align:center;
  
}	

tr:nth-child(odd) { background-color: #e6f1ff; }
tr:nth-child(even) { background-color: #f0f7ff; }
td { padding: 5px; }
tr:hover { background-color: #ffc5c2; cursor: pointer; }
#adad{
border: 1px solid #F3E8EB;
 background-color:#F3E8EB; 
  border-radius: 16px;
  box-shadow: inset 0 0 8px #deb13a;
  }
 
  
  
</style>
</head>
<body>
<br><br><br><br>
	<div class="container" align="center">
		<div class="input-form col-md-12 mx-auto" id="adad" style="top:50px;">
		<br>
			<a href="#" onclick="location.href='${root}Main/center'" style="font-size:30px; font-family:'Frank Ruhl Libre', serif;">
					Ezen Book Store
				</a> <br>
			<h4 class="mb-3"style="font-family: 'Noto Sans KR', sans-serif;">회원목록 보기화면(관리자)</h4>
			<table border="1">
				<tr align="center" >
					<td id=title>아이디</td>
					<td id=title>이름</td>
					<td id=title>이메일</td>
					<td id=title>연락처</td>
					<td id=title style="width:100px;">가입날짜</td>
					<td id=title>탈퇴여부</td>
					<td id=title style="width:150px;">탈퇴날짜</td>
				</tr>
				<tbody>
					<c:forEach var="m" items="${memberlist }" varStatus="status">
					<c:if test="${pageCountBean.firstContent <= status.count and status.count <= pageCountBean.lastContent}">
						<tr>
							<td><a href='${root }member/Mbselect?mb_id2=${m.mb_id}'>${m.mb_id }</a></td>
							<td>${m.mb_name }</td>
							<td>${m.mb_email }</td>
							<td>${m.mb_tel }</td>
							<td>${m.mb_date }</td>
							<td>${m.mb_deleted }</td>
							<td>${m.mb_deleted_date }</td>
						</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<!-- 페이지네이션 -->
			<div class=hi align="center">
            	<ul id="hiyo" class="pagination" style="text-align:center; width:190px; font-family:'Noto Sans KR', sans-serif; margin:0; padding:0; margin-bottom:10px;">
					
					<li class="page-item" align="center">
						<a href="${root}member/Mblist?mb_id=${mb_id}&page=1" class="page-link">First</a>
					</li>					
														
				<c:forEach var="idx" begin="${pageCountBean.min }" end="${pageCountBean.max }">
					
					<li class="page-item active">
						<a href="${root}member/Mblist?mb_id=${mb_id}&page=${idx}" class="page-link">${idx}</a>
					</li>		
												
				</c:forEach>					
					
					<li class="page-item" align="center" >	
						<a href="${root}member/Mblist?mb_id=${mb_id}&page=${pageCountBean.pageCnt}" class="page-link">Last</a>
					</li>
					
				</ul>
			</div>	
			
			<div align="center" class="mb-4" style="font-family: 'Noto Sans KR', sans-serif;">
			<a href="${root }member/Mbselect?mb_id2=${mb_id }" class="btn btn-info">마이페이지</a>
			<a href="${root }Main/center" class="btn btn-danger">메인화면</a>
		</div>
	</div>
</div>
</body>
</html>