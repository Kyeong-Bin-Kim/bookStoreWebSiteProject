<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/Bk_list.css" rel="stylesheet" type="text/css">
<title>책 리스트</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Bk_list.js" ></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
.content_inner{
display:flex;	
}

.title{
font-size:30px;
}
aside{
margin-right:-100px;
display:block;

}
.list{
  list-style:none;
  padding-left:0;
  font-size	:20px;
  font-family: 'Black Han Sans', sans-serif;
}
.aside_wrap{



}
.ali2{
font-size:2rem;

}

.ali{
font-size:1.5rem;
padding-top: 8px;

}
    .hi{
   text-align:center;
  width: 300px;
  margin-left: auto;
  margin-right: auto;
    display:block;
    margin:auto;
   } 

</style>
<script>
let wish = {
		switchWishHeart : function(bk_number,su) {
			
var mb_id = '${mb_id}';
			var imgsrc = $("#wish"+su).attr("src");
			var culsrc = imgsrc.split('-');
			
			if (culsrc[1] == null){
				//여기다가 찜추가
				$.ajax({
				url: '${root}wish/wish_add/' + mb_id +'/'+ bk_number,
				type: 'get',
				dataType: 'text',
				success : function(result) {
					if(result=="true") {
						$("#wish"+su).attr("src","${root }imgs/heart-fill.svg");
					}
				}
				})
				
			}else{
				//여기다가 찜삭제
				$.ajax({
					url: '${root}wish/wish_delete/' + mb_id +'/'+ bk_number,
					type: 'get',
					dataType: 'text',
					success : function(result) {
						if(result=="true") {
							$("#wish"+su).attr("src","${root }imgs/heart.svg");
						}
					}
					})
				
			}
			
			
		},
		checkWishHeart : function(bk_number,su){
	
			var mb_id = '${mb_id}';
			$.ajax({
				url : "${root}wish/wish_checkWishHeart/" + mb_id + "/" + bk_number,
				type : "GET",
				dataType : "text",
				error : function(e) {
					alert("안됨1");
					//alert(e);
				},
				success : function(result) {
					if(result.trim()=="true") {
						$("#wish"+su).attr("src","${root }imgs/heart.svg");
					} else if(result.trim()=="false") {
						$("#wish"+su).attr("src","${root }imgs/heart-fill.svg");
					}
				}
			});
		}
	};

function addcart(ca_mbid,ca_bknumbers){
	
		$.ajax({
		url: '${root}cart/cart_add/' + ca_mbid +'/'+ ca_bknumbers,
		type: 'get',
		dataType: 'text',
		success: function(){
			 var conFirm = confirm('장바구니에 추가되엇습니다. 장바구니로 가시겟습니까?');
			 if (conFirm) {
			      location.href="${root}cart/cart_info?ca_mbid="+ca_mbid;
			   }
			   else {
			     false;
			   }
		}
	})
	
};

function delBook(bk_number){
	
	 var conFirm = confirm('삭제 하시겟습니까');
	 if (conFirm) {
		 $.ajax({
				url: '${root }book/BkDeletePro/' + bk_number,
				type: 'get',
				dataType: 'text',
				error : function(e) {
					alert("삭제 실패"+ e);
					//alert(e);
				},
				success: function(){
					alert("삭제되었습니다.")
					location.href="${root}Main/center";
				}
			})
	 	}

};

$(window).on('load', function () {
	$("#${bk_genre}").attr("class","active");
});
</script>
<body>
<c:import url="/Main/header"></c:import>

	<div class="jumbotron" style="padding-top:30px; padding-bottom: 30px;">
		<div class="container" style="font-family: 'Noto Sans KR', sans-serif;">
					<h1 class="display-5">베스트셀러</h1>
				<h2 class="display-5">${bk_local} ${bk_genre}</h2>
		</div>
	</div>
<!-- 이 페이지 형식상 </div>를 쓰면 모양이 무너짐. -->
<div class="input-group">
<aside class="sidebar" style="width:300px;height:1000px;board-left-width:10px;left:20px; background-color:#white" id="menu-bar">
       <h1 style="padding-left: 0px; width: 230px;"><span class="logo" style="color:#170000; text-align:left;">국내도서</span></h1>
        <div class="menu">
          <ul class="navbar-aside">
	            <li id="소설" ><a href="${root }book/BkList?bk_local=국내&bk_genre=소설">소설</a></li>
	            <li id="인문" ><a href="${root }book/BkList?bk_local=국내&bk_genre=인문">인문</a></li>
	            <li id="취미"><a href="${root }book/BkList?bk_local=국내&bk_genre=취미">취미</a></li>
	            <li id="경제"><a href="${root }book/BkList?bk_local=국내&bk_genre=경제">경제</a></li>
	            <li id="자기개발" ><a href="${root }book/BkList?bk_local=국내&bk_genre=자기개발">자기개발</a></li>
	            <li id="예술" ><a href="${root }book/BkList?bk_local=국내&bk_genre=예술">예술</a></li>
	            <li id="기술" ><a href="${root }book/BkList?bk_local=국내&bk_genre=기술">기술</a></li>
	            <li id="잡지" ><a href="${root }book/BkList?bk_local=국내&bk_genre=잡지">잡지</a></li>
        	</ul>
        </div>
       <h1 style="padding-left: 0px; width: 230px;"><span class="logo" style="color:#170000; text-align:left; padding-left: 0px; width: 230px;">해외도서</span></h1>
        <div class="menu">
          <ul class="navbar-aside">
	            <li id="소설"  ><a href="${root }book/BkList?bk_local=해외&bk_genre=소설">소설</a></li>
	            <li id="인문" ><a href="${root }book/BkList?bk_local=해외&bk_genre=인문">인문</a></li>
	            <li id="취미"><a href="${root }book/BkList?bk_local=해외&bk_genre=취미">취미</a></li>
	            <li id="경제" ><a href="${root }book/BkList?bk_local=해외&bk_genre=경제">경제</a></li>
	            <li id="자기개발" ><a href="${root }book/BkList?bk_local=해외&bk_genre=자기개발">자기개발</a></li>
	            <li id="예술" ><a href="${root }book/BkList?bk_local=해외&bk_genre=예술">예술</a></li>
	            <li id="기술" ><a href="${root }book/BkList?bk_local=해외&bk_genre=기술">기술</a></li>
	            <li id="소설" ><a href="${root }book/BkList?bk_local=해외&bk_genre=잡지">잡지</a></li>
        	</ul>
        </div>
</aside>
    <div class="container">
	<c:forEach var="bs" items="${bestSellerBeans}" varStatus="status">
		<c:if test="${bs.bk_deleted != 'deleted'}">
		<c:if test="${0 <= status.count and status.count <= page2}">
		<div class="container">
	<div class="input-group-append">
	<div class="container">
		<div class="row">
		<div class="content_inner"></div>
			<div class="col-md-3" align="center">	
				<img src="${root }upload/${bs.bk_image}" style="width: 200px; height: 230px;">	
			</div>
				<h4 style="text-align:center; margin-bottom:0px; width:230px; height: 35px;">
					<c:if test="${bs.avg_score != 0}">
						<c:set var = "string1" value = "${bs.avg_score}"/>
      					<c:set var = "string2" value = "${fn:substring(string1, 0, 3)}" />
      				<p>	
					<p style="font-size:19px;">평점 : ${string2}/5.0점</p>
					</c:if>
					<c:if test="${bs.avg_score == 0.0}">
					<p>
					<p style="font-size:19px;">등록된 평점이 없습니다.</p>
					</c:if>
				</h4>
		</div>
		</div>		
			<div class="col-md-7">
			<br>
				<a href='${root }book/BkSelect?bk_number=${bs.bk_number}'><b>${bs.bk_title}</b></a>
				<!--  like button  -->
				<script>
					$(document).ready(function(){
						setTimeout(wish.checkWishHeart(${bs.bk_number},${status.count}), 200);
					})
				</script>
				<img src="${root }imgs/heart.svg"  id="wish${status.count }"  onclick="javascript:wish.switchWishHeart(${bs.bk_number},${status.count})"/>
				
				<p>${bs.bk_writer} | ${bs.bk_publisher} | ${bs.bk_pubdate} 출시 
				<p style="padding-top: 20px">
				<c:set var = "string3" value = "${bs.bk_detail}"/>
      			<c:set var = "string4" value = "${fn:substring(string3, 0, 30)}" />
      			${string4}...
				<p><b>${bs.bk_price} 원 | 재고 : ${bs.bk_quantity}권</b>
				
			</div>
			<div class="col-md-2" style="padding-top: 70px; width:230px">
			<c:if test = "${mb_id == 'admin' }">
				<a href='${root}book/BkUpdate?bk_number=${bs.bk_number}' class="btn btn-secondary" role="button">수정 &raquo;</a><br>
				<a href='#' onclick="javascript:delBook(${bs.bk_number})" class="btn btn-secondary" role="button" style="margin-top:10px;">삭제 &raquo;</a><br>
			</c:if>
				<a href='#' onclick="javascript:addcart(${bs.bk_number})" class="btn btn-secondary" role="button" style="margin-top:10px">장바구니 &raquo;</a>
			</div>
		</div>
		</div>
		<hr>
		</c:if>
		</c:if>
	</c:forEach>
	</div>
</div>
<br><br><br>
<c:import url="/Main/footer"></c:import>
</body>
</html>