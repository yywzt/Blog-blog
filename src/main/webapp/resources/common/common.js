// 首页js create by 2017/8/22
$(function(){
	//点击图标显示搜索框
	$("form[role='search").on("click",function(e) {
	    $("form[role='search']").addClass("active");
	    e.stopPropagation();
	});
	
	$("#search").on("click",function(){
	    if($("form[role='search']").hasClass('active')){
	        $("form[role='search']").addClass("warning");
	    }
	});
	
	//单击其它位置隐藏搜索框
	$("body").on("click",function(){
	    $("form[role='search']").removeClass("active warning");
	});
	
	//根据滚动条状态对右侧导航菜单位置进行移动
	$(window).on('scroll', function(){    //绑定滚动事件
	    if($(document).scrollTop() >200){
	        $("#gotop")[0].setAttribute("style","display:block");
	    }else{
	        $("#gotop")[0].setAttribute("style","display:none");
	    }
	    /*if($(document).scrollTop() < 500){
	        $(".sidebar").removeClass("fixed abs");
	    }
	    if($(document).scrollTop() >= 600 ){
	        $(".sidebar").removeClass("abs");
	        $(".sidebar").addClass('fixed');
	    }
	    if($(document).scrollTop() >= $(document).height() -  $(window).height()-$('.footer').height() - 50){
	        $(".sidebar").removeClass("fixed");
	        $(".sidebar").addClass('abs');
	    }*/
	});
	
	//返回顶部
	$("#gotop").on("click",function(){
	    $('body,html').animate({
	            scrollTop: 0
	        },
	        1000);
	});



    var urlstr = location.href;  

    $("#menu-justnews-menu>li").each(function () {
        if ((urlstr + '/').indexOf($(this).children('a').attr('href')) > -1&&$(this).children('a').attr('href')!='') {
			$(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });
    $("#j-user-wrap>a").each(function () {
        if ((urlstr + '/').indexOf($(this).children('a').attr('href')) > -1&&$(this).children('a').attr('href')!='') {
			$(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });
    
    /**文章处悬浮显示菜单*/
    $(".dropdown.menu-item").mousemove(function(){
    	$(this).find("ul").show();
    })
    $(".dropdown.menu-item").mouseout(function(){
    	$(this).find("ul").hide()
    })
    
    $('.panel-collapse.collapse').on('hidden.bs.collapse', function () {
		$($(this)).prev().find(".menu_dropdown-arrow").toggleClass("Flip");
	})
    $('.panel-collapse.collapse').on('shown.bs.collapse', function () {
		$($(this)).prev().find(".menu_dropdown-arrow").toggleClass("Flip");
	})
})
