/**
 * 文章页面(赞、评论js)
 */
 
 (function ($) {
		$.extend({
			tipsBox: function (options) {
				options = $.extend({
					obj: null,  //jq对象，要在那个html标签上显示
					str: "+1",  //字符串，要显示的内容;也可以传一段html，如: "<b style='font-family:Microsoft YaHei;'>+1</b>"
					startSize: "12px",  //动画开始的文字大小
					endSize: "30px",    //动画结束的文字大小
					interval: 600,  //动画时间间隔
					color: "red",    //文字颜色
					callback: function () { }    //回调函数
				}, options);
				$("body").append("<span class='num'>" + options.str + "</span>");
				var box = $(".num");
				var left = options.obj.offset().left + options.obj.width() / 2;
				var top = options.obj.offset().top - options.obj.height();
				box.css({
					"position": "absolute",
					"left": left + "px",
					"top": top + "px",
					"z-index": 9999,
					"font-size": options.startSize,
					"line-height": options.endSize,
					"color": options.color
				});
				box.animate({
					"font-size": options.endSize,
					"opacity": "0",
					"top": top - parseInt(options.endSize) + "px"
				}, options.interval, function () {
					box.remove();
					options.callback();
				});
			}
		});
	})(jQuery);
	  
	function niceIn(prop){
		prop.find('i').addClass('niceIn');
		setTimeout(function(){
			prop.find('i').removeClass('niceIn');	
		},1000);		
	}
	$(function () {
		$(".btn-zan").click(function () {
			$.tipsBox({
				obj: $(this),
				str: "+1",
				callback: function () {
				}
			});
			niceIn($(this));
			$.ajax({
				url:"/article/Fabulous",
			 	type: "post",
			    data: {"content_id":$("#content").val()},
			    dataType: "json",
			    success: function(data){
			    	if(data.success){
			    		$(".entry-action-num").html(Number($(".entry-action-num").text())+1);
			    	}
			    },
			    error:function(e,data){
//			        console.log(e);	
//			        console.log(data);	
			    }
			})
		});
	});