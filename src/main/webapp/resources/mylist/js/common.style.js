
$(window).on('scroll',function(){
    var top= $(window).scrollTop();
    if(top > 80){
        $('#nav_bar').addClass('active');
    }else{
        $('#nav_bar').removeClass('active');
    }
});