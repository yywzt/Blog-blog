/**
 * 
 */
 $(function(){
	$.validator.setTheme('bootstrap', {
        validClass: 'has-success',
        invalidClass: 'has-error',
        bindClassTo: '.form-group',
        formClass: 'n-default n-bootstrap',
        msgClass: 'n-right'
    });
    
    $('#form').validator({
		stopOnError: false, 　　　　　　　　//提交时验证不通过就会停止继续验证
		timely: true, 　　　　　　　　　　　//鼠标离开控件时是否实时验证
//		theme: "yellow_right_effect", 　//样式主题，插件自带了5中样式，在 zh_CN 文件中可以找到相应的样式
		valid: function (form) {　//表单验证通过，提交表单到服务器
//			location.href='/doLogin?'+$("#form").serialize();
			var index = layer.load();
			$.ajax({
				url:"/doLogin",
			 	type: "post",
			    data: $("#form").serialize(),
			    dataType: "json",
			    success: function(data){
			    	layer.close(index);
			    	if(data.success){
//			    		layer.msg('登录成功', {icon: 1,time:2000});
			    		location.href=data.url;
			    	}else{
			    		if(data.usernamemsg!=null){
			    			layer.msg(data.usernamemsg, {icon: 1,time:1000});
			    		}else if(data.userpwdmsg!=null){
			    			layer.msg(data.userpwdmsg, {icon: 1,time:1000});
			    		}else{
			    			layer.msg(data.errmsg, {icon: 1,time:2000});
			    		}
			    	}
			    },
			    error:function(e,data){
//			        console.log(e);	
//			        console.log(data);	
			    }
			});
		}　　　
	});
	$("#submit").click(function(){
		//触发提交的方法
		$('#form').trigger("validate");
	});
	
    $('#regForm').validator({
		stopOnError: false, 　　　　　　　　//提交时验证不通过就会停止继续验证
		timely: true, 　　　　　　　　　　　//鼠标离开控件时是否实时验证
//		theme: "yellow_right_effect", 　//样式主题，插件自带了5中样式，在 zh_CN 文件中可以找到相应的样式
		valid: function (form) {　//表单验证通过，提交表单到服务器
			if(!$("#check").prop("checked")){
				layer.msg('请勾选接收协议', {icon: 1,time:2000});
				return;
			}
			var index = layer.load();
			$.ajax({
				url:"/doRegister",
			 	type: "post",
			    data: $("#regForm").serialize(),
			    dataType: "json",
			    success: function(data){
			    	layer.close(index);
			    	if(data.success){
			    		layer.msg('注册成功', {icon: 1,time:20000});
			    		window.location.href='/login';
			    	}else{
			    		if(data.usernamemsg!=null){
			    			layer.msg(data.usernamemsg, {icon: 1,time:1000});
			    		}else if(data.userpwdmsg!=null){
			    			layer.msg(data.userpwdmsg, {icon: 1,time:1000});
			    		}else if(data.userpwd_relmsg!=null){
			    			layer.msg(data.userpwd_relmsg, {icon: 1,time:1000});
			    		}else if(data.verificodemsg!=null){
			    			layer.msg(data.verificodemsg, {icon: 1,time:1000});
			    		}else{
			    			layer.msg(data.errmsg, {icon: 1,time:2000});
			    		}
			    		$("#code").click();
			    		$("#verificode").val(null);
			    	}
			    },
			    error:function(e,data){
			        console.log(e);	
			        console.log(data);	
			    }
			});
		}　　　
	});
	$("#register").click(function(){
		//触发提交的方法
		$('#regForm').trigger("validate");
	});
	
 })