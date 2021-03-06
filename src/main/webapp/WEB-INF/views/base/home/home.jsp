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
	<link rel="stylesheet" href="${ctx}/resources/css/main.css">
	<style type="text/css">
		#mainTabs .tabs-header{border:none;padding:0}
	</style>
</head>
<body>
<div class="c">
	<div class="top">
		<div class="title" style="font-size:26px">
<%--			<img src="${ctx}/resources/images/logo_48.png">--%>
			&nbsp;${system_name}
		</div>
		<div class="info">
			<img src="${ctx}/resources/images/base/na-imgbg.png">
			<div>
				<p class="p2"><shiro:principal/>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${ctx}/dashboard/logout">安全退出</a></p>
			</div>
		</div>
	</div>
	<div class="middle">
		<div id="mainTabs" class="easyui-tabs g-tabs1" style="width:100%; height:100%;"></div>
	</div>
	<div class="bottom"></div>
</div>
<div id="dialog"></div>
<div id="innerDialog"></div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/main.js"></script>

<script type="text/javascript">
$(function () {

	$('#mainTabs').tabs('hideHeader');

	var ctx = '${ctx}',
		userId = <shiro:principal property="userId"/>,
		realname = '<shiro:principal/>',
		main = window.createMain({
			ctx: ctx,
			cacheOptions: {
	        	resource: {
	        		url: ctx+'/resource/getCurrentUserResource',
	        		data: {
	        			resourceType: 'module'
	        		},
	        		done: function(res) {
	        			if (res.rows) {
			                var resources = {};
			                res.rows.forEach(function(x) {
			                    resources[x.resourceCode] = x;
			                });
			                main.resources = resources;
			                main.resources.array = res.rows;
			            }
	        		}
	        	},
	        	dict: {
	        		url: ctx+'/dict/getDictList',
	        		done: function(res) {
	        			if (res) {
	        				var Dict = function(options) {
	        					var dicts = {};
	        					options.data.forEach(function(x) {
	        						if (dicts[x.dictTypeCode]) {
										dicts[x.dictTypeCode][x.dictCode] = x;
										dicts[x.dictTypeCode].list.push(x);
	        						}
	        						else {
	        							dicts[x.dictTypeCode] = {};
	        							dicts[x.dictTypeCode].list = [];
	        							dicts[x.dictTypeCode][x.dictCode] = x;
	        							dicts[x.dictTypeCode].list.push(x);
	        						}
	        					});
	        					this.dicts = dicts;
	        				};
	        				Dict.prototype.getDictName = function(dictTypeCode, dictCode) {
						        return this.dicts[dictTypeCode][dictCode].dictName;
						    };
						    Dict.prototype.getDictList = function(dictTypeCode) {
						        return this.dicts[dictTypeCode].list;
						    };
	        				main.dict = new Dict({data:res});
	        			}
	        		}
	        	}
	        }
		});

	main.ready(function() {
		main.addTab({
			id: 'HOME',
			title: '<i class="fa fa-home"></i>&nbsp;首页',
			url: ctx + '/dashboard/home/index',
			closable: false
		});

	});

});

</script>
</body>
</html>