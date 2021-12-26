<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<link rel="stylesheet" type="text/css" href="${ctx}/resource/bootstrap/bootstrap.min.css" />

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

input[type="text"], input[type="password"] {
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

<div>
	<div id="checkPanel" class="card mt-3 shadow-sm">
		<div class="card-header">
			<h5 class="d-inline-block card-header-text-color">检查配置</h5>
			<button class="btn btn-primary btn-sm float-end">保存</button>
		</div>
		<div class="card-body container">
			<div class="row g-5">
				<div class="col-md-12 col-lg-12 col-xl-9 col-xxl-9">
					<form>
						<div class="row g-3">
							<div class="col-sm-6">
								<label for="checkCode" class="form-label">检查编码</label>
								<input type="text" class="form-control form-control-sm" id="checkCode"
									name="sourceSql" placeholder="CHECK_CODE" data-bind="value: checkCode"/>
							</div>
							<div class="col-sm-6">
								<label for="checkTitle" class="form-label">检查标题</label>
								<input type="text" class="form-control form-control-sm" id="checkTitle"
									name="checkTitle" placeholder="CHECK_TITLE" data-bind="value: checkTitle"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="checkItemPanel" class="card mt-3 shadow-sm" data-bind="visible: id ? true: false">
		<div class="card-header">
			<h5 class="d-inline-block card-header-text-color">检查项配置</h5>
			<button class="btn btn-primary btn-sm float-end ms-1">保存</button>
			<button class="btn btn-secondary btn-sm float-end ms-1"
				data-bind="click: addCheckItem">添加检查项</button>
			<button class="btn btn-secondary btn-sm float-end ms-1"
				data-bind="click: showData">调试</button>
		</div>
		<div class="card-body container">
			<div class="row g-5">
				<div id="dataCheckItemList" data-bind="foreach: items"
					class="col-md-12 col-lg-12 col-xl-9 col-xxl-9 mt-3 pt-3">

					<div class="check-item mt-3 p-3 shadow">
						<div class="row">
							<div class="col-sm-6">
								<h5 class="text-primary d-inline-block"
									data-bind="text: order()"></h5>
								<input type="text" class="title-input text-primary"
									placeholder="这里可以输入检查项标题"
									data-bind="textinput: checkItemTitle"/>
							</div>
							<div class="col-sm-6">
								<button class="btn btn-outline-danger btn-sm float-end ms-1"
									data-bind="click: $root.removeCheckItem">X</button>
								<button class="btn btn-outline-info btn-sm float-end ms-1 d-none"
									data-bind="click: $root.removeCheckItem">&darr;</button>
								<button class="btn btn-outline-info btn-sm float-end ms-1 d-none"
									data-bind="click: $root.removeCheckItem">&uarr;</button>
							</div>
						</div>
						<div class="row g-1 mt-1">
							<div class="col-sm-6">
								<label for="sourceSql" class="form-label">SOURCE SQL：</label>
								<input type="text" class="form-control form-control-sm" id="sourceSql"
									name="sourceSql" placeholder="SOURCE SQL"
									data-bind="value: sourceSql"/>
							</div>
							<div class="col-sm-6">
								<label for="targetSql" class="form-label">TARGET SQL：</label> 
								<input type="text" class="form-control form-control-sm" id="targetSql"
									name="targetSql" placeholder="TARGET SQL"
									data-bind="value: targetSql"/>
							</div>
						</div>
						<div class="row g-1 mt-1">
							<div class="col-sm-12">
								<button class="btn btn-secondary btn-sm float-end ms-1 "
									data-bind="click: $root.addCheckItemRule">＋</button>
							</div>
						</div>
						<div data-bind="foreach: checkRule">
							<div class="row mt-1 g-1">
								<div class="col-sm-2">
									<input type="text" class="form-control form-control-sm"
										name="source" placeholder="来源字段" data-bind="value: source"/>
								</div>
								<div class="col-sm-1">
									<input type="text" class="form-control form-control-sm"
										name="op" placeholder="op" data-bind="value: op"/>
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control form-control-sm"
										name="target" placeholder="目标字段" data-bind="value: target"/>
								</div>
								<div class="col-sm-3">
									<input type="text" class="form-control form-control-sm border-success"
										name="o_msg" placeholder="检查成功消息" data-bind="value: o_msg"/>
								</div>
								<div class="col-sm-3">
									<input type="text" class="form-control form-control-sm border-danger"
										name="x_msg" placeholder="检查失败消息" data-bind="value: x_msg"/>
								</div>
								<div class="col-sm-1">
									<button class="btn btn-secondary btn-sm float-end ms-1"
										data-bind="click: $root.removeCheckItemRule">－</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/knockoutjs/knockout-3.5.1.js"></script>

<script type="text/javascript">

$(function() {
	
	<%--$.ajax({--%>
	<%--	url : "${ctx}/public-access/epm/platform/ipln/iplnDataCheck.do?dataCheckMgrGet&id=${id}",--%>
    <%--    type : 'GET',--%>
    <%--    success : function (data, status) {--%>
    <%--    	if (data) {--%>
    <%--    		ko.applyBindings(ko.mapping.fromJS(data));--%>
    <%--    	} else {--%>
    <%--    		ko.applyBindings(new DataCheckModel());--%>
    <%--    	}--%>
    <%--    }--%>
	<%--});--%>

	let checkItemModel = new CheckItemListModel([ {
		id : "D3B304B813195A8DE0536068120AA4DE",
		checkId : "D3B304B813185A8DE0536068120AA4DE",
		checkItemTitle : "检查 Bu Code 映射",
		order : 1,
		type : "SQL",
		sourceSql : "select * from a",
		targetSql : "select * from b",
		checkRule : [ {
			source : "AMOUNT",
			op : "=",
			target : "AMOUNT",
			o_msg : "成功了",
			x_msg : "失败了"
		} ]
	}, {
		id : "D3B304B8131A5A8DE0536068120AA4DE",
		checkId : "D3B304B813185A8DE0536068120AA4DE",
		checkItemTitle : "检查 Account 映射",
		order : 2,
		type : "SQL",
		sourceSql : "select * from aa",
		targetSql : "select * from bb",
		checkRule : [ {
			source : "AMOUNT",
			op : "IS NULL",
			target : null,
			o_msg : "success",
			x_msg : "fail"
		} ]
	} ]);

	// ko.applyBindings(checkItemModel, document.getElementById("checkItemPanel"));
});

let DataCheckModel = function(dataCheck) {
	this.dataCheck = {
		id : ko.observable(dataCheck.id),
		checkCode : ko.observable(dataCheck.checkCode),
		checkTitle : ko.observable(dataCheck.checkTitle)
	}
};

var CheckItemListModel = function(items) {
	var self = this;
	self.items = ko.observableArray(ko.utils.arrayMap(items, function(item) {
		return {
			id : item.id,
			checkId : item.checkId,
			checkItemTitle : ko.observable(item.checkItemTitle),
			order : ko.observable(item.order),
			type : ko.observable(item.type),
			sourceSql : ko.observable(item.sourceSql),
			targetSql : ko.observable(item.targetSql),
			checkRule : ko.observableArray(item.checkRule)
		};
	}));

	self.addCheckItem = function() {
		var newCheckItem = {
			checkItemTitle : ko.observable(),
			order : ko.observable(self.items().length + 1),
			type : ko.observable("SQL"),
			sourceSql : ko.observable(),
			targetSql : ko.observable(),
			checkRule : ko.observableArray([ {
				source : ko.observable(),
				op : ko.observable(),
				target : ko.observable(),
				o_msg : ko.observable(),
				x_msg : ko.observable()
			} ])
		};
		self.items.push(newCheckItem);
	};

	self.removeCheckItem = function(item) {
		self.items.remove(item);
		resetOrder();
	};

	self.addCheckItemRule = function(item) {
		item.checkRule.push({
			source : ko.observable(),
			op : ko.observable(),
			target : ko.observable(),
			o_msg : ko.observable(),
			x_msg : ko.observable()
		});
	};

	self.removeCheckItemRule = function(itemCheckRule) {
		$.each(self.items(), function() {
			this.checkRule.remove(itemCheckRule)
		});
	};
	
	self.saveCheckItem = function() {
		JSON.stringify(ko.toJS(self.items), null, 2);
	}

	self.showData = function() {
		console.log(JSON.stringify(ko.toJS(self.items), null, 2));
	}
	
	function resetOrder() {
		$.each(self.items(), function(index, item) {
			item.order(index + 1);
		});
	}
};


</script>