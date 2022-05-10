<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${system_name}</title>

    <%--    <link rel="shortcut icon" href="${ctx}/resources/images/logo_16.ico">--%>
    <link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">

    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome-ie7.min.css">
    <![endif]-->
    <link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
    <link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
</head>

<body>
<%-- 获取当前系统时间并赋值给nowDate  --%>
<c:set var="now" value="<%=System.currentTimeMillis()%>"></c:set>
<div class="container">
    <c:choose>
        <c:when test="${resultCode == 0}">
            <c:choose>
                <c:when test="${now-row.exp > 0}">
                    <div class="row" style="margin-top: 120px;">
                        <div class="col-xs-12 col-md-6 col-md-offset-3">
                            <div class="alert alert-danger text-center" role="alert">链接已经过期...</div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row" style="margin-top: 60px;">
                        <div class="col-xs-12 col-md-6 col-md-offset-3">
                            <h3 class="text-center text-primary">授权登记</h3>
                            <br>
                        </div>
                        <div class="col-xs-12 col-md-6 col-md-offset-3">
                            <form id="recordForm" class="form-horizontal">
								<input id="productId" name="productId" type="hidden" value="${row.productId}">
								<input id="productPrice" name="productPrice" type="hidden" value="${row.productPrice}">
                                <div class="form-group">
                                    <label for="recordPlatform" class="col-sm-3 control-label">平台：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control required" id="recordPlatform" name="recordPlatform" placeholder="平台">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordPenname" class="col-sm-3 control-label">笔名：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control required" id="recordPenname" name="recordPenname" placeholder="笔名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordQq" class="col-sm-3 control-label">QQ：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control required" id="recordQq" name="recordQq" placeholder="QQ">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordUid" class="col-sm-3 control-label">UID：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordUid" name="recordUid" placeholder="UID">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="product_name" class="col-sm-3 control-label">商品名称：</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${row.product_name}" class="form-control" id="product_name" placeholder="商品" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordPrice" class="col-sm-3 control-label">价格：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordPrice" name="recordPrice" placeholder="价格" readonly
										value="${row.recordPrice}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordAddPoints" class="col-sm-3 control-label">获取积分：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordAddPoints" name="recordAddPoints" placeholder="获取积分" readonly
										value="${row.recordAddPoints}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordMinusPoints" class="col-sm-3 control-label">扣除积分：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordMinusPoints" name="recordMinusPoints" placeholder="扣除积分" readonly
										value="${row.recordMinusPoints}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="product_copyright" class="col-sm-3 control-label">版权方：</label>
                                    <div class="col-sm-9">
                                        <input type="text" value="${row.product_copyright}" class="form-control" id="product_copyright" placeholder="版权方" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordOperator" class="col-sm-3 control-label">经手人：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordOperator" name="recordOperator" placeholder="经手人" readonly
										value="${row.recordOperator}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordPaymentType" class="col-sm-3 control-label">支付方式：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordPaymentType" name="recordPaymentType" placeholder="支付方式">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordTaobaoNum" class="col-sm-3 control-label">淘宝订单号：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordTaobaoNum" name="recordTaobaoNum" placeholder="淘宝订单号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recordRemark" class="col-sm-3 control-label">备注：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="recordRemark" name="recordRemark" placeholder="备注">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <button type="button" class="btn btn-primary" onclick="tijiao();">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <div class="row" style="margin-top: 120px;">
                <div class="col-xs-12 col-md-6 col-md-offset-3">
                    <div class="alert alert-danger text-center" role="alert">${resultMsg}</div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript">

    function tijiao() {

        let blanks = 3;

        $.each($('.required'), function(i, x) {
            let e = $(x);
            if (e.val()) {
                e.parent().parent().removeClass('has-error');
                blanks -= 1;
            } else {
                e.parent().parent().addClass('has-error');
                e.attr('placeholder', '必须填写');
                blanks += 1;
            }
        });

        if (blanks === 0) {
            $.messager.progress();
            let data = getFormData("#recordForm")
            $.ajax({
                type : "POST",
                url : "${ctx}/record/save",
                data : data
            }).done(function(res) {
                $.messager.progress("close");
                if (res.resultCode === 0) {
                    $.messager.show({
                        title: "温馨提示",
                        msg: "操作成功",
                        timeout: 2500,
                        showType: "slide"
                    });
                    let url = 'http://' + window.location.host + '${ctx}' + '/record/query/show/' + res.row.recordQq;
                    window.location.replace(url);
                } else {
                    $.messager.alert("温馨提示", res.resultMsg, "error");
                }
            }).fail(function() {
                $.messager.progress("close");
                $.messager.alert("温馨提示", "保存出错！", "error");
            });
        }

    }

    function isValidate() {

    }

    // 获取表单数据
    function getFormData(dataForm) {
        let data = {};
        let fields = $(dataForm).find(':input:not(:radio, :checkbox)');
        let radioFields = $(dataForm).find(':input:radio:checked');
        fields.each(function(index, element) {
            let fieldName = $(element).attr('name');
            let fieldValue = $(element).val();
            if (fieldName) {
                data[fieldName] = fieldValue;
            }
        });
        radioFields.each(function(index, element) {
            let fieldName = $(element).attr('name');
            let fieldValue = $(element).val();
            if (fieldName) {
                data[fieldName] = fieldValue;
            }
        });
        return data;
    }

</script>
</body>
</html>
