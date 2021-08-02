<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${system_name}-${company_name}</title>
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
	<link rel="stylesheet" href="${ctx}/resources/css/gxwlui.css">
	<link rel="stylesheet" href="${ctx}/resources/css/page.css">
</head>

<body>
<div class="content">
	<div id="list" style="height: 300px;padding-top:40px">
		<label class="form-label" title="设置链接有效时间"style="width:130px;">设置链接有效时间</label>
		<input id="expiresTime" class="easyui-datetimebox" style="width:150px;">
	</div>
	<div id="toolbar" class="dialog-button">
		<a id="confirm" href="javascript:void(0);" class="easyui-linkbutton g-button" onclick="window.actions.confirm($('#expiresTime').datetimebox('getValue'));"><i class="fa fa-check"></i>确定</a>
		<a id="cancel" href="javascript:void(0);" class="easyui-linkbutton g-button" onclick="window.actions.cancel();"><i class="fa fa-times"></i>取消</a>
	</div>
</div>

<script type="text/javascript" src="${ctx}/resources/js/jquery-easyui-1.3.5/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/sis.js"></script>

<script type="text/javascript">
	$(function() {
		let expiresTime = new Date();
		expiresTime.setMinutes(expiresTime.getMinutes() + ${productUrlExpires});
		$('#expiresTime').datetimebox('setValue', expiresTime.formatDate('yyyy-MM-dd hh:mm:ss'));
	});
</script>

</body>
</html>