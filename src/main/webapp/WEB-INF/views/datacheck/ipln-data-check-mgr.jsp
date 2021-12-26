<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>数据检查</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous"/>

    <style>
        .stacks {
            box-shadow: none;
        }

        .card-header-text-color {
            color: #0068a3;
            font-weight: bold;
            height: 26px;
            line-height: 26px;
            margin: 0;
        }

        select, input[type="text"], input[type="password"] {
            width: 100%;
            height: auto;
            color: #212529;
            padding: 0.25rem 0.5rem;
            border-width: 1px;
            border-style: solid;
            border-color: #ced4da;
            border-image: initial;
            border-radius: 0.2rem;
        }

        .title-input {
            width: 95% !important;
            font-size: 1.25rem !important;
            padding: 0 0.5rem !important;
            border: none !important;
            border-bottom: 1px solid #0d6efd !important;
            border-radius: 0 !important;

        }
    </style>
</head>

<body>
<div class="container">
    <div id="checkPanel" class="card mt-3 shadow-sm">
        <div class="card-header">
            <h5 class="d-inline-block card-header-text-color">检查配置</h5>
            <button class="btn btn-primary btn-sm float-end"
                    data-bind="click: saveDataCheck">保存
            </button>
        </div>
        <div class="card-body container">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-xl-12 col-xxl-12">
                    <form>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="checkCode" class="form-label">检查编码：</label>
                                <input type="text" class="form-control form-control-sm" id="checkCode"
                                       name="sourceSql" placeholder="CHECK_CODE" data-bind="value: checkCode"/>
                            </div>
                            <div class="col-sm-6">
                                <label for="checkTitle" class="form-label">检查标题：</label>
                                <input type="text" class="form-control form-control-sm" id="checkTitle"
                                       name="checkTitle" placeholder="CHECK_TITLE" data-bind="value: checkTitle"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="checkItemPanel" class="card mt-3 shadow-sm" data-bind="visible: id() != null">
        <div class="card-header">
            <h5 class="d-inline-block card-header-text-color">检查项配置</h5>
            <button class="btn btn-primary btn-sm float-end ms-1"
                    data-bind="click: saveDataCheckItem">保存
            </button>
            <button class="btn btn-secondary btn-sm float-end ms-1"
                    data-bind="click: addDataCheckItem">添加检查项
            </button>
        </div>
        <div class="card-body container pt-0">
            <div class="row">
                <div id="dataCheckItemList" data-bind="foreach: dataCheckItems"
                     class="col-md-12 col-lg-12 col-xl-12 col-xxl-12">
                    <div class="check-item mt-3 p-3 shadow">
                        <div class="row">
                            <div class="col-sm-6">
                                <h5 class="text-primary d-inline-block"
                                    data-bind="text: order()"></h5>
                                <label for="checkItemTitle" class="form-label d-none">CHECK ITEM TITLE：</label>
                                <input type="text" class="title-input text-primary" id="checkItemTitle"
                                       name="checkItemTitle" placeholder="请输入检查项标题"
                                       data-bind="textinput: checkItemTitle"/>
                            </div>
                            <div class="col-sm-6">
                                <button class="btn btn-outline-danger btn-sm float-end ms-1"
                                        data-bind="click: $root.removeDataCheckItem">X
                                </button>
                                <button class="btn btn-outline-info btn-sm float-end ms-1 d-none"
                                        data-bind="click: $root.removeCheckItem">&darr;
                                </button>
                                <button class="btn btn-outline-info btn-sm float-end ms-1 d-none"
                                        data-bind="click: $root.removeCheckItem">&uarr;
                                </button>
                            </div>
                        </div>
                        <div class="row g-1 mt-1">
                            <div class="col-sm-6">
                                <label for="srcDatasource" class="form-label d-none">datasource：</label>
                                <select class="form-select form-select-sm w-25 d-none" id="srcDatasource" name="srcDatasource"
                                        data-bind="value: sourceSql.datasource">
                                    <option value="default">DEFAULT</option>
                                </select>
                                <label for="sourceSql" class="form-label d-none">SOURCE SQL：</label>
                                <textarea type="text" class="form-control form-control-sm mt-1" id="sourceSql"
                                          name="sourceSql" placeholder="SOURCE SQL"
                                          data-bind="value: sourceSql.sqlStr"></textarea>
                            </div>
                            <div class="col-sm-6">
                                <label for="tarDatasource" class="form-label d-none">datasource：</label>
                                <select class="form-select form-select-sm w-25 d-none" id="tarDatasource" name="tarDatasource"
                                        data-bind="value: targetSql.datasource">
                                    <option value="default">DEFAULT</option>
                                </select>
                                <label for="targetSql" class="form-label d-none">TARGET SQL：</label>
                                <textarea type="text" class="form-control form-control-sm mt-1" id="targetSql"
                                          name="targetSql" placeholder="TARGET SQL"
                                          data-bind="value: targetSql.sqlStr"></textarea>
                            </div>
                        </div>
                        <div class="row g-1 mt-1">
                            <div class="col-sm-12">
                                <button class="btn btn-secondary btn-sm float-end ms-1 "
                                        data-bind="click: $root.addDataCheckItemRule">＋
                                </button>
                            </div>
                        </div>
                        <div data-bind="foreach: dataCheckItemRules">
                            <div class="row mt-1 g-1">
                                <div class="col-sm-2">
                                    <label for="source" class="form-label d-none">source：</label>
                                    <input type="text" class="form-control form-control-sm" id="source"
                                           name="source" placeholder="来源字段" data-bind="value: source"/>
                                </div>
                                <div class="col-sm-1">
                                    <label for="op" class="form-label d-none">op：</label>
                                    <select class="form-select form-select-sm" id="op" name="op" data-bind="value: op">
                                        <option value=">">&gt;</option>
                                        <option value="=">=</option>
                                        <option value="<">&lt;</option>
                                        <option value=">=">&gt;=</option>
                                        <option value="<=">&lt;=</option>
                                        <option value="!=">!=</option>
                                        <option value="startWith">START_WITH</option>
                                        <option value="endWith">END_WITH</option>
                                        <option value="contain">CONTAIN</option>
                                        <option value="isNull">IS_NULL</option>
                                        <option value="isNotNull">IS_NOT_NULL</option>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <label for="target" class="form-label d-none">target：</label>
                                    <input type="text" class="form-control form-control-sm" id="target"
                                           name="target" placeholder="目标字段" data-bind="value: target"/>
                                </div>
                                <div class="col-sm-3">
                                    <label for="oMsg" class="form-label d-none">oMsg：</label>
                                    <input type="text" class="form-control form-control-sm border-success" id="oMsg"
                                           name="oMsg" placeholder="检查成功消息" data-bind="value: oMsg"/>
                                </div>
                                <div class="col-sm-3">
                                    <label for="xMsg" class="form-label d-none">xMsg：</label>
                                    <input type="text" class="form-control form-control-sm border-danger" id="xMsg"
                                           name="xMsg" placeholder="检查失败消息" data-bind="value: xMsg"/>
                                </div>
                                <div class="col-sm-1">
                                    <button class="btn btn-secondary btn-sm float-end ms-1"
                                            data-bind="click: $root.removeDataCheckItemRule">－
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"
        type="text/javascript"></script>
<script src="${ctx}/resources/libs/knockoutjs/knockout-3.5.1.js"
        type="text/javascript"></script>
<script src="${ctx}/resources/libs/knockoutjs/knockout.mapping-latest.js"
        type="text/javascript"></script>

<script type="text/javascript">
    /**
     * Created by Will WM. Zhang on 2021-12-26 上午10:40.
     * =================================================
     * IplnDataCheck CLASS DEFINITION
     * v0.0.1
     * =================================================
     */
    let IplnDataCheckViewMode = function () {
        let self = this;

        self.dataCheckItems = ko.observableArray();

        // 添加检查项
        self.addDataCheckItem = function () {
            let dataCheckItem = {
                id: ko.observable(),
                checkId: ko.observable(self.id),
                checkItemTitle: ko.observable(),
                order: ko.observable(self.dataCheckItems().length + 1),
                type: ko.observable("SQL"),
                sourceSql: {
                    datasource: ko.observable("default"),
                    sqlStr: ko.observable()
                },
                targetSql: {
                    datasource: ko.observable("default"),
                    sqlStr: ko.observable()
                },
                dataCheckItemRules: ko.observableArray([{
                    source: ko.observable(),
                    op: ko.observable(),
                    target: ko.observable(),
                    oMsg: ko.observable(),
                    xMsg: ko.observable()
                }])
            };
            self.dataCheckItems.push(dataCheckItem);
        };

        // 删除检查项
        self.removeDataCheckItem = function (dataCheckItem) {
            self.dataCheckItems.remove(dataCheckItem);
            resetOrder();
        };

        // 添加检查项规则
        self.addDataCheckItemRule = function (dataCheckItem) {
            dataCheckItem.dataCheckItemRules.push({
                source: ko.observable(),
                op: ko.observable(),
                target: ko.observable(),
                oMsg: ko.observable(),
                xMsg: ko.observable()
            });
        };

        // 删除检查项规则
        self.removeDataCheckItemRule = function (dataCheckItemRule) {
            $.each(self.dataCheckItems(), function () {
                this.dataCheckItemRules.remove(dataCheckItemRule);
            });
        };

        self.saveDataCheckItem = function () {
            let dataCheckJsonString = JSON.stringify(ko.toJS(self), function (k, v) {
                if (k !== "__ko_mapping__") {
                    return v;
                }
            }, 2);
            let dataCheckItems = JSON.parse(dataCheckJsonString).dataCheckItems
            console.log(dataCheckItems);
            <%--$.ajax({--%>
            <%--    url: "${ctx}/datacheck/saveDataCheckItem",--%>
            <%--    type: 'POST'--%>
            <%--}).done(function (data) {--%>
            <%--    if (data) {--%>
            <%--        let iplnDataCheckViewMode = new IplnDataCheckViewMode();--%>
            <%--        let iplnDataCheck = ko.mapping.fromJS(data);--%>
            <%--        ko.utils.extend(iplnDataCheckViewMode, iplnDataCheck);--%>
            <%--        ko.applyBindings(iplnDataCheckViewMode);--%>
            <%--    }--%>
            <%--}).fail(function (jqXHR, textStatus, errorThrown) {--%>
            <%--});--%>
        }

        self.saveDataCheck = function () {
            let dataCheckJsonString = JSON.stringify(ko.toJS(self), function (k, v) {
                if (k !== "__ko_mapping__" && k !== "dataCheckItems") {
                    return v;
                }
            }, 2);
            let dataCheck = JSON.parse(dataCheckJsonString)
            console.log(dataCheck);
            <%--$.ajax({--%>
            <%--    url: "${ctx}/datacheck/saveDataCheck",--%>
            <%--    type: 'POST'--%>
            <%--}).done(function (data) {--%>
            <%--    if (data) {--%>
            <%--        let iplnDataCheckViewMode = new IplnDataCheckViewMode();--%>
            <%--        let iplnDataCheck = ko.mapping.fromJS(data);--%>
            <%--        ko.utils.extend(iplnDataCheckViewMode, iplnDataCheck);--%>
            <%--        ko.applyBindings(iplnDataCheckViewMode);--%>
            <%--    }--%>
            <%--}).fail(function (jqXHR, textStatus, errorThrown) {--%>
            <%--});--%>
        }

        function resetOrder() {
            $.each(self.dataCheckItems(), function (index, item) {
                item.order(index + 1);
            });
        }
    };

    $(function () {
        $.ajax({
            url: "${ctx}/datacheck/get/${id}",
            type: 'GET'
        }).done(function (data) {
            if (data) {
                let iplnDataCheckViewMode = new IplnDataCheckViewMode();
                let iplnDataCheck = ko.mapping.fromJS(data);
                ko.utils.extend(iplnDataCheckViewMode, iplnDataCheck);
                ko.applyBindings(iplnDataCheckViewMode);
            }
        }).fail(function (jqXHR, textStatus, errorThrown) {
        });
    });

</script>

</body>
</html>