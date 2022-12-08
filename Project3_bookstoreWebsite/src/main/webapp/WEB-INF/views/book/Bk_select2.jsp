<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<link rel="Stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 상세 정보</title>
<style>
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
</style>
</head>
<body onload="init();">
<script>

var sell_price;
var amount;

function init () {
    sell_price = document.form.sell_price.value;
    amount = document.form.amount.value;
    document.form.sum.value = sell_price;
    change();
}

function add () {
    hm = document.form.amount;
    hm.value ++ ;

    var sum_ = parseInt(hm.value) * sell_price;
document.getElementById("my_sum").innerHTML=sum_;
}

function del () {
    hm = document.form.amount;
        if (hm.value > 1) {
            hm.value -- ;
            var sum_ = parseInt(hm.value) * sell_price;
document.getElementById("my_sum").innerHTML=sum_;	
        }
}

function change () {
    hm = document.form.amount;

        if (hm.value < 0) {	
            hm.value = 0;
        }
    var sum_ = parseInt(hm.value) * sell_price;
document.getElementById("my_sum").innerHTML=sum_;
}
//주문

let basket = {
		orderInitiator: function(ca_bknumbers){
	    	<%java.util.Date today = new java.util.Date();
			SimpleDateFormat formatTime = new SimpleDateFormat("yyMMM", Locale.ENGLISH);
			String todayString = formatTime.format(today); %>
			
			//로그인 아이디 받아와야됨
			var ca_mbid = '${mb_id}';
			var ca_bkcount = $("#amount").val();
			var or_number1 = this.calOrderNum1();
			var or_number2 = this.calOrderNum2();
			
			var orderNumExist = this.orderNumExist(or_number1);
			
	    	this.delPreOrderItems(ca_mbid);
	    	
	    	
	    	if(orderNumExist == 'true'){
				this.orderCreate(or_number1,ca_mbid,ca_bknumbers,ca_bkcount);
			}else if(orderNumExist == 'false'){
				this.orderCreate(or_number2,ca_mbid,ca_bknumbers,ca_bkcount);
			}
	    	
	    	//로케이션~ 주문번호 넘겨줌 location.href='결제?or_number=or_number'
	    },
	    orderCreate: function(or_number,ca_bknumbers,ca_bkcount){
	    	
	    	var ca_mbid = '${mb_id}';
	    	
	    	$.ajax({
				url: '${root}cart/cart_createOderInfo/' + or_number +'/'+ ca_mbid,
				type: 'get',
				dataType: 'text',
				success: function(){
					javascript:basket.orderItem(or_number,ca_mbid,ca_bknumbers,ca_bkcount);
				},
				complete : function() {
					location.href="${root}order/Or_purchase?mb_id="+ca_mbid+"&or_number="+or_number;
			    }
	    	})
	    },
	    orderItem: function(or_number,ca_bknumbers,ca_bkcount){
	    	
	        	var ca_mbid='${mb_id}';
	        	if (ca_bkcount != 0){
	        		$.ajax({
						url: '${root}cart/cart_insertOderItem/'+ or_number +'/'+ ca_bknumbers + '/' + ca_mbid + '/' + ca_bkcount,
						type: 'get',
						dataType: 'text'
					})		
	        	}
	        	        		        	
	        
	    },
	    orderNumExist: function(or_number1){
	    	var orderNumExist;
	    	$.ajax({
				url: '${root}cart/cart_checkOrderNumber/' + or_number1,
				async: false,
				type: 'get',
				dataType: 'text',
				success: function(result){
					
					if(result.trim() == 'true'){
						orderNumExist = 'true';
					}else{
						orderNumExist = 'false';
					}				
				}			
			})
	    	
			return orderNumExist;
	    },

	    delPreOrder: function(){
	    	var ca_mbid='${mb_id}';
	    	$.ajax({
				url: '${root}cart/cart_delPreOrder/' + ca_mbid,
				type: 'get',
				dataType: 'text'
			})
	    },
	    delPreOrderItems: function(){
	    	var ca_mbid='${mb_id}';
	    	$.ajax({
				url: '${root}cart/cart_delPreOrderItems/' + ca_mbid,
				type: 'get',
				dataType: 'text',
				success: function(){
					javascript:basket.delPreOrder(ca_mbid);
					}
			})
	    },
		priceComma: function(bk_price){
			var price = bk_price.toLocaleString('ko-KR');
			document.write(price + '원');
	    },
	    //주문번호생성로직
	    calOrderNum1: function(){
	    	
	    	
		    <%
		    
			String orderNum1;
			Random rnd1 =new Random();
			StringBuffer buf1 =new StringBuffer();
				
				for(int i=0;i<6;i++){
				    if(rnd1.nextBoolean()){
				        buf1.append((char)((int)(rnd1.nextInt(26))+65));
				    }else{
				        buf1.append((rnd1.nextInt(10)));
				    }
				}
				
				orderNum1 = todayString.toUpperCase()+buf1;
	    	%>
	   	return '<%=orderNum1%>' ;
    	
	    	
	    },
	    calOrderNum2: function(){
		    <%
		    
			String orderNum2;
			Random rnd2 =new Random();
			StringBuffer buf2 =new StringBuffer();
				
				for(int i=0;i<6;i++){
				    if(rnd2.nextBoolean()){
				        buf2.append((char)((int)(rnd2.nextInt(26))+65));
				    }else{
				        buf2.append((rnd2.nextInt(10)));
				    }
				}
				
				orderNum2 = todayString.toUpperCase()+buf2;
	    	%>
	   	return '<%=orderNum2%>' ;
    	
	    	
	    }
};
let wish = {
	switchWishHeart : function(bk_number) {

		var mb_id = '${mb_id}';
		var imgsrc = $("#wish").attr("src");
		
		var culsrc = imgsrc.split('-');
		
		if (culsrc[1] == null){
			//여기다가 찜추가
			$.ajax({
			url: '${root}wish/wish_add/' + mb_id +'/'+ bk_number,
			type: 'get',
			dataType: 'text',
			success : function(result) {
				if(result=="true") {
					$("#wish").attr("src","${root }imgs/heart-fill.svg");
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
						$("#wish").attr("src","${root }imgs/heart.svg");
					}
				}
				})
			
		}
		
		
	},
	checkWishHeart : function(bk_number){

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
					$("#wish").attr("src","${root }imgs/heart.svg");
				} else if(result.trim()=="false") {
					$("#wish").attr("src","${root }imgs/heart-fill.svg");
				}
			}
		});
	}
};
function addcart(ca_bknumbers){
	var ca_mbid = '${mb_id}';
	
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

}
</script>
<c:import url="/Main/header"></c:import>
	<div class="jumbotron"style="padding-top:30px; padding-bottom: 30px;">
		<div class="container" style="width:1600px">
			<h1 class="display-5">도서 정보</h1>
		</div>
	</div>
	
	<div style="padding-left:400px;">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img style="width: 320px; height: 360px; padding-right: 0px; margin-right: 0px;" src="${root }upload/${ReadBkBean.bk_image}"/>
				<div style="left: 0px; width: 320px; top: 10px; padding-left: 105px;" class="input-group">
				<c:if test="${ReadScore != 0}">
					<c:set var = "string1" value = "${ReadScore}"/>
      				<c:set var = "string2" value = "${fn:substring(ReadScore, 0, 3)}" />
					<h5><b>평점</b></h5>&nbsp;:&nbsp;<div class="input-group-append">${string2}/5.0 점</div>
				</c:if>
				<c:if test="${ReadScore == 0.0}">
					<div><h5>등록된 평점이 없습니다.</h5></div>
				</c:if>
				</div>
			</div>
			<div class="col-md-8">
				<div class="input-group">
				<h3><b>${ReadBkBean.bk_title}</b></h3>
				<div class="input-group-append">
				<!--  like button  -->
				<script>
				$(document).ready(function(){
					setTimeout(wish.checkWishHeart(${ReadBkBean.bk_number}), 200);
				})
				</script>
				
					<img src="${root }imgs/heart.svg"  id="wish"  onclick="javascript:wish.switchWishHeart(${ReadBkBean.bk_number})"/>
					
				<!--  /like button  -->
				</div>
				</div>
				<p style="text-align:left;">${ReadBkBean.bk_detail }
				<p style="text-align:left;"><b>저자</b> : ${ReadBkBean.bk_writer }
				<p style="text-align:left;"><b>출판사</b> : ${ReadBkBean.bk_publisher }
				<p style="text-align:left;"><b>출간일</b> : ${ReadBkBean.bk_pubdate }
				<p style="text-align:left;"><b>지역</b> : ${ReadBkBean.bk_local }
				<p style="text-align:left;"><b>장르</b> : ${ReadBkBean.bk_genre }
				<p style="text-align:left;"><b>재고수</b> : ${ReadBkBean.bk_quantity }개	
				<form name="form" method="get">
				<div class="input-group" style="text-align:left; width:300px;">
				<b>수량</b> : <input type=hidden name="sell_price" value="${ReadBkBean.bk_price }">
				<input type="text" id="amount" name="amount" value="1" size="3" onchange="change();"> 
				<input type="button" value=" + " onclick="add();" style="width:35px;">
				<input type="button" value=" - " onclick="del();" style="width:35px;"><br>
				<input type="hidden" name="sum" size="11" readonly>
				</div>
				<p>
				<div class="input-group"><b>금액</b>&nbsp;:&nbsp;<span class="input-group-append" id="my_sum">원</span><b>원</b></div>
				<p>
				</form>
				<div class="input-group-append">
				<p>
				<p><a href="#" class="btn btn-info" onclick="javascript:basket.orderInitiator(${ReadBkBean.bk_number});">도서주문 &raquo;</a>
				<input class="btn btn-info" type="button" onclick="javascript:addcart(${ReadBkBean.bk_number})" value="장바구니"></p>
				<c:if test="${mb_id=='admin'}">
				<p><a href='${root }book/BkUpdate?bk_number=${ReadBkBean.bk_number}' class="btn btn-secondary" role="button">수정 &raquo;</a>
				<a href='#' onclick="javascript:delBook(${ReadBkBean.bk_number})" class="btn btn-secondary" role="button">삭제 &raquo;</a></p>
				</c:if>
				</div>	
			</div>
		</div>
		<hr style="width:700px; margin-right:400px;">
	</div>
	</div>
</body>
</html>