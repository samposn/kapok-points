<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品授权记录</title>
	
    <link rel="shortcut icon" href="${ctx}/resources/images/logo_16.ico">
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
<div class="g-layout">
	<!-- 按钮区域 -->
<%--	<div class="g-toolbar">--%>
<%--		<shiro:hasPermission name="USER_ADD">--%>
<%--			<a id="add" class="easyui-linkbutton toolbar g-button" onclick="add()"><i class="fa fa-plus"></i>新增</a>--%>
<%--		</shiro:hasPermission>--%>
<%--		<shiro:hasPermission name="USER_DEL">--%>
<%--			<a id="del" class="easyui-linkbutton toolbar g-button" onclick="del()"><i class="fa fa-trash-o"></i>删除</a>--%>
<%--		</shiro:hasPermission>--%>
<%--		<shiro:hasPermission name="USER_EDIT">--%>
<%--			<a id="edit" class="easyui-linkbutton toolbar g-button" onclick="edit()"><i class="fa fa-edit"></i>修改</a>--%>
<%--		</shiro:hasPermission>--%>
<%--		<shiro:hasPermission name="USER_SAVE">--%>
<%--			<a id="save" class="easyui-linkbutton toolbar g-button" onclick="save()"><i class="fa fa-floppy-o"></i>保存</a>--%>
<%--		</shiro:hasPermission>--%>
<%--	</div>--%>

	<!-- 内容区域 -->
	<div id="mainTabs" class="easyui-tabs g-container g-tabs1" data-options="fit:true,border:false">
		<div title="列表" style="position:relative;">
			<div class="query-area">
				<form id="queryForm" method="post">
					<table class="g-form" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="form-cell-1">
									<label class="form-label">UID</label>
									<input name="q_record_uid_LIKE" class="easyui-validatebox form-control">
								</td>
								<td class="form-cell-1">
									<label class="form-label">QQ</label>
									<input name="q_record_qq_LIKE" class="easyui-validatebox form-control">
								</td>
								<td class="form-cell-1">
									<label class="form-label">商品</label>
									<input name="q_product_name_LIKE" class="easyui-validatebox form-control">
								</td>
								<td class="form-cell-1">
									<label class="form-label">版权方</label>
									<input name="q_product_copyright__LIKE" class="easyui-validatebox form-control">
								</td>
							</tr>
							<tr>
								<td class="form-cell-1 f-button"></td>
								<td class="form-cell-1 f-button"></td>
								<td class="form-cell-1 f-button"></td>
								<td class="form-cell-1 f-button">
									<a onclick="query()" class="easyui-linkbutton g-button"><i class="fa fa-search"></i>查询</a>
									<a onclick="clearQueryForm('#queryForm');query()" class="easyui-linkbutton g-button"><i class="fa fa-reply"></i>重置</a>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

			<!-- 列表区域 -->
			<div class="list-area" style="top:70px;">
				<table id="listGrid" style="height:100%"></table>
			</div>
		</div>

	</div>
	
	<div id="roleDialog"></div>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gxwl.js"></script>

<script type="text/javascript">

	var editable = false;
	$(function() {
		
 		$("#listGrid").datagrid({
 			rownumbers : true,
			singleSelect : true,
			autoRowHeight : false,
			border : false,
			pageSize : defaultPageSize,
			pageList : defaultPageList,
			pagination : true,
			url : "${ctx}/record/search",
 			columns : [[
				{field : "record_platform", title : "平台", width : 100, halign : 'center'},
				{field : "record_penname", title : "笔名", width : 100, halign : 'center'},
				{field : "record_uid", title : " UID", width : 100, halign : 'center'},
				{field : "record_qq", title : "QQ", width : 100, halign : 'center'},
				{field : "product_name", title : "商品", width : 100, halign : 'center'},
				{field : "product_price", title : "价格", width : 100, halign : 'center'},
				{field : "product_add_points", title : "获取积分", width : 100, halign : 'center'},
				{field : "product_minus_points", title : " 扣除积分", width : 100, halign : 'center'},
				{field : "product_copyright", title : " 版权方", width : 100, halign : 'center'},
				{field : "product_operator", title : " 经手人", width : 100, halign : 'center'},
				{field : "record_payment_type", title : " 支付方式", width : 100, halign : 'center'},
				{field : "record_tabbao_num", title : " 淘宝订单号", width : 100, halign : 'center'}
 			]]
 		});
		
	});

	function query() {
 		$("#listGrid").datagrid("load", getFormData("#queryForm"));
	}

</script>
</body>
</html>