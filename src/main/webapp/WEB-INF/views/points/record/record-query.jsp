<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${system_name}</title>

    <%--    <link rel="shortcut icon" href="${ctx}/resources/images/logo_16.ico">--%>
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
<div class="g-layout" style="width:80%;margin:0 auto;">
    <!-- 内容区域 -->
    <br><h1>授权查询</h1><br>
    <div id="mainTabs" class="easyui-tabs g-container g-tabs1" data-options="fit:true,border:false">
        <div title="列表" style="position:relative;">
            <div class="query-area">
                <form id="queryForm" method="post">
                    <table class="g-form" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td class="form-cell-1">
                                <label class="form-label">UID</label>
                                <input name="q_record_uid_EQ" class="easyui-validatebox form-control" data-options="required: true">
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label">QQ</label>
                                <input name="q_record_qq_EQ" class="easyui-validatebox form-control" data-options="required: true">
                            </td>
                            <td class="form-cell-1">
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
            <div class="list-area" style="top:45px;height:90%">
                <table id="listGrid" style="height:100%"></table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gxwl.js"></script>

<script type="text/javascript">
    $(function() {
        $('#mainTabs').tabs('hideHeader');
        $("#listGrid").datagrid({
            rownumbers : true,
            singleSelect : true,
            autoRowHeight : false,
            border : false,
            pageSize : defaultPageSize,
            pageList : defaultPageList,
            pagination : true,
            columns : [[
                {field : "record_platform", title : "平台", width : 100, halign : 'center'},
                {field : "record_uid", title : " UID", width : 100, halign : 'center'},
                {field : "record_qq", title : "QQ", width : 100, halign : 'center'},
                {field : "product_name", title : "商品", width : 100, halign : 'center'},
                {field : "product_price", title : "价格", width : 100, halign : 'center'},
                {field : "product_add_points", title : "获取积分", width : 100, halign : 'center'},
                {field : "product_minus_points", title : " 扣除积分", width : 100, halign : 'center'},
                {field : "record_payment_type", title : " 支付方式", width : 100, halign : 'center'}
            ]]
        });
    });

    function query() {
        if ($("#queryForm").form("validate")) {
            let url = "${ctx}/record/search"
            $('#listGrid').datagrid('options').url = url;
            $("#listGrid").datagrid("load", getFormData("#queryForm"));
        }
    }

</script>
</body>
</html>
