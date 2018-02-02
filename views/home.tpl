<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>智慧校园订餐系统</title>
<link rel="stylesheet" href="/static/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">订餐系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">个人中心</a></li>
      <li class="layui-nav-item"><a href="">内容管理</a></li>
      <li class="layui-nav-item"><a href="">统计报表</a></li>
	  <li class="layui-nav-item"><a href="">客服管理</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">系统管理</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          商家
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">菜单</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">菜单管理</a></dd>
            <dd><a href="javascript:;">菜单分组</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">订单</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">客户</a></li>
        <li class="layui-nav-item"><a href="">活动</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
		<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
		  <ul class="layui-tab-title">
		    <li lay-id="11">个人中心</li>
		    <li class="layui-this" lay-id="22">菜单列表</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item">内容1</div>
		    <div class="layui-tab-item  layui-show">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				    <li>所有菜单</li>
				    <li class="layui-this">仓库中</li>
				    <li>出售中</li>
				    <li>已售罄</li>
				  </ul>
				<div class="layui-tab-content">
				  <div class="layui-tab-item">1</div>
				  <div class="layui-tab-item layui-show">
				  	 <div>
					  <div class="layui-inline">
					    <label class="layui-form-label">菜单名称</label>
					    <div class="layui-input-inline" style="width: 100px;">
					      <input type="text" name="price_min"  autocomplete="off" class="layui-input">						 
					    </div>				    
					  </div>
					 <div class="layui-inline">
					    <label class="layui-form-label">菜单价格</label>
					    <div class="layui-input-inline" style="width: 100px;">
					      <input type="text" name="price_min"  autocomplete="off" class="layui-input">
					    </div>					    
					  </div>
					<div class="layui-inline" style="padding-left:30px">
						<button class="layui-btn" id="search">
						  <i class="layui-icon">&#xe615;</i> 查询
						</button>
					</div>
					</div>
					<div style="padding-top:20px">
					<span class="layui-breadcrumb" lay-separator="|">					
					  <i class="layui-icon">&#xe61f;</i>
					  <a id="add">新增</a>				
					  <i class="layui-icon">&#xe62f;</i>
					  <a href="">上架</a>					
					  <i class="layui-icon">&#xe640;</i>
					  <a href="">删除</a>
					</span>
					</div>	
					<div>
					<table class="layui-table" lay-data="{width: 892, height:332, url:'/demo/table/user/', page:true, id:'idTest'}" lay-filter="demo">
					  <thead>
					    <tr>
					      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
					      <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
					      <th lay-data="{field:'username', width:80}">用户名</th>
					      <th lay-data="{field:'sex', width:80, sort: true}">性别</th>
					      <th lay-data="{field:'city', width:80}">城市</th>
					      <th lay-data="{field:'sign', width:160}">签名</th>
					      <th lay-data="{field:'experience', width:80, sort: true}">积分</th>
					      
					      <th lay-data="{field:'classify', width:80}">职业</th>
					      <th lay-data="{field:'wealth', width:135, sort: true}">财富</th>
					      <th lay-data="{field:'score', width:80, sort: true, fixed: 'right'}">评分</th>
					      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
					    </tr>
					  </thead>
					</table>
					<script type="text/html" id="barDemo">
					  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
					  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
					  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
					</script>
					</div>				
				  </div>
				  <div class="layui-tab-item">3</div>
				  <div class="layui-tab-item">4</div>
				</div>
				</div> 
			</div>
		  </div>
		</div>
	</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    ©2018 智慧校园. All Rights Reserved

  </div>
</div>
<script src="/static/layui.js"></script>
<!--<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>-->
<script>
	//JavaScript代码区域
	layui.use(['element','layer','jquery'], function(){
	  var element = layui.element
		,layer=layui.layer
		,$=layui.jquery;
	  //layer.msg("你好");
	$('#add').on('click',function(){
		//layer.msg("点击添加按钮");
		//iframe窗
		layer.open({
		  type: 2,
		  title: false,
		  //closeBtn: 0, //不显示关闭按钮
		  shadeClose: true,
		  shade: false,
		  area: ['893px', '600px'],
		 // offset: 'rb', //右下角弹出
		  //time: 2000, //2秒后自动关闭
		  maxmin: true,
		  anim: 2,
		  content: ['/views/addDish.tpl'], //iframe的url，no代表不显示滚动条
		  cancel: function(index, layero){ 
		  if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
		    layer.close(index)
		  }
		  return false; 
		  },
		});
	});
	});
	
	
</script>

</body>
</html>