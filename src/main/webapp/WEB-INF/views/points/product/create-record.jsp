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
	<div id="list" style="height: 300px;padding-top:40px">
		<form id="dataForm">
			<table class="g-form" style="height:100%" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="">
							<label class="form-label" title="商品">商品</label>
							<input id="productName" name="productName" class="easyui-validatebox form-control" readonly>
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" title="价格">商品价格</label>
							<input id="productPrice" name="productPrice" class="easyui-validatebox form-control" readonly>
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" title="价格">出售价格</label>
							<input id="recordPrice" name="recordPrice" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" title="获取积分">获取积分</label>
							<input id="recordAddPoints" name="recordAddPoints" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" title="扣除积分">扣除积分</label>
							<input id="recordMinusPoints" name="recordMinusPoints" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" title="经手人">经手人</label>
							<input id="recordOperator" name="recordOperator" class="easyui-validatebox form-control"
								   data-options="required: true">
						</td>
					</tr>
					<tr>
						<td class="">
							<label class="form-label" title="链接有效时间">链接有效时间</label>
							<input id="recordUrlExpires" name="recordUrlExpires" class="easyui-datetimebox"
								   data-options="required: true">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
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

		let row = window.selectRow;
		row.recordPrice = row.productPrice;
		row.recordAddPoints = row.productAddPoints;
		row.recordMinusPoints = row.productMinusPoints;
		$("#dataForm").form("load", row);

		let expiresTime = new Date();
		expiresTime.setMinutes(expiresTime.getMinutes() + ${productUrlExpires});
		$('#recordUrlExpires').datetimebox('setValue', expiresTime.formatDate('yyyy-MM-dd hh:mm:ss'));
	});
</script>

</body>
</html>