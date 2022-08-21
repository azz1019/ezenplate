$(function () {
    $(window).scroll(function(){
        if ($(this).scrollTop() > 50) {
            $("#movetopbtn").fadeIn();
        }else{
            $("#movetopbtn").fadeOut();
        }
    });
    
    $('#movetopbtn').click(function(){
        $('html,body').animate({
            scrollTop : 0
        },1200);
        return false;
    });
    $('#movetopbtn').hover(function () {
        $(this).attr("src","/resources/mylist/photo/pngwing.com2.png");
    },function () {
        $(this).attr("src","/resources/mylist/photo/pngwing.com.png");
    });
});