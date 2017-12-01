/**
 * 
 */
$("#save").click(function(){
	if(testEditor.getMarkdown()===""){
		$.alert({
			title:'提示',
			content:'请输入内容',
		})
	}else{
		$.ajax({
			type: 'POST',
			url: '/blog/markdown/articleType',
			dataType: 'json',
			success: function(data) {
				var list = data.typelist;
				var option='';
				for(var i=0;i<list.length;i++){
					option=option+'<option value='+list[i].type_code+'>'+list[i].type_name+'</option>';
				}
				var index1 = layer.open({
					type: 1,
					title:'文章信息',
	//				skin: 'layui-layer-rim', //加上边框
					area: ['500px', '360px'], //宽高
					content: '<form style="padding: 16px 16px;"><div class="form-group">'
						+'<label for="disabledTextInput">文章标题</label><input type="text" id="title" class="form-control" placeholder="Disabled input">'
						+'</div><div class="form-group">'
						+'<label for="disabledSelect">类型</label>'
						+'<select id="type" class="form-control">'+option+'</select></div></form>',
					btn:['发布','取消'],
					btn1:function(index,layero){
						var title = $("#title").val();
						var type = $("#type").val();
						if(title===""||type===""){
							$.alert({
								title:'提示',
								content:'请重新输入',
							})
							return;
						}
						$.ajax({
							type: 'POST',
							url: '/blog/markdown/publishArticles',
							dataType: 'json',
							data:{"title":title,"type":type,"content":testEditor.getMarkdown()},
							success: function(data) {
								layer.close(index1);
								layer.msg(data.msg, {icon: 1,time:2000});
								testEditor.clear();
							},
							error: function(XMLHttpRequest, textStatus, e) {
		                        alert(XMLHttpRequest.status);
		                        alert(XMLHttpRequest.readyState);
		                        alert(textStatus);
		                    },
						})	
					}
				});
			},
			error: function(XMLHttpRequest, textStatus, e) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            },
		})
	}
})