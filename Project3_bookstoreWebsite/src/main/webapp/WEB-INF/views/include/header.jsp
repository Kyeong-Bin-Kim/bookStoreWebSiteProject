<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

<!-- 글골 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js" ></script> 
  </head>
  <body>
  <div style="width:1900px;">
    <nav class="navbar navbar-light">
        <div class="container-fluid">
        
          <a href="${root}Main/center" class="navbar-brand" style="font-family: 'Frank Ruhl Libre', serif; font-size:35px"><span class="material-symbols-outlined" style="font-size:36px; vertical-align: middle;">menu_book</span>Ezen Book Store</a>
          <form:form action="${root }book/BkList" method="get" modelAttribute="searchBean" class="d-flex">
            <form:input style="height:50px;width:500px;" class="form-control me-2" path="search_word" placeholder="Search" aria-label="Search"/>
            <form:button style="height:50px;" class="btn btn-outline-success" type="submit">Search</form:button>
          </form:form>
          <div class="btn-group" role="group" aria-label="Basic example">
		<c:if test="${mb_id != '0'}">         
		<h6 style="background:#f0f8ff; font-family:'Noto Sans KR', sans-serif; font-size:15px; margin-bottom:0px; padding-top:3px; width:100px; height:50px; border-radius: 20px 20px 20px 20px / 15px 15px 15px 15px; border:5px inset #f0f8ff;">${sessionScope.mb_id}님<br>반갑습니다.</h6>&nbsp;&nbsp;
		</c:if>
		<c:if test="${mb_id == 'admin'}">
			<button type="button" onclick="location.href='${root }book/BkInsert'">책 등록</button>
			<button type="button" onclick="location.href='${root }member/Mblist'">전체회원목록</button>
			<button type="button" onclick="location.href='${root }order/Or_alllist'">전체구매목록</button>
		  </c:if>
		 
		  <c:choose>
		  <c:when test="${mb_id == '0'}">
				<button type="button" onclick="location.href='${root }member/Mblogin'">로그인</button>
				<button type="button" onclick="location.href='${root }member/Mbinsert'">회원가입</button> 	
		  </c:when>	
		  <c:otherwise>
				<button type="button" onclick="location.href='${root }member/Mblogout'">로그아웃</button>
				<ul  style="background-color:#f8f9fa;padding-left: 0px;"class="primary-navigation-ul horizontal-mega-menu">
					<li class="buddha-menu-item primary-navigation-li">
						<button type="button" onclick="location.href='${root }member/Mbselect?mb_id2=${mb_id }'">마이페이지</button>
						<button class="toggle-menu-btn" style="display:none;" onclick="return toggleSubmenu(this)">
						<i class="fa fa-plus-circle" aria-hidden="true"></i>
						</button>
						<ul style="background-color:white;" class="mm-submenu tree">
							<li data-href="${root }wish/wish_info?wi_mbid=${mb_id }&page=1" aria-label="isoSPEC" data-no-instant="">
								<a data-href="${root }wish/wish_info?wi_mbid=${mb_id }&page=1"  href="" aria-label="isoSPEC" data-no-instant="" onclick="mmGoToPage(this, event); return false;">찜목록</a>
							</li>							
							<li data-href="${root}cart/cart_info?ca_mbid=${mb_id }" aria-label="Adam Equipment" data-no-instant="">
								<a data-href="${root}cart/cart_info?ca_mbid=${mb_id }" href="" aria-label="Adam Equipment" data-no-instant="" onclick="mmGoToPage(this, event); return false;">장바구니</a>
							</li>				
							<li data-href="${root}order/Or_list?mb_id=${mb_id }" aria-label="Environmental Express" data-no-instant="">
								<a data-href="${root}order/Or_list?mb_id=${mb_id }" href="" aria-label="Environmental Express" data-no-instant="" onclick="mmGoToPage(this, event); return false;">주문내역</a>
							</li>
						</ul>
				</ul>
		  </c:otherwise>  
		  
		  </c:choose>         
          </div>
        </div>
      </nav>
      
      
    <div id="shopify-section-navigation-primary" class="shopify-section">
	<div class="section nav-section">
		<div class="section-inner">
			<nav class="chemical-header-nav">
				<button class="menu-toggle hide-desktop">
					<div class="menu-toggle-text noselect">
						Menu
					</div>
					<div id="nav-icon" class="noselect">
						<span></span>
						<span></span>
						<span></span>
					</div>
				</button>
				<ul  style="background-color:#f8f9fa"class="primary-navigation-ul horizontal-mega-menu">
					<li class="buddha-menu-item primary-navigation-li">
						<a href="${root }book/BkList?bk_local=국내&bk_genre=전체" style="color:#8685EF">국내도서&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i><button class="toggle-menu-btn" style="display:none;" onclick="return toggleSubmenu(this)"><i class="fa fa-plus-circle" aria-hidden="true"></i></button></a>
						<ul style="background-color:white" class="mm-submenu tree">
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=소설" aria-label="isoSPEC" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=소설"  href="" aria-label="isoSPEC" data-no-instant="" onclick="mmGoToPage(this, event); return false;">소설</a>
							</li>							
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=인문" aria-label="Adam Equipment" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=인문" href="" aria-label="Adam Equipment" data-no-instant="" onclick="mmGoToPage(this, event); return false;">인문</a>
							</li>				
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=취미" aria-label="Environmental Express" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=취미" href="/collections/brand-environmental-express" aria-label="Environmental Express" data-no-instant="" onclick="mmGoToPage(this, event); return false;">취미</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=경제" aria-label="Environmental Sampling Supply" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=경제" href="/collections/brand-environmental-sampling-supply" aria-label="Environmental Sampling Supply" data-no-instant="" onclick="mmGoToPage(this, event); return false;">경제</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=자기개발" aria-label="Glass Expansion" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=자기개발" href="/collections/brand-glass-expansion" aria-label="Glass Expansion" data-no-instant="" onclick="mmGoToPage(this, event); return false;">자기개발</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=예술" aria-label="Goodfellow" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=예술" href="/collections/brand-goodfellow" aria-label="Goodfellow" data-no-instant="" onclick="mmGoToPage(this, event); return false;">예술</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=기술" aria-label="High-Purity Standards" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=기술" href="/collections/brand-high-purity-standards" aria-label="High-Purity Standards" data-no-instant="" onclick="mmGoToPage(this, event); return false;">기술</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=국내&bk_genre=잡지" aria-label="Inorganic Ventures" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=국내&bk_genre=잡지" href="/collections/brand-inorganic-ventures" aria-label="Inorganic Ventures" data-no-instant="" onclick="mmGoToPage(this, event); return false;">잡지</a>
							</li>
						</ul>
					
					<li class="buddha-menu-item primary-navigation-li">
						<a href="${root }book/BkList?bk_local=해외&bk_genre=전체" style="color:#8685EF	">해외도서&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i><button class="toggle-menu-btn" style="display:none;" onclick="return toggleSubmenu(this)"><i class="fa fa-plus-circle" aria-hidden="true"></i></button></a>
						<ul class="mm-submenu tree" style="background-color:white">
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=소설" aria-label="isoSPEC" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=소설" href="/collections/brand-isospec" aria-label="isoSPEC" data-no-instant="" onclick="mmGoToPage(this, event); return false;">소설</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=인문" aria-label="Adam Equipment" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=인문" href="/collections/brand-adam-equipment" aria-label="Adam Equipment" data-no-instant="" onclick="mmGoToPage(this, event); return false;">인문</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=취미" aria-label="Environmental Express" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=취미" href="/collections/brand-environmental-express" aria-label="Environmental Express" data-no-instant="" onclick="mmGoToPage(this, event); return false;">취미</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=경제" aria-label="Environmental Sampling Supply" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=경제" href="/collections/brand-environmental-sampling-supply" aria-label="Environmental Sampling Supply" data-no-instant="" onclick="mmGoToPage(this, event); return false;">경제</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=자기개발" aria-label="Glass Expansion" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=자기개발" href="/collections/brand-glass-expansion" aria-label="Glass Expansion" data-no-instant="" onclick="mmGoToPage(this, event); return false;">자기개발</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=예술" aria-label="Goodfellow" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=예술" href="/collections/brand-goodfellow" aria-label="Goodfellow" data-no-instant="" onclick="mmGoToPage(this, event); return false;">예술</a></li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=기술" aria-label="High-Purity Standards" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=기술" href="/collections/brand-high-purity-standards" aria-label="High-Purity Standards" data-no-instant="" onclick="mmGoToPage(this, event); return false;">기술</a>
							</li>
							<li data-href="${root }book/BkList?bk_local=해외&bk_genre=잡지" aria-label="Inorganic Ventures" data-no-instant="">
								<a data-href="${root }book/BkList?bk_local=해외&bk_genre=잡지" href="/collections/brand-inorganic-ventures" aria-label="Inorganic Ventures" data-no-instant="" onclick="mmGoToPage(this, event); return false;">잡지</a>
							</li>
						</ul>
					
					<li class="buddha-menu-item primary-navigation-li"><a data-href="${root }order/Or_bestSeller" href="/pages/about" aria-label="About" data-no-instant="" onclick="mmGoToPage(this, event); return false;" style="color:#008BD0">베스트셀러</a></li>
					<li class="buddha-menu-item primary-navigation-li"><a data-href="${root }book/BkDateList" href="/pages/special-offers" aria-label="Special Offers" data-no-instant="" onclick="mmGoToPage(this, event); return false;" style="color:#008BD0">신상품</a></li>
					<li class="primary-navigation-li buddha-disabled">
						<a href="/" title="">Home</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</div>

      
  </body>
</html>