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
<%--        <a id="add" class="easyui-linkbutton toolbar g-button" onclick="add()"><i class="fa fa-plus"></i>新增</a>--%>
		<shiro:hasPermission name="RECORD_DEL">
			<a id="del" class="easyui-linkbutton toolbar g-button" onclick="del()"><i class="fa fa-trash-o"></i>删除</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="RECORD_EDIT">
			<a id="edit" class="easyui-linkbutton toolbar g-button" onclick="edit()"><i class="fa fa-edit"></i>修改</a>
			<a id="save" class="easyui-linkbutton toolbar g-button" onclick="save()"><i class="fa fa-floppy-o"></i>保存</a>
		</shiro:hasPermission>
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

		<!-- 实体详细 -->
		<div id="detailTab" title="详细">
			<form id="dataForm" style="height:100%">
				<input id="recordId" name="recordId" type="hidden">
				<input id="productId" name="productId" type="hidden">
				<input id="createrId" name="createrId" type="hidden">
				<input id="createTime" name="createTime" type="hidden">
				<table class="g-form" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="form-cell-1">
				            	<label class="form-label" title="平台">平台</label>
								<input id="recordPlatform" name="recordPlatform" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="笔名">笔名</label>
								<input id="recordPenname" name="recordPenname" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="UID">UID</label>
								<input id="recordUid" name="recordUid" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="QQ">QQ</label>
								<input id="recordQq" name="recordQq" class="easyui-validatebox form-control"
									   data-options="required: true">
							</td>
						</tr>
						<tr>
							<td class="form-cell-1">
				            	<label class="form-label" title="版权方">商品</label>
								<input id="product_name" name="product_name" class="easyui-validatebox form-control" readonly>
							</td>
							<td class="form-cell-1">
				            	<label class="form-label" title="经手人">价格</label>
								<input id="product_price" name="product_price" class="easyui-validatebox form-control" readonly>
							</td>
							<td class="form-cell-1">
								<label class="form-label" title="状态">获取积分</label>
								<input id="product_add_points" name="product_add_points" class="easyui-validatebox form-control" readonly>
							</td>
							<td class="form-cell-1">
								<label class="form-label" title="状态">扣除积分</label>
								<input id="product_minus_points" name="product_minus_points" class="easyui-validatebox form-control" readonly>
							</td>
						</tr>
						<tr>
							<td class="form-cell-1">
								<label class="form-label" title="版权方">版权方</label>
								<input id="product_copyright" name="product_copyright" class="easyui-validatebox form-control" readonly>
							</td>
							<td class="form-cell-1">
								<label class="form-label" title="经手人">经手人</label>
								<input id="product_operator" name="product_operator" class="easyui-validatebox form-control" readonly>
							</td>
							<td class="form-cell-1">
								<label class="form-label" title="支付方式">支付方式</label>
								<input id="recordPaymentType" name="recordPaymentType" class="easyui-validatebox form-control">
							</td>
							<td class="form-cell-1">
								<label class="form-label" title="淘宝订单号">淘宝订单号</label>
								<input id="recordTaobaoNum" name="recordTaobaoNum" class="easyui-validatebox form-control">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
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
						enableButtons(["add", "del", "edit", "copy"]);
					} else {
						enableButtons(["add"]);
					}
					$("#mainTabs").tabs("disableTab", 1);
				}
				if (index == 1) {
					if ($("#listGrid").datagrid("getSelections").length > 0) {
						enableButtons(["add", "save"]);
						loadRecordData();
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
                {field : "record_tabbao_num", title : " 淘宝订单号", width : 100, halign : 'center'},
				{field : "create_time", title : " 创建时间", width : 150, halign : 'center'}
 			]],
			onSelect : function(rowIndex, rowData) {
				enableButtons(["add", "del", "edit", "copy"]);
				// $("#mainTabs").tabs("enableTab", 1);
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
	
	// 新增授权记录
	function add() {
		editable = true;
		_setFormEditable(editable);
		$("#dataForm").form("clear");
		$("#listGrid").datagrid("unselectAll");
		$("#mainTabs").tabs("enableTab", 1);
		$("#mainTabs").tabs("select", 1);
		$("#recordPlatform").focus();
	}

	// 删除授权记录
	function del() {
		var row = $("#listGrid").datagrid("getSelected");
		if (row) {
			$.messager.confirm("温馨提示", "确定删除授权记录吗?",
				function(r) {
					if (r) {
						$.messager.progress();
						$.ajax({
							type: "GET",
							url : "${ctx}/record/del/" + row.recordId,
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
			$("#mainTabs").tabs("enableTab", 1);
			$("#mainTabs").tabs("select", 1);
		}
		if (index == 1) {
			loadRecordData();
		}
	}
	
	// 加载授权记录数据
	function loadRecordData() {
		let row = $("#listGrid").datagrid("getSelected");
		if (row) {
			$.messager.progress();
			$.ajax({
				type: "GET",
				url: "${ctx}/record/get/" + row.recordId,
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
	
	// 保存授权记录
	function save() {
		if ($("#dataForm").form("validate")) {
	 		$.messager.progress();
			var data = getFormData("#dataForm");
			$.ajax({
				type : "POST",
				url : "${ctx}/record/save",
				data : data
			}).done(function(res) {
				$.messager.progress("close");
				if (res.resultCode === 0) {
					if ($("#recordId").val()) {
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