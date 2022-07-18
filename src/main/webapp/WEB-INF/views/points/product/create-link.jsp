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
	<style>
		.g-form {
			min-width: 480px;
		}
		.g-form .form-control {
			width: 300px;
			margin-bottom: 10px;
		}
	</style>
</head>

<body>
<div class="content">
	<div id="list" style="height: 360px;padding-top:40px">
		<form id="dataForm">
			<input id="id" name="id" type="hidden">
		    <input id="productId" name="productId" type="hidden">
			<table class="g-form" style="height:100%" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="">
							<label class="form-label" for="productName" title="商品">商品</label>
							<input id="productName" name="productName" class="easyui-validatebox form-control" readonly>
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="productPrice" title="价格">商品价格</label>
							<input id="productPrice" name="productPrice" class="easyui-validatebox form-control" readonly>
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="linkTitle" title="标题">标题</label>
							<input id="linkTitle" name="linkTitle" class="easyui-validatebox form-control">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="recordPrice" title="价格">出售价格</label>
							<input id="recordPrice" name="recordPrice" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="recordAddPoints" title="获取积分">获取积分</label>
							<input id="recordAddPoints" name="recordAddPoints" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="recordMinusPoints" title="扣除积分">扣除积分</label>
							<input id="recordMinusPoints" name="recordMinusPoints" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="recordOperator"  title="经手人">经手人</label>
							<input id="recordOperator" name="recordOperator" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="recordUrlExpires" title="链接有效期">链接有效期</label>
							<input id="recordUrlExpires" name="recordUrlExpires" class="easyui-datetimebox"
								   data-options="required:true,editable:false">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" for="everLink" title="永久链接">永久链接</label>
							<input id="everLink" name="everLink" value="YES" type="checkbox" style="margin: 7px auto;">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div id="toolbar" class="dialog-button">
		<a id="confirm" href="javascript:void(0);" class="easyui-linkbutton g-button" onclick="saveRecord();"><i class="fa fa-check"></i>确定</a>
		<a id="cancel" href="javascript:void(0);" class="easyui-linkbutton g-button" onclick="window.actions.cancel();"><i class="fa fa-times"></i>取消</a>
	</div>
</div>

<script type="text/javascript" src="${ctx}/resources/js/jquery-easyui-1.3.5/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/sis.js"></script>

<script type="text/javascript">
	$(function() {
		let row = window.selectRow;
		$("#dataForm").form("load", row);

		if (!row.id) {
			let expiresTime = new Date();
			expiresTime.setMinutes(expiresTime.getMinutes() + ${productUrlExpires});
			$('#recordUrlExpires').datetimebox('setValue', expiresTime.formatDate('yyyy-MM-dd hh:mm:ss'));
		}
	});

	function saveRecord() {
	    if ($("#dataForm").form("validate")) {
            let data = getFormData("#dataForm");
			data.everLink = $("#everLink:checked").val() || "NO";

            let link = {};
            link.id = data.id;
            link.linkTitle = data.linkTitle;
            link.productId = data.productId;

            delete data.id;
			delete data.linkTitle;
			delete data.productId;
			delete data.productName;
			delete data.productPrice;

			link.params = JSON.stringify(data);
            window.actions.confirm(link);
	    }
	}

</script>

</body>
</html>