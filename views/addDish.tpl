<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>表单模块 - layui</title>
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
<form class="layui-form layui-form-pane1" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">菜品名称</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="required|title" required placeholder="标题不超过20个汉字" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">菜单分类</label>
      <div class="layui-input-block">
        <select name="quiz" lay-verify="required" lay-verType="tips">
          <option value="荤菜">荤菜</option>
          <option value="素菜">素菜</option>
        </select>
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">菜品售价</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="price_min" lay-verify="required|number" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">菜品原价</label>
      <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="price_min" lay-verify="required|number" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">菜品库存</label>
    <div class="layui-input-inline" style="width: 100px;">
        <input type="text" name="price_min" autocomplete="off" class="layui-input">		
    </div>
	<div class="layui-input-inline" style="width: 80px;">
		<select name="quiz" lay-verify="required" lay-verType="tips">
          <option value="份">份</option>
          <option value="盒">盒</option>
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
    	<button class="layui-btn layui-btn-primary" id="test2" style="width:80px;height:80px;"><i class="layui-icon">&#xe654;</i></button>
	</div>
	</div>
	<label class="layui-form-mid layui-word-aux" style="margin-left:40px;">点击图片可进行删除，最多只能上传10张，大小不能超过3M</label>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">菜品描述</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" id="detail"></textarea>
    </div>
  </div>
  <div class="layui-form-item" pane>
    <label class="layui-form-label">上架时间</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="立即上架售卖" title="立即上架售卖">
    </div>
	<div class="layui-input-block">
      <input type="radio" name="sex" value="自定义上架时间" title="自定义上架时间">
	  <input type="text" name="date" id="date" lay-verify="date" placeholder="选择上架售卖时间" autocomplete="off" class="layui-input"  style="width: 140px;margin-left:10px;"> 
	</div>
	<div class="layui-input-block">
      <input type="radio" name="sex" value="暂不售卖，放入仓库" title="暂不售卖，放入仓库">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="*">确认</button>
      <button type="reset" class="layui-btn layui-btn-primary">关闭</button>
    </div>
  </div>
</form>

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
  
	//日期
	laydate.render({
		elem:'#date'
	}); 
	
	//图片上传
	  upload.render({
	    elem: '#test2'
	    ,url: ''
	    ,multiple: true
		,exts: 'jpg|png|gif|bmp|jpeg'
		,auto:false
	    ,number: 10
	    ,size: 3*1024
		,bindAction: '#btn'
	    ,choose: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" id="upload_img_'+index+'" style="width:80px;height:80px;padding-left:10px;">')
	      	$("#upload_img_"+index).bind('click',function(){
                delete file[index];
                $(this).remove();
             });
		});
	    }
	    ,done: function(res){
	      //上传完毕
	    }
	    ,allDone: function(obj){
	      console.log(obj)
	    }
	  }); 
	//文本域
	layedit.build('detail',{
		hideTool:['image']
	});

	//自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题也太短了吧';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
  });
  
  //事件监听
  form.on('select', function(data){
    console.log('select: ', this, data);
  });
  
  form.on('select(quiz)', function(data){
    console.log('select.quiz：', this, data);
  });
  
  form.on('select(interest)', function(data){
    console.log('select.interest: ', this, data);
  });
  
  
  
  form.on('checkbox', function(data){
    console.log(this.checked, data.elem.checked);
  });
  
  form.on('switch', function(data){
    console.log(data);
  });
  
  form.on('radio', function(data){
    console.log(data);
  });
  
  //监听提交
  form.on('submit(*)', function(data){
    console.log(data)
    return false;
  });
  
});
</script>

<script>
layui.use('jquery', function(){
  var $ = layui.jquery;
  var submit = function(){
    return false;
  };
  $('#test').on('submit', function(){
     return false
  });
  $('#test').on('submit', function(){
     return true
  });
});
</script>
</body>
</html>