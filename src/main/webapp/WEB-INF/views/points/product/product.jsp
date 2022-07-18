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
	<style type="text/css">
		.copy-input {
			position: absolute;
			top: 0;
			left: 0;
			opacity: 0;
			z-index: -999;
		}
	</style>
</head>

<body>
<div class="g-layout">
	<!-- 按钮区域 -->
	<div class="g-toolbar">
		<shiro:hasPermission name="PRODUCT_ADD">
			<a id="add" class="easyui-linkbutton toolbar g-button" onclick="add()"><i class="fa fa-plus"></i>新增</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="PRODUCT_DEL">
			<a id="del" class="easyui-linkbutton toolbar g-button" onclick="del()"><i class="fa fa-trash-o"></i>删除</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="PRODUCT_EDIT">
			<a id="edit" class="easyui-linkbutton toolbar g-button" onclick="edit()"><i class="fa fa-edit"></i>修改</a>
		</shiro:hasPermission>
		<a id="save" class="easyui-linkbutton toolbar g-button" onclick="save()"><i class="fa fa-floppy-o"></i>保存</a>
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
				<input id="productUrlExpires" name="productUrlExpires" type="hidden">
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
<%--							<td class="form-cell-1">--%>
<%--				            	<label class="form-label" title="经手人">经手人</label>--%>
<%--								<input id="productOperator" name="productOperator" class="easyui-validatebox form-control"--%>
<%--									   data-options="required: true">--%>
<%--							</td>--%>
							<td class="form-cell-1">
								<label class="form-label" title="状态">状态</label>
								<input id="productStatus" name="productStatus" class="easyui-validatebox form-control">
							</td>
							<td class="form-cell-1">
							</td>
							<td class="form-cell-1">
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 行表区域 -->
				<div id="subTabs" class="easyui-tabs g-tabs2" data-options="fit:true,border:false" style="height:100%;">
					<div title="链接信息">
						<div id="buttonbar" class="g-toolbar">
							<a id="addLink" class="easyui-linkbutton g-button" onclick="addLink()"><i class="fa fa-plus"></i>新增</a>
							<a id="delLink" class="easyui-linkbutton g-button" onclick="delLink()" ><i class="fa fa-trash-o"></i>删除</a>
							<a id="editLink" class="easyui-linkbutton g-button" onclick="editLink()" ><i class="fa fa-edit"></i>修改</a>
							<a id="copyLink" class="easyui-linkbutton g-button" onclick="copyLink()" ><i class="fa fa-clone"></i>复制链接</a>
						</div>
						<table id="dg_pointsLinks" class="easyui-datagrid" style="height: calc(100% - 34px);"></table>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div id="productDialog"></div>
	<input id="copyLinkInput" class="copy-input"/>
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
						enableButtons(["add", "del", "edit"]);
					} else {
						enableButtons(["add"]);
					}
					$("#mainTabs").tabs("disableTab", 1);
				}
				if (index == 1) {
					if ($("#listGrid").datagrid("getSelections").length > 0) {
						enableButtons(["add", "save"]);
						loadProductData();
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
			pageSize : 50,
			pageList : defaultPageList,
			pagination : true,
			url : "${ctx}/product/search",
 			columns : [[
				{field : "productName", title : "商品名称", width : 250, halign : 'center'},
				{field : "productPrice", title : "商品价格", width : 100, halign : 'right'},
				{field : "productAddPoints", title : "获取积分", width : 100, halign : 'right'},
				{field : "productMinusPoints", title : "扣除积分", width : 100, halign : 'right'},
				{field : "productCopyright", title : "版权方", width : 100, halign : 'center'},
				// {field : "productOperator", title : "经手人", width : 100, halign : 'center'},
				{field : "productStatus", title : "状态", width : 100, halign : 'center'}
				// {field : "productUrlExpires", title : "链接有效时间", width : 150, halign : 'center'}
 			]],
			onSelect : function(rowIndex, rowData) {
				enableButtons(["add", "del", "edit"]);
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

		$('#dg_pointsLinks').datagrid({
			idField: 'id',
			rownumbers: true,
			autoRowHeight: false,
			toolbar: '#buttonbar',
			// onDblClickRow: _onUserRolesDblClickRow,
			columns: [[
				{field: 'id', title: '主键', checkbox: true},
				{field: 'productId', title: '商品ID', hidden: true},
				{field: 'linkTitle', title: '标题', width: 200},
				{field: 'recordPrice', title: '出售价格', width: 80, align: 'right'},
				{field: 'recordAddPoints', title: '获取积分', width: 80, align: 'right'},
				{field: 'recordMinusPoints', title: '扣除积分', width: 80, align: 'right'},
				{field: 'recordOperator', title: '经手人', width: 150},
				{
					field: 'recordUrlExpires',
					title: '链接有效期',
					width: 130,
					formatter : function(value,row) {
						if (value) {
							if (row.everLink === 'YES') {
								return '<span style="color:#cccccc;">' + value + '</span>';
							} else {
								let exp = Date.parse(value);
								let now = (new Date()).getTime();
								if (now - exp > 0) {
									return '<span style="color:orangered;">' + value + '</span>'
								} else {
									return '<span style="color:green;">' + value + '</span>';
								}
							}
						} else {
							return '<span style="color:orangered;">' + value + '</span>';
						}
					}
				},
				{
					field: 'everLink',
					title: '永久链接',
					width: 60,
					align: 'center',
					formatter : function(value,row) {
						return value === 'YES' ? '<i class="fa fa-check"></i>' : '';
					}
				}
			]]
		});

		$('#dataForm').form({
			onLoadSuccess : function (res) {
				if (res.pointsLinks) {
					$('#dg_pointsLinks').datagrid('loadData', res.pointsLinks);
				}
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
			$("#mainTabs").tabs("enableTab", 1);
			$("#mainTabs").tabs("select", 1);
		}
		if (index == 1) {
			loadProductData();
		}
	}
	
	// 加载商品数据
	function loadProductData() {
		let row = $("#listGrid").datagrid("getSelected");
		if (row) {
			$.messager.progress();
			$.ajax({
				type: "GET",
				url: "${ctx}/product/get/" + row.productId,
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

	// 创建授权记录
	function addLink() {
		$("#productDialog").dialog({
			title: "创建授权链接",
			width: 500,
			height: 435,
			closed: false,
			cache: false,
			content: '<iframe id="productframe" scrolling="auto" frameborder="0" src="${ctx}/product/createLink" style="width:100%;height:100%;"></iframe>',
			modal: true,
			onOpen : function() {
				let selectProduct = $("#listGrid").datagrid("getSelected");
				$("#productframe")[0].contentWindow.selectRow  = {
					productId: selectProduct.productId,
					productName: selectProduct.productName,
					productPrice: selectProduct.productPrice,
					recordPrice: selectProduct.productPrice,
					recordAddPoints: selectProduct.productAddPoints,
					recordMinusPoints: selectProduct.productMinusPoints
				};
				$("#productframe")[0].contentWindow.actions = {
					confirm : function(link) {
                        $.ajax({
                            type : "POST",
                            url : "${ctx}/link/save",
                            data : link
                        }).done(function(res) {
                            $.messager.progress("close");
                            if (res.resultCode === 0) {
                                copyLink(res.row.id);
								loadProductData();
                            } else {
                                $.messager.alert("温馨提示", res.resultMsg, "error");
                            }
                        }).fail(function() {
                            $.messager.progress("close");
                            $.messager.alert("温馨提示", "保存出错！", "error");
                        });
						$("#productDialog").dialog("close");
					},
					cancel : function() {
						$("#productDialog").dialog("close");
					}
				};
			}
		});
		$("#productDialog").css("overflow", "hidden");
	}

	function delLink() {
		let rows = $("#dg_pointsLinks").datagrid("getSelections");
		if (rows.length > 0) {
			let ids = rows.map(row => {
				return row.id
			}).join(",")
			$.messager.confirm("温馨提示", "确定删除商品链接?",
					function(r) {
						if (r) {
							$.ajax({
								type: "DELETE",
								url : "${ctx}/link/del",
								data: ids
							}).done(function(res){
								if (res.resultCode === 0) {
									$("#dg_pointsLinks").datagrid("clearSelections");
									loadProductData();
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
								$.messager.alert("温馨提示", "删除出错！", "error");
							});
						}
					});
		}
	}

	function editLink() {
		let row = $("#dg_pointsLinks").datagrid("getSelected");
		if (row) {
			$("#productDialog").dialog({
				title: "创建授权链接",
				width: 500,
				height: 435,
				closed: false,
				cache: false,
				content: '<iframe id="productframe" scrolling="auto" frameborder="0" src="${ctx}/product/createLink" style="width:100%;height:100%;"></iframe>',
				modal: true,
				onOpen : function() {
					let selectProduct = $("#listGrid").datagrid("getSelected");
					$("#productframe")[0].contentWindow.selectRow  = {
						id: row.id,
						productId: selectProduct.productId,
						productName: selectProduct.productName,
						productPrice: selectProduct.productPrice,
						linkTitle: row.linkTitle,
						recordPrice: row.recordPrice,
						recordAddPoints: row.recordAddPoints,
						recordMinusPoints: row.recordMinusPoints,
						recordOperator: row.recordOperator,
						recordUrlExpires: row.recordUrlExpires,
						everLink: row.everLink
					};
					$("#productframe")[0].contentWindow.actions = {
						confirm : function(link) {
							$.ajax({
								type : "POST",
								url : "${ctx}/link/save",
								data : link
							}).done(function(res) {
								$.messager.progress("close");
								if (res.resultCode === 0) {
									copyLink(res.row.id);
									loadProductData();
								} else {
									$.messager.alert("温馨提示", res.resultMsg, "error");
								}
							}).fail(function() {
								$.messager.progress("close");
								$.messager.alert("温馨提示", "保存出错！", "error");
							});
							$("#productDialog").dialog("close");
						},
						cancel : function() {
							$("#productDialog").dialog("close");
						}
					};
				}
			});
			$("#productDialog").css("overflow", "hidden");
		}
	}

	// 复制授权链接
	function copyLink(id) {
		let row = $("#dg_pointsLinks").datagrid("getSelected");
		id = id || row.id;
		$.messager.alert("温馨提示", "授权地址已经复制，可以发送啦！", "info", function() {
			let copyLinkInput = document.getElementById("copyLinkInput");
			copyLinkInput.setAttribute('value', 'http://' + window.location.host + '${ctx}' + '/record/add/' + id);
			copyLinkInput.select();
			document.execCommand("Copy");
		});
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