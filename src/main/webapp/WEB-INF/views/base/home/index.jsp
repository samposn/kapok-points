<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>系统管理</title>
	
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
	<link rel="stylesheet" href="${ctx}/resources/css/gxwlui.css">
	<link rel="stylesheet" href="${ctx}/resources/css/base.css">
</head>

<body>
<div class="container">
	<div class="left">
		<div id="nav" class="easyui-accordion" data-options="border:false"></div>
	</div>
	<div class="right">
		<div id="contentTabs" class="easyui-tabs g-tabs2" style="width:100%; height:100%;"></div>
	</div>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gxwl.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/base.js"></script>

<script type="text/javascript">
$(function() {

	let nav = $("#nav");

	_addPanel(nav, main.resources.array)

	function _addPanel(nav, panels) {
		nav.accordion({
			onSelect: function (title,index) {
				var panel = nav.accordion('getPanel', index),
						$ul = panel.find('.left-menu>ul');
				if (!panel.hasClass('added')) {
					_addItem($ul, $ul.attr('data-resource-id'));
					panel.addClass('added');
				}
			}
		});
		panels.sort(function(a, b) {
			return a.seq - b.seq;
		});
		panels.forEach(function(x, i) {
			let icon = x.imagePath || 'fa fa-file-text';
			x.title = '<i class="'+icon+'"></i>&nbsp;&nbsp;&nbsp;&nbsp;'+x.resourceLabel;
			nav.accordion('add', {
				title: x.title,
				content: '<div class="left-menu"><ul data-resource-id="'+x.resourceId+'"></ul></div>',
				selected: i === 0
			});
		});
	}

	function _addItem($ul, resourceId) {
		$.ajax({
			url: main.ctx+'/resource/getMenuByModuleParent/'+resourceId
		}).done(function(data) {
			if(data){
				data.forEach(function(x) {
					var icon = x.imagePath || 'fa fa-file-text',
							id = x.id,
							label = x.resourceLabel,
							url = x.url && main.ctx + x.url;
					$ul.append('<li><a href="#" data-resource-id="'+id+'" data-label="'+label+'" data-url="'+url+'" data-icon="'+icon+'"><i class="'+icon+'"></i>&nbsp;&nbsp;&nbsp;&nbsp;'+label+'</a></li>');
				});
			}
		});
	}

});
</script>
</body>
</html>