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

    <link rel="shortcut icon" href="${ctx}/resources/images/logo_16.ico">
    <link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome-ie7.min.css">
    <![endif]-->
</head>

<body>
<div class="container">
    <c:choose>
        <c:when test="${resultCode == 0}">
            <div class="row" style="margin-top: 120px;">
                <div class="col-xs-12 col-md-6 col-md-offset-3">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="recordPlatform" class="col-sm-3 control-label">平台：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="recordPlatform" name="recordPlatform" placeholder="平台">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recordPenname" class="col-sm-3 control-label">笔名：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="recordPenname" name="recordPenname" placeholder="笔名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recordUid" class="col-sm-3 control-label">UID：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="recordUid" name="recordUid" placeholder="UID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recordQq" class="col-sm-3 control-label">QQ：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="recordQq" name="recordQq" placeholder="QQ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productName" class="col-sm-3 control-label">商品：</label>
                            <div class="col-sm-9">
                                <input type="text" value="${row.productName}" class="form-control" id="productName" placeholder="商品" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productPrice" class="col-sm-3 control-label">价格：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="productPrice" placeholder="价格" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productAddPoints" class="col-sm-3 control-label">获取积分：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="productAddPoints" placeholder="获取积分" readonly value="${product.productAddPoints}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productMinusPoints" class="col-sm-3 control-label">扣除积分：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="productMinusPoints" placeholder="扣除积分" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productCopyright" class="col-sm-3 control-label">版权方：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="productCopyright" placeholder="版权方" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productOperator" class="col-sm-3 control-label">经手人：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="productOperator" placeholder="经手人" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recordPaymentType" class="col-sm-3 control-label">支付方式：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="recordPaymentType" placeholder="支付方式">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recordTaobaoNum" class="col-sm-3 control-label">淘宝订单号：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="recordTaobaoNum" placeholder="淘宝订单号">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-default">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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

<script type="text/javascript">
    !function ($) {
        $.ajax({
            url: "${ctx}/clientversion/getVersionNumber/knfxmba-pco",
        }).done(function(res){
            if (res.resultCode == "0" && res.row) {
                $("#downloadApp").text("客户端下载 v" + res.row.versionNumber);
                $("#downloadApp").attr("href","${ctx}/clientversion/download?fileNumber="+res.row.fileNumber+"&versionNumber=" + res.row.versionNumber);
            } else {
                $("#downloadApp").text("无可下载客户端");
                $("#downloadApp").attr("disabled", "disabled");
            }
        }).fail(function(jqXHR, textStatus, errorThrown) {
            $.messager.alert("温馨提示", "加载出错！", "error");
        });
    }(window.jQuery);
</script>
</body>
</html>
