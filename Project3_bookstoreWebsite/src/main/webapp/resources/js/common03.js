$(document).ready(function(){
	var h = $('.notice li').height();
	$('.notice li').last().prependTo('.notice ul');
	$('.notice ul').css('top',-h);
	
	var noticeMove = setInterval(function(){
		$('.notice ul').animate({
			top: '-=' + h
		},'fast',function(){
			//첫번째가 리스트가 마지막 리스트로 이동
			$(this).find('li').first().appendTo(this);
			$(this).css('top',-h);
		});
	},3000);
	
	
	
	$('.notice .top').click(function(){
		clearInterval(noticeMove);
		$('.notice ul').animate({
			top: '-=' + h
		},100,function(){
			$(this).find('li').first().appendTo(this);
			$(this).css('top',-h);
		});
	});
	
	$('.notice .bottom').click(function(){
		clearInterval(noticeMove);
		$('.notice ul').animate({
			top: '+=' + h
		},100,function(){
			$(this).find('li').last().prependTo(this);
			$(this).css('top',-h);
		});
	});
	
});



