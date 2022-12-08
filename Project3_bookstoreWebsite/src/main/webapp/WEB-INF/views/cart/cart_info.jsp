<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<c:url var='root' value='/'/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	
</head>
<style>

.loading{
    width:100%;
    height:100%;
    position:fixed;
    left:0px;
    top:0px;
    background:#fff;
    z-index:1000; /* 이 값으로 레이어의 위치를 조정합니다. */
}
        
        
.basketdiv {
    width: 100%;
    border-top: 1px solid #e0e0e0;
    float: left;
    font-size: 0.9375em;
    margin-bottom: 20px;
}
    .basketdiv .row.head {
        border-bottom: 2px solid #888;
        box-sizing: border-box;
        background-color: #f4f4f4;
        font-weight: 500;
    }
    .basketdiv .data {
        border-bottom: 1px dashed #888;
        box-sizing: border-box;
        cursor: pointer;
        float: left;
        width: 100%;
    }
    .basketdiv .data .empty{
        text-align: center;
        padding: 12px 0;
    }
    .basketdiv .row.head .subdiv {
        background-color: #f4f4f4;
    }
    .basketdiv .row > .subdiv {
        display: block;
        float: left;
    }
    .basketdiv .row > .subdiv:nth-child(1) {
        width: 50%;
    }
    .basketdiv .row > .subdiv:nth-child(2) {
        width: 40%;
    }
    .basketdiv .row > .subdiv:nth-child(3) {
        width: 10%;
    }
    .basketdiv2 .row > .subdiv:nth-child(1) {
        width: 60%;
    }
    .basketdiv2 .row > .subdiv:nth-child(2) {
        width: 40%;
    }
    .basketdiv .row > div > div {
        display: block;
        float: left;
        text-align: center;
        margin: 0;
        padding: 12px 0;
    }
    .basketdiv .row.data > div > div {
        height: 60px;
        line-height: 60px;
        padding: 0px 0;
    }
        .basketdiv .data .num .updown {
            color: #0075ff;
            font-size: 2em;
            letter-spacing: -5px;
        }
        .basketdiv .check {
            width: 10%;
        }
    .basketdiv .check input[type=checkbox] {
        transform: scale(1.5);
    }
    .basketdiv .img{
        width: 20%;
    }
    .basketdiv .pname{
        width: 70%;
    }
    .basketdiv2 .pname {
        width: 80%;
    }
    .basketdiv .basketprice {
        width: 33%;
    }
    .basketdiv .num {
        width: 33%;
      min-width: 105px;
    }
    .basketdiv .sum {
        width: 34%;
      max-width: 80px;
        color: #0000aa;
    }
    .basketdiv .point {
        width: 50%;
    }
    .basketdiv2 .basketprice {
        width: 25%;
    }

    .basketdiv2 .num {
        width: 25%;
    }

    .basketdiv2 .sum {
        width: 25%;
        color: #0000aa;
    }

    .basketdiv2 .point {
        width: 25%;
    }
    .basketdiv .basketcmd{
        width: 100%;
    }
    .basketdiv .data .pname {
        text-align: left !important;
      line-height: 1.2 !important;
    }
    .basketdiv .data .price, .basketdiv .data .sum, .basketdiv .data .point {
        text-align: right;
    }
    .baseform > tbody > tr > td:first-child {
        width: 100px;
    }

	.buttongroup {
	    padding: 11px 0;
	    margin: 50px 0;
	}
	.narrowbuttongroup{
	    margin: 15px 0;
	}
    .buttongroup.center {
        text-align: center;
    }
    .buttongroup input[type=text], .buttongroup input[type=password] {
        height: 30px;
    }
    .buttongroup button, .buttongroup a {
        margin-right: 5px;
    }
        .buttongroup button:last-child, .buttongroup a:last-child {
            margin-right: 0;
        }

    .abutton, .abutton:link, .abutton:visited, .abutton:active, input[type=button] {
        background-color: #383838;
        border: 1px solid #888888;
        color: #ffffff;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 5px;
        margin: 2px 3px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }

.abutton-alt {
    background-color: #d3e2c6;
}

.red {
    color:#b00;
}
.blue {
  color: #0075ff;
}
.basketrowcmd, .sumcount, .summoney{
  text-align: right;
  margin-bottom: 10px;
}
.sumcount, .summoney{
  font-size: 1.25em;
    font-weight: bold;
}
.buttongroup{
  text-align: center;
}
.buttongroup a{
  text-decoration: none;
}
.cmd a, .cmd span {
    padding: 12px 30px;
    box-sizing: border-box;
    margin-top: 10px;
    font-size: 1.2em;
    color: #000;
    background-color: #f4f4f4;
    border: 1px solid #e0e0e0;
    text-align: center;
}
.cmd.small a, .cmd.small span {
    padding: 6px 20px;
    font-size: 0.8125em;
}

.orderform .p_num {
    text-align: center;
    width: 35px;
    height: 45px;
    font-size: 0.78em;
}

</style>


<script>

let basket = {
	    totalCount: 0, 
	    totalPrice: 0,
	    //체크한 장바구니 상품 비우기
	    delCheckedItem: function(){
	        document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
	        	var ca_bknumbers = parseInt(item.getAttribute('value'));
	        	var ca_mbid = '${mb_id}' ;
	        	$.ajax({
					url: '${root}cart/cart_delete/'+ ca_mbid +'/'+ ca_bknumbers,
					type: 'get',
					dataType: 'text'
				})	        		        	
	            item.parentElement.parentElement.parentElement.remove();
	        });
	        //AJAX 서버 업데이트 전송
	    	
	        //전송 처리 결과가 성공이면
	        alert('삭제되었습니다.')
	        this.reCalc();
	        this.updateUI();
	        this.emptyImg();
	    },
	    //장바구니 전체 비우기
	    delAllItem: function(){
	    	var ca_mbid = '${mb_id}' ;
	        document.querySelectorAll('.row.data').forEach(function (item) {
	            item.remove();
	          });
	          //AJAX 서버 업데이트 전송
	        // var ca_bknumbers = ca_bknumbers; id값 받아야함
	      
	        $.ajax({
				url: '${root}cart/cart_deleteAll/' + ca_mbid,
				type: 'get',
				dataType: 'text',
				success: function(){
					alert('삭제되었습니다.')
				}			
			})
	          
	          
	          //전송 처리 결과가 성공이면
	          this.totalCount = 0;
	          this.totalPrice = 0;
	          this.reCalc();
	          this.updateUI();
	          this.emptyImg();
	    },
	    //재계산
	    reCalc: function(){
	        this.totalCount = 0;
	        this.totalPrice = 0;
	        document.querySelectorAll(".p_num").forEach(function (item) {
	            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
	                var count = parseInt(item.getAttribute('value'));
	                this.totalCount += count;
	                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	                this.totalPrice += count * price;
	            }
	        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
	    },
	    //화면 업데이트
	    updateUI: function () {
	        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
	        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
	    },
	    //개별 수량 변경
	    changePNum: function (pos,ca_bknumbers,bk_quantity) {
	    	var ca_mbid = '${mb_id}' ;
	        var item = document.querySelector('input[name=p_num'+pos+']');
	        var p_num = parseInt(item.getAttribute('value'));
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;

	        
	        if (parseInt(newval) < 1 || parseInt(newval) > bk_quantity) { return false; }
	        
	        item.setAttribute('value', newval);
	        item.value = newval;

	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
	        //AJAX 업데이트 전송

	        if (event.target.classList.contains('up') == true){
	        	$.ajax({
					url: '${root}cart/cart_plusBookCount/' + ca_mbid +'/'+ ca_bknumbers,
					type: 'get',
					dataType: 'text'
								
				})
	        }else if (event.target.classList.contains('down') == true){
	        	$.ajax({
					url: '${root}cart/cart_minusBookCount/' + ca_mbid +'/'+ ca_bknumbers,
					type: 'get',
					dataType: 'text'
		
				})
	        }
	        
	        //전송 처리 결과가 성공이면    
	        this.reCalc();
	        this.updateUI();
	        this.emptyImg();
	    },
	    changeKeyupPNum: function (pos,ca_bknumbers,bk_quantity) {
	    	
	    	var ca_mbid = '${mb_id}' ;
	    	
	        var item = document.querySelector('input[name=p_num'+pos+']');
	        
	        var p_num = parseInt(item.getAttribute('value'));
	        
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	        
	        if (newval < 1 || newval > bk_quantity) { 
	        	alert("재고가 부족합니다.");
	        	item.setAttribute('value', p_num);
		        item.value = p_num;
	        	return false; 
	        	}
	        
	        item.setAttribute('value', newval);
	        item.value = newval;

	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
	        //AJAX 업데이트 전송

	       
	        	$.ajax({
					url: '${root}cart/cart_setBookCount/' + ca_mbid +'/'+ ca_bknumbers +'/'+newval,
					type: 'get',
					dataType: 'text'
	        	})			
				
	        
	        //전송 처리 결과가 성공이면    
	        this.reCalc();
	        this.updateUI();
	        this.emptyImg();
	    },
	    checkItem: function () {
	        this.reCalc();
	        this.updateUI();
	    },
	    delItem: function (ca_bknumbers) {
	        event.target.parentElement.parentElement.parentElement.remove();
	        var ca_bknumbers = ca_bknumbers;
			
	        var ca_mbid = '${mb_id}' ;
	        
	        $.ajax({
				url: '${root}cart/cart_delete/' + ca_mbid +'/'+ ca_bknumbers,
				type: 'get',
				dataType: 'text',
				success: function(){
					alert('삭제되었습니다.')
				}			
			})
			 
	    	
	    	
	        this.reCalc();
	        this.updateUI();
	        this.emptyImg();
	    },
	    //콤마찍고 시작
	    orderInitiator: function(){
	    	var ca_mbid = '${mb_id}' ;
	    	<%java.util.Date today = new java.util.Date();
			SimpleDateFormat formatTime = new SimpleDateFormat("yyMMM", Locale.ENGLISH);
			String todayString = formatTime.format(today); %>
			
			$(".loading").fadeIn();
					
			var or_number1 = this.calOrderNum1();
			var or_number2 = this.calOrderNum2();
			
			var orderNumExist = this.orderNumExist(or_number1);
			
	    	this.delPreOrderItems(ca_mbid);
	    	if(orderNumExist == 'true'){
				this.orderCreate(or_number1,ca_mbid);
			}else if(orderNumExist == 'false'){
				this.orderCreate(or_number2,ca_mbid);
			}
	    	
	    	//로케이션~ 주문번호 넘겨줌 location.href='결제?or_number=or_number'
	    },
	    orderCreate: function(or_number){
	    	var ca_mbid = '${mb_id}' ;
	    	$.ajax({
				url: '${root}cart/cart_createOderInfo/' + or_number +'/'+ ca_mbid,
				type: 'get',
				dataType: 'text',
				success: function(){
					javascript:basket.orderItems(or_number,ca_mbid);
				},
				complete : function() {
					$(".loading").fadeOut();
					setTimeout(basket.sendPurchase(ca_mbid,or_number),300);
					
			    }
	    	})
	    },
	    orderItems: function(or_number,ca_mbid){
	    	document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
	        	var ca_bknumbers = parseInt(item.getAttribute('value'));
	        	var ca_bkcount = parseInt(item.parentElement.parentElement.nextElementSibling.firstElementChild.nextElementSibling.firstElementChild.firstElementChild.getAttribute('value'));
	        	if (ca_bkcount != 0){
	        		$.ajax({
						url: '${root}cart/cart_insertOderItems/'+ or_number +'/'+ ca_bknumbers + '/' + ca_mbid + '/' + ca_bkcount,
						type: 'get',
						dataType: 'text'
					})		
	        	}
	        	        		        	
	        })
	    },
	    sendPurchase: function(ca_mbid,or_number){
	    	location.href="${root}order/Or_purchase?mb_id="+ca_mbid+"&or_number="+or_number;
	    },
	    delPreOrder: function(){
	    	var ca_mbid = '${mb_id}' ;
	    	$.ajax({
				url: '${root}cart/cart_delPreOrder/' + ca_mbid,
				type: 'get',
				dataType: 'text'
			})
	    },
	    delPreOrderItems: function(){
	    	var ca_mbid = '${mb_id}' ;
	    	$.ajax({
				url: '${root}cart/cart_delPreOrderItems/' + ca_mbid,
				type: 'get',
				dataType: 'text',
				success: function(){
					javascript:basket.delPreOrder(ca_mbid);
					}
				
			})
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
						$("#orderNumExist").val('true')
						orderNumExist = 'true';
					}else{
						$("#orderNumExist").val('false')
						orderNumExist = 'false';
					}				
				}			
			})
	    	
			return orderNumExist;
	    },
	   
	    delPreOrder: function(){
	    	var ca_mbid = '${mb_id}' ;
	    	$.ajax({
				url: '${root}cart/cart_delPreOrder/' + ca_mbid,
				type: 'get',
				dataType: 'text'
			})
	    },
		priceComma: function(bk_price){
			var price = bk_price.toLocaleString('ko-KR');
			document.write(price + '원');
	    },
	    emptyImg: function(){
	    	if(document.querySelector('.row.data') == null){
	    		$(".empty").show();
	    	}
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

	// 숫자 3자리 콤마찍기
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
	//로딩바
	/*
	$(document).ready(function(){
		//로딩화면 출력
		$(".loading").css("display","");
		//$("body").css("background", "#333333");
	});
	*/
	 $(window).on('load', function () {
		 $(".loading").fadeOut();
		// $("body").css("background", "white");
		
		
	 });
</script>
<body onmouseover="javascript:basket.checkItem()">
<c:import url="/Main/header"></c:import>
	<br>
	<h1 style="text-align:center;">장바구니</h1>
	<p>
	<!-- 로딩 -->		
	<div class="loading"></div>
			
	<div class="container">				          
		<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">	    
	            <input type="hidden" name="cmd" value="order">
	            <input type="hidden" id="orderNumExist" name="orderNumExist" value="false">
	            <div class="basketdiv" id="basket">
	                <div class="row head">
	                    <div class="subdiv">
	                        <div class="check">선택</div>
	                        <div class="img">이미지</div>
	                        <div class="pname" style="text-align:left; padding-left:22px;">상품명</div>
	                    </div>
	                    <div class="subdiv" style="width:400px;">
	                        <div class="basketprice" style="width:115px;">가격</div>
	                        <div class="num" style="width: 180px;">수량</div>
	                        <div class="sum" style="padding-left:15px;">합계</div>
	                    </div>
	                    <div class="subdiv">
	    
	                        <div class="basketcmd">삭제</div>
	                    </div>
	                    <div class="split"></div>
	                </div>
	                <c:if test = "${empty infoCa_Bean}">
	                	<div class="row data" >
	                		<div class="img" style="width:100%; align:center"><img src="${root }imgs/empty_cart.png"></div>
	                	</div>
		       		</c:if>
			        <div class="empty" style=" display : none;">
	               		<div class="img" style="width:100%; align:center""><img src="${root }imgs/empty_cart.png"></div>
	                </div>
	        		<c:forEach var="str" items="${infoCa_Bean}" varStatus="status">
		                <div class="row data">
		                    <div class="subdiv" style="height:165px;">
		                    	<c:choose>
		                    		<c:when test="${str.bk_quantity != 0}">
				                        <div class="check" style="padding-top:50px;"><input type="checkbox" name="buy" value="${str.bk_number }" checked onclick="javascript:basket.checkItem();">&nbsp;</div>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="check" style="padding-top:50px;"><input type="checkbox" name="buy" value="${str.bk_number }" unchecked  onclick="javascript:basket.checkItem();">&nbsp;</div>
		                        	</c:otherwise>
		                        </c:choose>
		                        <div class="img" style="width: 120px; height: 145px; padding-top:10px;"><img src="${pageContext.request.contextPath}/upload/${str.bk_image }" onclick="location.href='${root }book/BkSelect?bk_number=${str.bk_number}'" style="width: 120px; height: 145px;"></div>
		                        <div class="pname" style=" position: relative; height: 20px; width:360px; padding-top:20px; padding-left:20px;">
		                            <p>제목 : <a href='${root }book/BkSelect?bk_number=${str.bk_number}'><b>${str.bk_title}</b></a></p>
									<p>저자 : ${str.bk_writer }</p>
						        	<p>출판사 : ${str.bk_publisher }</p>
						        	<p>재고: ${str.bk_quantity }</p>
		                        </div>
		                    </div>
		                    <div class="subdiv" style="margin-top:50px">
		                    	<c:choose>
		                    		<c:when test="${str.bk_quantity != 0}">
				                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price" class="p_price" value="${str.bk_price }">
				                        	<script>javascript:basket.priceComma(${str.bk_price })</script>
										</div>
				                        <div class="num">
				                            <div class="updown">
				                                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="p_num${status.count}" id="p_num${status.count}" size="2" maxlength="2" class="p_num"   value="${str.ca_bkcount} " onkeyup="javascript:basket.changeKeyupPNum(${status.count},${str.bk_number },${str.bk_quantity });">
				                                <span class="fas fa-arrow-alt-circle-up up" onclick="javascript:basket.changePNum(${status.count},${str.bk_number },${str.bk_quantity });"></span>
				                                <span class="fas fa-arrow-alt-circle-down down" onclick="javascript:basket.changePNum(${status.count},${str.bk_number },${str.bk_quantity });"></span>
				                            </div>
				                        </div>
				                        <div class="sum">
				                        	<script>javascript:basket.priceComma(${str.bk_price*str.ca_bkcount})</script>
				                        </div>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="basketprice"><input type="hidden" name="p_price" id="p_price" class="p_price" value="${str.bk_price }">
		                        			<script>javascript:basket.priceComma(${str.bk_price })</script>
		                        		</div>
				                        <div class="num">
				                            <div class="updown">
				                                <input type="hidden" name="p_num${status.count}" id="p_num${status.count},${str.bk_number }" size="5" maxlength="2" class="p_num" value="0" readonly ><h4 style="margin-top: 16px;margin-bottom: 16px;color : red;">재고가없습니다</h4>
				                            </div>
				                        </div>
				                        <div class="sum">0원</div>
		                        	</c:otherwise>
		                        </c:choose>
		                    </div>
		                    <div class="subdiv">
		                        <div class="basketcmd" style="width: 50px; height: 165px; padding-top:50px; padding-left:5px;"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem(${str.bk_number });">삭제</a></div>
		                    </div>
		                </div>
	        		</c:forEach>
	            </div>
	            <div class="right-align basketrowcmd">
	            	<a href="${root}wish/wish_info?page=1" class="abutton" >찜목록보기</a>
	                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
	                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
	            </div>
	    
	            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 개</div>
	            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 원</div>
	    
	            <div id="goorder" class="">
	                <div class="clear"></div>
	                <div class="buttongroup center-align cmd">
	                    <a href="javascript:void(0)" onclick="javascript:basket.orderInitiator();">선택한 상품 주문</a>
	                </div>
	            </div>
        </form>
     </div>
<c:import url="/Main/footer"></c:import>	
</body>
</html>
