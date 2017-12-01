/**
 * 我的博客页面，左侧菜单
 */
$(function(){
	var urlstr = location.href;
	$("#accordion ul a").each(function(){
		if ((urlstr + '/').indexOf($(this).attr('href')) > -1&&$(this).attr('href')!='') {
			$(this).addClass('active');
			$(this).parent().parent().addClass('in');
        } else {
            $(this).removeClass('active');
        }
	})
});	
