<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>메인 화면</title>
<style>
.d-block w-70{
text-aling:center;
margin:auto;
}
img{
margin:auto;
display:block;	
}
.carousel-control-prev{
left
}

</style>

</head>

<body>
<c:import url="/Main/header"></c:import>
<br>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/banner/221117/i_1624_450_2.jpg" alt="First slide" style="width:1200px; height:340px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/banner/221117/i_1624_450_1.jpg" alt="Second slide" style="width:1200px; height:340px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-70" src="http://image.kyobobook.co.kr/newimages/adcenter/IMAC/creatives/2022/11/17/66916/newbook.png" alt="Third slide" style="width:1200px; height:340px;">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" style="left:300px; top:30px">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" style="left:1300px; top:30px">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<br><br>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="7" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="9"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/event/46d478a250114c66ae3f77ba93888b80.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/event/c4b077d765c44375a8e90a3018c48190.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/event/9056dde89dd449c894d94c90037e4177.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" style="left:300px; top:10px">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="left:1300px; top:10px">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br><br>
<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/event/da80c55a1b0b44388ebe8f1f78e094ed.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/event/0f2d8f2294c84622ab91cd9a7a15dd8f.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-70" src="https://contents.kyobobook.co.kr/pmtn/2022/event/bbcca3fb014a4285ae16932fde770da3.jpg" alt="Third slide">
    </div>
  </div>
</div>
<br><br><br>
<c:import url="/Main/footer"></c:import>
</body>
</html>