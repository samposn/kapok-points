<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.midea.com/mdp/taglib" prefix="m" %>

<script type="text/javascript">
  var dataCheckFormSetting = {
    onQuery: function () {
      doQuery();
    },

    onReset: function () {
      doClean();
    }
  };

  var dataCheckFormGridSetting = {
    cellRender: {
      "checkCode": function (value, row) {
        return "<a href=\"javascript:doMgr('" + row.id + "','" + row.checkTitle + "')\">" + value + "</a>";
      }
    },
    toolbar: [
      {
        id: 'addBtn',
        text: '${m:message("epm.config.btn.create")}',
        icon: 'icon-file.png',
        onClick: function () {
          doMgr();
        }
      }
    ]
  };

</script>
<style>
    .seach {
        box-sizing: border-box;
        border: 1px solid #e5e5e5;
    }

    #dataCheckForm #dataCheckFormQueryForm table tbody tr:first-child td:last-child .btnReset {
        margin-right: 10px;
    }
</style>
<m:form id="dataCheckForm" modelAttribute="fm" template="queryForm.tag" setting="dataCheckFormSetting">
    <table class="template-query-form">
        <tr>
            <td class="name" nowrap="nowrap">检查编码：</td>
            <td class="text" nowrap="nowrap"><m:input path="props['checkCode']"/></td>
            <td class="name" nowrap="nowrap">检查标题：</td>
            <td class="text" nowrap="nowrap"><m:input path="props['checkTitle']"/></td>
        </tr>
    </table>
</m:form>

<m:table id="dataCheckFormGrid" initValue="dataChecks" columnHeader="checkbox" setting="dataCheckFormGridSetting">
    <m:column property="checkCode" title='检查编码' sortable="true"/>
    <m:column property="checkTitle" title='检查标题' sortable="true"/>
    <m:column property="createdBy" title='${m:message("epm.config.td.creater")}' sortable="true"/>
    <m:column property="creationDate" title='${m:message("epm.config.td.createTime")}' sortable="true">
        <m:display type="date" value="yyyy-MM-dd HH:mm:ss"></m:display>
    </m:column>
</m:table>

<script type="text/javascript">
  $(function () {
    doQuery();
  });

  $(window).keypress(function (event) {
    if (event.keyCode == 13) {
      doQuery();
      return false;
    }
  });

  // 查询
  function doQuery () {
    dataCheckFormGrid.loadPagedResult("${ctx}/public-access/epm/platform/ipln/iplnDataCheck.do?queryDataCheck",
      $('#dataCheckForm').serialize());
  }

  // 清空
  function doClean () {
    dataCheckForm.clear();
  }

  // 操作
  function doMgr (id, checkTitle) {
	var tabId = "ipln_data_check_" + (id || "add");
	var title = (id && checkTitle) ? ("数据检查配置（编辑）-" + checkTitle) : "数据检查配置（新增）";
    var url = "/public-access/epm/platform/ipln/iplnDataCheck.do?dataCheckMgr&id=" + (id || "");
	Mdp.ui.openTab(tabId, title, title, url);
  }

</script>