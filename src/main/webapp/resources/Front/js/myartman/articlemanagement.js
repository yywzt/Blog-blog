/**
 * 
 */
layui.use('table', function(){
	  var table = layui.table;
	  form = layui.form;
	  //第一个实例
	  table.render({
	  	elem: '#demo' ,
	    even:true,
	    size:'lg',
	    url: '/blog/myartman/AllContentInfo' ,//数据接口 
	    page: true , //开启分页 
	    cols: [[ //表头
	    	{checkbox: true,width:60,fixed: 'left'}
	      ,{field: 'content_id', title: 'ID',fixed: 'true',align:'center', width:60, sort: true, /* fixed: 'left' */}
	      ,{field: 'type_name', title: '类型', width:90,}
	      ,{field: 'title', title: '标题', width:120, sort: true,edit:'text',}
	      ,{field: 'content', title: '内容', width:150,} 
	      ,{field: 'create_dt', title: '创建时间',align:'center', width: 160,sort: true}
	      ,{field: 'read_count', title: '阅读量', align:'center',width: 90, sort: true}
	      ,{field: 'laud_count', title: '点赞数',align:'center', width: 90, sort: true}
	      ,{field: 'comment_count', title: '评论数', align:'center',width: 90,sort: true}
	      ,{field: 'dr', title: '是否有效',align:'center', width: 120,fixed: 'right',templet:'#checkboxTpl',unresize: true,}
	      ,{fixed: 'right', title:'操作', width:150, align:'center', toolbar: '#barDemo',} //这里的toolbar值是模板元素的选择器
	    ]] ,
	    done: function(res, curr, count){
		    //如果是异步请求数据方式，res即为你接口返回的信息。
		    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
		    //console.log(res);
		    
		    //得到当前页码
		    //console.log(curr); 
		    
		    //得到数据总量
		    //console.log(count);
		},
	  });
	table.on('edit(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
		//console.log(obj.value); //得到修改后的值
	 	//console.log(obj.field); //当前编辑的字段名
	  	//console.log(obj.data); //所在行的所有相关数据  
	  	var index = layer.load();
	  	$.ajax({
			url:"/blog/myartman/updatarow",
		 	type: "post",
		    data: {content_id:obj.data.content_id,filed:obj.field,value:obj.value,},
		    dataType: "json",
		    success: function(ret){
		    	layer.close(index);
		    	layer.msg(ret.msg, {icon: 1,time:1000});
		    },
		    error:function(e,data){
//		        console.log(e);	
//		        console.log(data);	
		    }
	  	})
	});
	//监听锁定操作
	form.on('checkbox(drDemo)', function(obj){
		layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
		$.ajax({
			url:"/blog/myartman/updatarow",
		 	type: "post",
		    data: {content_id:this.value,filed:this.name,value:obj.elem.checked? '1':'0',},
		    dataType: "json",
		    success: function(ret){
//		    	layer.close(index);
//		    	layer.msg(ret.msg, {icon: 1,time:1000});
		    },
		    error:function(e,data){
//		        console.log(e);	
//		        console.log(data);	
		    }
	  	})
	});
	//监听表格复选框选择
	table.on('checkbox(test)', function(obj){
	  console.log(obj)
	});
	//监听工具条
	table.on('tool(test)', function(obj){
	  var data = obj.data;
	  if(obj.event === 'detail'){
	    layer.msg('ID：'+ data.content_id + ' 的查看操作');
	  } else if(obj.event === 'del'){
	    layer.confirm('真的删除行么', function(index){
	      obj.del();
	      layer.close(index);
	    });
	  } else if(obj.event === 'edit'){
	    layer.alert('编辑行：<br>'+ JSON.stringify(data))
	  }
	});
});