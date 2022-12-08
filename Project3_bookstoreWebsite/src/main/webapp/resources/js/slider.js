$(document).ready(function(){
	//원버튼의 동적생성
	var cBox = $('<div class="controlPanel"></div>');

	var btnNum = $('.mSlider li').size(); //사진을 담은 li의 개수를 받는 변수

	var cBtn = ''; //원버튼인 a태그를 담을 변수

	for(var i=0;i<btnNum;i++){ //li개수만큼 a태그를 반복
		cBtn += '<a href="#" class="cBtn"></a>';
	}

	$('.mSlider').append(cBox);
	cBox.append(cBtn);


	//prev와 next버튼의 동적생성
	var prev = $('<a href="#prevBtn" class="prevBtn" title="이전버튼">&lt;</a>');
	var next = $('<a href="#nextBtn" class="nextBtn" title="다음버튼">&gt;</a>');

	$('.mSlider').append(prev);
	$('.mSlider').append(next);

	//play와 stop버튼의 동적생성
	var play = $('<a href="#playBtn" class="playBtn" title="시작버튼"></a>');
	var stop = $('<a href="#pauseBtn" class="pauseBtn" title="일시정지 버튼"></a>');

	$('.mSlider').append(play);
	$('.mSlider').append(stop);





	//초기실행
	$('.playBtn').css('display','none'); //시작버튼 안보이게 처리
	$('.sliderText').fadeOut(0); //설명안보이게 처리


	//이미지들을 움직여주는 함수 - 여러 버튼이 이미지들을 움직이기 때문
	function moveSlider(index){
		//index매개변수는 이미지의 (li)배열번호, 원버튼의 배열번호

		
		//사진 fade처리
		$('.mSlider li').fadeOut('fast');
		$('.mSlider li').eq(index).fadeIn('slow');

		//text처리
		$('.sliderText').fadeOut(0);
		$('.mSlider li').eq(index).find('.sliderText').fadeIn('slow');

		//원버튼 활성화
		$('.cBtn').removeClass('on');
		$('.cBtn').eq(index).addClass('on');
	}

	//초기값
	var basic = 0;
	var num = $('.mSlider li').size()-1; //사진이 몇개인지 반환하는 메서드 - 배열번호에 맞춤
	moveSlider(basic); //첫번째 사진 보여주기

	//5초마다 자동변경
	var auto = setInterval(function(){
		if(basic==num){
			basic = 0;
		}else{
			basic++;
		}

		moveSlider(basic);
	},5000);


	//원버튼클릭시
	$('.cBtn').click(function(){
		//클릭당한 원의 배열번호를 받는 변수
		var index = $(this).index();

		moveSlider(index);

		//원버튼을 클릭하면 자동실행이 멈춤처리
		clearInterval(auto);

		$('.playBtn').css('display','block');
        $('.pauseBtn').css('display','none');
	});


	//플레이버튼 클릭시 - 다시 실행
	$('.playBtn').click(function(){
		//멈춰있는 사진의 배열번호를 찾기 - 파란원으로 활성화되어 있는 버튼을 배열번호
		basic = $('.controlPanel .on').index();

		auto = setInterval(function(){
			if(basic==num){
				basic = 0;
			}else{
				basic++;
			}

			moveSlider(basic);
		},5000);
		$(this).css('display','none');
		$('.pauseBtn').css('display','block');
	});


	//일시정지버튼 클릭했을 때
	$('.pauseBtn').click(function(){
        clearInterval(auto);
        $('.playBtn').css('display','block');
        $(this).css('display','none');
    });


	//다음버튼을 클릭했을 때
	$('.nextBtn').click(function(){
		basic = $('.controlPanel .on').index();
		if(basic==num){
			basic = 0;
		}else{
			basic++;
		};
		moveSlider(basic);
		clearInterval(auto);
        $('.playBtn').css('display','block');
        $('.pauseBtn').css('display','none');
	});


	//이전버튼을 클릭했을 때
	$('.prevBtn').click(function(){
		basic = $('.controlPanel .on').index();
		if(basic==0){
			basic = num;
		}else{
			basic--;
		};
		moveSlider(basic);
		clearInterval(auto);
        $('.playBtn').css('display','block');
        $('.pauseBtn').css('display','none');
	});
});