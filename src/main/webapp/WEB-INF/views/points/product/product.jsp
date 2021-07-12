<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>商品管理</title>
	
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
	<div class="g-toolbar">
		<a id="add" class="easyui-linkbutton toolbar g-button" onclick="add()"><i class="fa fa-plus"></i>新增</a>
		<shiro:hasPermission name="USER_DEL">
			<a id="del" class="easyui-linkbutton toolbar g-button" onclick="del()"><i class="fa fa-trash-o"></i>删除</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="USER_EDIT">
			<a id="edit" class="easyui-linkbutton toolbar g-button" onclick="edit()"><i class="fa fa-edit"></i>修改</a>
		</shiro:hasPermission>
		<a id="save" class="easyui-linkbutton toolbar g-button" onclick="save()"><i class="fa fa-floppy-o"></i>保存</a>
		<a id="save" class="easyui-linkbutton toolbar g-button"><i class="fa fa-floppy-o"></i>复制授权地址</a>
	</div>

	<!-- 内容区域 -->
	<div id="mainTabs" class="easyui-tabs g-container g-tabs1" data-options="fit:true,border:false">
		<div title="列表" style="position:relative;">
			<div class="query-area">
				<form id="queryForm" method="post">
					<table class="g-form" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="form-cell-1">
				            		<label class="form-label">商品名称</label>
				            		<input name="q_productName_LIKE" class="easyui-validatebox form-control">
			          			</td>
			          			<td class="form-cell-1">
				            		<label class="form-label">版权方</label>
				            		<input name="q_productCopyright_LIKE" class="easyui-validatebox form-control">
			          			</td>
			          			<td class="form-cell-1 f-button">
									<a onclick="query()" class="easyui-linkbutton g-button"><i class="fa fa-search"></i>查询</a>
									<a onclick="clearQueryForm('#queryForm');query()" class="easyui-linkbutton g-button"><i class="fa fa-reply"></i>重置</a>
								</td>
								<td class="form-cell-1"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

			<!-- 列表区域 -->
			<div class="list-area" style="top:50px;">
				<table id="listGrid" style="height:100%"></table>
			</div>
		</div>

		<!-- 实体详细 -->
		<div id="detailTab" title="详细">
			<form id="dataForm" style="height:100%">
				<input id="productId" name="productId" type="hidden">
				<input id="createrId" name="createrId" type="hidden">
				<input id="createTime" name="createTime" type="hidden">
				<table class="g-form" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="form-cell-1">
				            	<label class="form-label" title="商品">商品</label>
								<input id="productName" name="productName" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="价格">价格</label>
								<input id="productPrice" name="productPrice" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="获取积分">获取积分</label>
								<input id="productAddPoints" name="productAddPoints" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="扣除积分">扣除积分</label>
								<input id="productMinusPoints" name="productMinusPoints" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
						</tr>
						<tr>
							<td class="form-cell-1">
				            	<label class="form-label" title="版权方">版权方</label>
								<input id="productCopyright" name="productCopyright" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="经手人">经手人</label>
								<input id="productOperator" name="productOperator" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
							</td>
							<td class="form-cell-1">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
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

		// 初始化页面时，启用【新增】按钮，禁用【详细】Tab页
		enableButtons(["add"]);
		$("#mainTabs").tabs("disableTab", 1);
		
		$("#mainTabs").tabs({
			onSelect : function(title, index) {
				if (index == 0) {
					editable = false;
					if ($("#listGrid").datagrid("getSelections").length > 0) {
						enableButtons(["add", "edit"]);
						$("#mainTabs").tabs("enableTab", 1);
					} else {
						enableButtons(["add"]);
						$("#mainTabs").tabs("disableTab", 1);
					}
				}
				if (index == 1) {
					if ($("#listGrid").datagrid("getSelections").length > 0) {
						enableButtons(["add", "save"]);
						loadUserData();
					} else {
						enableButtons(["add", "save"]);
					}
				}
			}
		});
		
 		$("#listGrid").datagrid({
 			rownumbers : true,
			singleSelect : true,
			autoRowHeight : false,
			border : false,
			pageSize : defaultPageSize,
			pageList : defaultPageList,
			pagination : true,
			url : "${ctx}/product/search",
 			columns : [[
				{field : "productName", title : "商品名称", width : 100, halign : 'center'},
				{field : "productPrice", title : "商品价格", width : 100, halign : 'right'},
				{field : "productAddPoints", title : "获取积分", width : 100, halign : 'right'},
				{field : "productMinusPoints", title : "扣除积分", width : 100, halign : 'right'},
				{field : "productCopyright", title : "版权方", width : 100, halign : 'center'},
				{field : "productOperator", title : "经手人", width : 100, halign : 'center'}
 			]],
			onSelect : function(rowIndex, rowData) {
				enableButtons(["add", "del", "edit"]);
				$("#mainTabs").tabs("enableTab", 1);
				editable = false;
			},
			onUnselectAll : function(rowIndex, rowData) {
				var tab = $("#mainTabs").tabs("getSelected");
				var index = $("#mainTabs").tabs("getTabIndex", tab);
				if (index == 0) {
					enableButtons(["add"]);
					$("#mainTabs").tabs("disableTab", 1);
				}
				if (index == 1) {
					enableButtons(["add", "save"]);
				}
			},
			onLoadSuccess : function(data) {
				$("#listGrid").datagrid("unselectAll");
			}
 		});
		
	});

	// 启用按钮
	function enableButtons(buttons) {
		$(".easyui-linkbutton.toolbar").linkbutton("disable");
		for (var i = 0; i < buttons.length; i++) {
			$("#"+buttons[i]).linkbutton("enable");
		}
	}
	
	// 新增商品
	function add() {
		editable = true;
		_setFormEditable(editable);
		$("#dataForm").form("clear");
		$("#listGrid").datagrid("unselectAll");
		$("#mainTabs").tabs("enableTab", 1);
		$("#mainTabs").tabs("select", 1);
		$("#productName").focus();
	}

	// 删除商品
	function del() {
		var row = $("#listGrid").datagrid("getSelected");
		if (row) {
			$.messager.confirm("温馨提示", "确定删除商品【" + row.productName + "】?",
				function(r) {
					if (r) {
						$.messager.progress();
						$.ajax({
							type: "GET",
							url : "${ctx}/product/del/" + row.productId,
						}).done(function(res){
							$.messager.progress("close");
							if (res.resultCode === 0) {
								$("#dataForm").form("clear");
								$("#listGrid").datagrid("unselectAll");
								query(); // 刷新列表页
								$.messager.show({
									title: "温馨提示",
									msg: res.resultMsg,
									timeout: 2500,
									showType: "slide"
								});
							} else {
								$.messager.alert("温馨提示", res.resultMsg, "error");
							}
						}).fail(function(jqXHR, textStatus, errorThrown) {
							$.messager.progress("close");
							$.messager.alert("温馨提示", "删除出错！", "error");
						});
					}
				});
		}
	}

	// 修改商品
	function edit() {
		var tab = $("#mainTabs").tabs("getSelected");
		var index = $("#mainTabs").tabs("getTabIndex", tab);
		editable = true;
		if (index == 0) {
			$("#mainTabs").tabs("select", 1);
		}
		if (index == 1) {
			loadProductData();
		}
	}
	
	// 加载商品数据
	function loadProductData() {
		var row = $("#listGrid").datagrid("getSelected");
		if (row) {
			$.messager.progress();
			$.ajax({
				type: "GET",
				url: "${ctx}/product/get/" + row.userId,
			}).done(function(res){
				$.messager.progress("close");
				if (res.resultCode === 0) {
					$("#dataForm").form("load", res.row);
				} else {
					$.messager.alert("温馨提示", res.resultMsg, "error");
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				$.messager.progress("close");
				$.messager.alert("温馨提示", "加载出错！", "error");
			});
		}
	}
	
	// 保存商品
	function save() {
		if ($("#dataForm").form("validate")) {
	 		$.messager.progress();
			var data = getFormData("#dataForm");
			$.ajax({
				type : "POST",
				url : "${ctx}/product/save",
				data : data
			}).done(function(res) {
				$.messager.progress("close");
				if (res.resultCode === 0) {
					if ($("#productId").val()) {
						$("#dataForm").form("load", res.row);
					} else {
						$("#dataForm").form("load", res.row);
						query();
					}
					$.messager.show({
						title: "温馨提示",
						msg: "操作成功",
						timeout: 2500,
						showType: "slide"
					});
				} else {
					$.messager.alert("温馨提示", res.resultMsg, "error");
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				$.messager.progress("close");
				$.messager.alert("温馨提示", "保存出错！", "error");
			});
		}
	}

	function _setFormEditable(editable) {
		if (!editable) {
			enableButtons(["add", "edit"]);
			$("#dataForm").form("disableValidation");
		}
		setFormItemDisabled("#dataForm", !editable);
		if (editable) {
			enableButtons(["add", "save"]);
			$("#dataForm").form("enableValidation");
		}
	}
	
	function query() {
 		$("#listGrid").datagrid("load", getFormData("#queryForm"));
	}

</script>
</body>
</html>