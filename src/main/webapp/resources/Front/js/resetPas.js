/**
 * 重置密码js
 */
 $(function(){
 	$("#btn").on("click",function(){
 		var p1 = $("#inputPassword1").val();
 		var p2 = $("#inputPassword2").val();
 		var p3 = $("#inputPassword3").val();
 		if(p1===''||p2===''||p3===''){
 			$.alert({
    			title: '提示!',
    			content: '确认数据输入完整!'
 			});
 			return;
 		}
 		if(!($("#inputPassword2").val()===$("#inputPassword3").val())){
 			$.alert({
    			title: '提示!',
    			content: '新密码不一致,请确认!'
 			});
 			return;
 		}
 		var index = layer.load();
 		$.ajax({
 			url:"/blog/doResetPas",
			type: "post",
			data: $("#form").serialize(),
			dataType: "json",
			success: function(data){
				layer.close(index);
				if(data.success){
					layer.msg("修改成功,去登录", {icon: 1,time:3000});
					location.href="/login";
				}else{
					layer.msg(data.errmsg, {icon: 1,time:2000});
				}
			},
			error:function(e,data){
//			    console.log(e);	
//			    console.log(data);	
			}
 		})
 	});
 })