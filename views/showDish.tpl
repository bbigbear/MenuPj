<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>新增菜品</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">

  <link rel="stylesheet" href="/static/css/layui.css">

<style>
body{padding: 10px;}
</style>
</head>
<body>
{{range .dish_info}}
<form class="layui-form layui-form-pane1" action="" id="dish_show">
  <div class="layui-form-item">
    <label class="layui-form-label">菜品名称</label>
    <div class="layui-input-block">
<!--     <input type="text" name="title" lay-verify="required|title" required placeholder="标题不超过20个汉字" autocomplete="off" class="layui-input">-->
	  <input type="text" name="Name" id="name" value="{{.Name}}" placeholder="标题不超过20个汉字" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">菜单分类</label>
      <div class="layui-input-block">
        <select name="Classify" id="classify" value="{{.Classify}}" lay-verType="tips">
          <option>荤菜</option>
          <option>素菜</option>
        </select>
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">菜品售价</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="Sell_price" id="sell_price" value="{{.Sell_price}}" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">菜品原价</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="Original_price" id="original_price" value="{{.Original_price}}" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">菜品库存</label>
    <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="Stocks" id="stocks" autocomplete="off" value="{{.Stocks}}" class="layui-input">		
    </div>
	<div class="layui-input-inline" style="width: 80px;">
		<select name="Unit" id="unit" value="{{.Unit}}" lay-verType="tips">
          <option>份</option>
          <option>盒</option>
        </select>
	</div>
	<div class="layui-form-mid layui-word-aux">库存为0时，会放入【售罄】的菜单列表</div>
  </div>
  <div class="layui-form-item">
	<div class="layui-upload">
<!--	  <button type="button" class="layui-btn" id="test2">多图片上传</button> -->
	<!--  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
	    <div class="layui-upload-list" id="demo2">
		</div>
	 </blockquote>-->
	<label class="layui-form-label">菜品图片</label>
	<div class="layui-upload-list" id="demo2">
<!--    	<button class="layui-btn layui-btn-primary" id="test2" style="width:80px;height:80px;"><i class="layui-icon">&#xe654;</i></button>-->
		<input type="file" name="file" id="file[]" class="layui-upload-file">
	</div>
	</div>
<!--	<button class="layui-btn layui-btn-primary" id="btn1" style="width:80px;height:80px;">图片上传</button>-->
	<label class="layui-form-mid layui-word-aux" style="margin-left:40px;">点击图片可进行删除，最多只能上传10张，大小不能超过3M</label>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">菜品描述</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" name="Info" id="info" value="{{.Info}}"></textarea>
    </div>
  </div>
  <div class="layui-form-item" pane>
    <label class="layui-form-label">上架时间</label>
    <div class="layui-input-block">
      <input type="radio" name="Status" value="0" title="立即上架售卖">
    </div>
	<div class="layui-input-block">
      <input type="radio" name="Status" value="1" title="自定义上架时间">
	  <input type="text" name="Time" id="time" value="{{.Time}}"  lay-verify="date" placeholder="选择上架售卖时间" autocomplete="off" class="layui-input"  style="width: 150px;margin-left:10px;"> 
	</div>
	<div class="layui-input-block">
      <input type="radio" name="Status" value="2" title="暂不售卖，放入仓库">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
<!--      <button class="layui-btn" id="add">确认</button>-->
<!--	  <input type="hidden" id="pic_path">-->
<!--      <button type="reset" class="layui-btn layui-btn-primary">关闭</button>-->
    </div>
  </div>
</form>
{{end}}
<br><br><br>


<script src="/static/layui.js"></script>
<!-- <script src="../build/lay/dest/layui.all.js"></script> -->

<script>
layui.use(['form','laydate','upload','jquery','layedit'], function(){
  var form = layui.form
  ,laydate=layui.laydate
  ,upload = layui.upload
  , $ = layui.jquery
  ,layedit=layui.layedit;
	//文本域
	//var index=layedit.build('info',{
	//	hideTool:['image']
	//});
  
	//日期
	//laydate.render({
	//	elem:'#time'
	//	,type: 'datetime'
	//});
    	//初始化
 	$(function(){
		//alert({{.c}})
		//alert({{.u}})
		//alert({{.i}})
		$("#classify").val({{.c}})
		$("#unit").val({{.u}})
		//$("input[name='Status']:checked").val({{.s}})
		//$("input[name='Status'][value='{{.s}}']").attr('checked', true);
		$("input[name='Status'][value={{.s}}]").attr("checked",true);
		$("#info").val({{.i}})
		//layedit.build('info'); 
		if({{.s}}!="1"){
			$("#time").val("")
		}
		var list={{.p}}.split(',')
		//alert(list[0])
		for(var i=0;i<list.length-1;i++){
			$('#demo2').append('<img src="'+"/"+list[i]+'" id="upload_img_'+i+'" style="width:80px;height:80px;padding-left:10px;">')
			//$("#upload_img_"+i).bind('click',function(){             
              //  $(this).remove();
            // });
		}
		$("#dish_show").find(":text,input:file,:radio,:checkbox,textarea,select,button").attr("readonly","true");	
		$("#dish_show").find(":text,input:file,:radio,:checkbox,textarea,select,button").attr("disabled","true");	
		form.render();
	});

	//图片上传
	  var path_src=""
	  var uploadList=upload.render({
	    elem: '#test2'
	    ,url: '/v1/put_img'
	    ,multiple: true
		,exts: 'jpg|png|gif|bmp|jpeg'
		,auto:false
	    ,number: 10
	    ,size: 3*1024
		,bindAction: '#add'
		//,field:'myfile'
	    ,choose: function(obj){
	      //预读本地文件示例，不支持ie8
		  //alert(obj);
		  var files = obj.pushFile();
	      obj.preview(function(index, file, result){
	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" id="upload_img_'+index+'" style="width:80px;height:80px;padding-left:10px;">')
	      	$("#upload_img_"+index).bind('click',function(){
                delete files[index];//删除对应的文件
                $(this).remove();
				uploadList.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选			
             });
		});
	    }
	    ,done: function(res){
	      //上传完毕
			//alert("上传完毕")
			console.log(res);
			if (res.code==200){
				path_src=path_src+res.data.src+',';	
			}else{
				layer.msg(res.message);
			}			
	    }
	    ,allDone: function(obj){
	      	//alert(path_src)
			console.log(obj)
			//post json
			uploadForm();
			
			
	    }
	  }); 

	//添加图片
	$('#test2').on('click',function(){
		return false;//禁止form自动提交
	});
	
	function uploadForm(){
		//alert(path_src)
		var data={
			'name':$("#name").val(),
			'classify':$("#classify").val(),
			'pic_path':path_src,
			'original_price':parseFloat($("#original_price").val()),
			'sell_price':parseFloat($("#sell_price").val()),
			'stocks':parseInt($("#stocks").val()),
			'unit':$("#unit").val(),
			'info':layedit.getContent(index),
			'status':parseInt($("input[name='Status']:checked").val()),
			'time':$("#time").val()
			};
			$.ajax({
				type:"POST",
				contentType:"application/json;charset=utf-8",
				url:"/v1/dish/add_action",
				data:JSON.stringify(data),
				async:false,
				error:function(request){
					alert("post error")						
				},
				success:function(res){
					if(res.code==200){
						alert("新增成功")
					}else{
						alert("新增失败")
					}						
				}
			});		
	}
	$('#add').on('click',function(){
		var len=document.querySelector("input[type=file]").files.length;
		if (len==0){
			uploadForm();
		}
		return false;
	});
	

	  
});
</script>

</body>
</html>