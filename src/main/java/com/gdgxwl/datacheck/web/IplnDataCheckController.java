package com.gdgxwl.datacheck.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.Serializable;
import java.util.*;

/**
 * IplnDataCheckController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequestMapping(value = "/datacheck")
public class IplnDataCheckController {

    @RequestMapping(value = {"/add", "/add/{id}"})
    public String add(Model model, @PathVariable(required = false) String id) {
        model.addAttribute("id", id);
        return "datacheck/ipln-data-check-mgr";
    }

    @ResponseBody
    @RequestMapping(value = {"/get", "/get/{id}"})
    public IplnDataCheckDTO get(Model model, @PathVariable(required = false) String id) {
        IplnDataCheckDTO result = new IplnDataCheckDTO();
        if (id != null) {
            result.setId(id);
            result.setCheckCode("HFM_CHECK");
            result.setCheckTitle("HFM-OPS直连检查");

            List<IplnDataCheckItemDTO> dataCheckItems = new LinkedList<>();

            IplnDataCheckItemDTO iplnDataCheckItemDTO1 = new IplnDataCheckItemDTO();
            iplnDataCheckItemDTO1.setId("D3B304B813195A8DE0536068120AA4DE");
            iplnDataCheckItemDTO1.setCheckId(id);
            iplnDataCheckItemDTO1.setCheckItemTitle("检查 Bu Code 映射");
            iplnDataCheckItemDTO1.setOrder(1);
            iplnDataCheckItemDTO1.setType("SQL");
            Map<String, String> sourceSql1 = new HashMap<>();
            sourceSql1.put("datasource", "default");
            sourceSql1.put("sqlStr", "SELECT * \nFROM a");
            iplnDataCheckItemDTO1.setSourceSql(sourceSql1);
            Map<String, String> targetSql1 = new HashMap<>();
            targetSql1.put("datasource", "default");
            targetSql1.put("sqlStr", "SELECT * FROM b");
            iplnDataCheckItemDTO1.setTargetSql(targetSql1);
            
            List<CheckRule> dataCheckItemRule11 = new LinkedList<>();

            CheckRule rule111 = new CheckRule();
            rule111.setSource("AMOUNT");
            rule111.setOp("=");
            rule111.setTarget("AMOUNT");
            rule111.setoMsg("成功了");
            rule111.setxMsg("失败了");
            dataCheckItemRule11.add(rule111);

            CheckRule rule112 = new CheckRule();
            rule112.setSource("BU_CODE");
            rule112.setOp(">");
            rule112.setTarget("BU_CODE");
            rule112.setoMsg("成功了了");
            rule112.setxMsg("失败了了");
            dataCheckItemRule11.add(rule112);

            iplnDataCheckItemDTO1.setDataCheckItemRules(dataCheckItemRule11);

            dataCheckItems.add(iplnDataCheckItemDTO1);

            IplnDataCheckItemDTO iplnDataCheckItemDTO2 = new IplnDataCheckItemDTO();
            iplnDataCheckItemDTO2.setId("D3B304B8131A5A8DE0536068120AA4DE");
            iplnDataCheckItemDTO2.setCheckId(id);
            iplnDataCheckItemDTO2.setCheckItemTitle("检查 Account 映射");
            iplnDataCheckItemDTO2.setOrder(2);
            iplnDataCheckItemDTO2.setType("SQL");
            Map<String, String> sourceSql2 = new HashMap<>();
            sourceSql2.put("datasource", "default");
            sourceSql2.put("sqlStr", "SELECT * FROM aaaa");
            iplnDataCheckItemDTO2.setSourceSql(sourceSql2);
            Map<String, String> targetSql2 = new HashMap<>();
            targetSql2.put("datasource", "default");
            targetSql2.put("sqlStr", "SELECT * FROM bbbb");
            iplnDataCheckItemDTO2.setTargetSql(targetSql2);

            List<CheckRule> dataCheckItemRule21 = new LinkedList<>();

            CheckRule rule211 = new CheckRule();
            rule211.setSource("Account");
            rule211.setOp("IS NULL");
            rule211.setTarget(null);
            rule211.setoMsg("success");
            rule211.setxMsg("fail");
            dataCheckItemRule21.add(rule211);

            iplnDataCheckItemDTO2.setDataCheckItemRules(dataCheckItemRule21);

            dataCheckItems.add(iplnDataCheckItemDTO2);

            result.setDataCheckItems(dataCheckItems);
        }
        return result;
    }

    static class IplnDataCheckDTO implements Serializable {
        private String id;
        private String checkCode;
        private String checkTitle;
        private String createdBy;
        private Date creationDate;
        private String lastUpdatedBy;
        private Date lastUpdateDate;
        private List<IplnDataCheckItemDTO> dataCheckItems;
        public String getId() {
            return id;
        }
        public void setId(String id) {
            this.id = id;
        }
        public String getCheckCode() {
            return checkCode;
        }
        public void setCheckCode(String checkCode) {
            this.checkCode = checkCode;
        }
        public String getCheckTitle() {
            return checkTitle;
        }
        public void setCheckTitle(String checkTitle) {
            this.checkTitle = checkTitle;
        }
        public String getCreatedBy() {
            return createdBy;
        }
        public void setCreatedBy(String createdBy) {
            this.createdBy = createdBy;
        }
        public Date getCreationDate() {
            return creationDate;
        }
        public void setCreationDate(Date creationDate) {
            this.creationDate = creationDate;
        }
        public String getLastUpdatedBy() {
            return lastUpdatedBy;
        }
        public void setLastUpdatedBy(String lastUpdatedBy) {
            this.lastUpdatedBy = lastUpdatedBy;
        }
        public Date getLastUpdateDate() {
            return lastUpdateDate;
        }
        public void setLastUpdateDate(Date lastUpdateDate) {
            this.lastUpdateDate = lastUpdateDate;
        }
        public List<IplnDataCheckItemDTO> getDataCheckItems() {
            return dataCheckItems;
        }
        public void setDataCheckItems(List<IplnDataCheckItemDTO> dataCheckItems) {
            this.dataCheckItems = dataCheckItems;
        }
    }

    static class IplnDataCheckItemDTO implements Serializable {
        private String id;
        private String checkId;
        private String checkItemTitle;
        private int order;
        private String type;
        private Map<String, String> sourceSql;
        private Map<String, String> targetSql;
        private List<CheckRule> dataCheckItemRules;
        private String createdBy;
        private Date creationDate;
        private String lastUpdatedBy;
        private Date lastUpdateDate;
        public String getId() {
            return id;
        }
        public void setId(String id) {
            this.id = id;
        }
        public String getCheckId() {
            return checkId;
        }
        public void setCheckId(String checkId) {
            this.checkId = checkId;
        }
        public String getCheckItemTitle() {
            return checkItemTitle;
        }
        public void setCheckItemTitle(String checkItemTitle) {
            this.checkItemTitle = checkItemTitle;
        }
        public int getOrder() {
            return order;
        }
        public void setOrder(int order) {
            this.order = order;
        }
        public String getType() {
            return type;
        }
        public void setType(String type) {
            this.type = type;
        }
        public Map<String, String> getSourceSql() {
            return sourceSql;
        }
        public void setSourceSql(Map<String, String> sourceSql) {
            this.sourceSql = sourceSql;
        }
        public Map<String, String> getTargetSql() {
            return targetSql;
        }
        public void setTargetSql(Map<String, String> targetSql) {
            this.targetSql = targetSql;
        }
        public List<CheckRule> getDataCheckItemRules() {
            return dataCheckItemRules;
        }
        public void setDataCheckItemRules(List<CheckRule> dataCheckItemRules) {
            this.dataCheckItemRules = dataCheckItemRules;
        }
        public String getCreatedBy() {
            return createdBy;
        }
        public void setCreatedBy(String createdBy) {
            this.createdBy = createdBy;
        }
        public Date getCreationDate() {
            return creationDate;
        }
        public void setCreationDate(Date creationDate) {
            this.creationDate = creationDate;
        }
        public String getLastUpdatedBy() {
            return lastUpdatedBy;
        }
        public void setLastUpdatedBy(String lastUpdatedBy) {
            this.lastUpdatedBy = lastUpdatedBy;
        }
        public Date getLastUpdateDate() {
            return lastUpdateDate;
        }
        public void setLastUpdateDate(Date lastUpdateDate) {
            this.lastUpdateDate = lastUpdateDate;
        }
    }

    static class CheckRule implements Serializable {
        private String source;
        private String op;
        private String target;
        private String oMsg;
        private String xMsg;
        public String getSource() {
            return source;
        }
        public void setSource(String source) {
            this.source = source;
        }
        public String getOp() {
            return op;
        }
        public void setOp(String op) {
            this.op = op;
        }
        public String getTarget() {
            return target;
        }
        public void setTarget(String target) {
            this.target = target;
        }
        public String getoMsg() {
            return oMsg;
        }
        public void setoMsg(String oMsg) {
            this.oMsg = oMsg;
        }
        public String getxMsg() {
            return xMsg;
        }
        public void setxMsg(String xMsg) {
            this.xMsg = xMsg;
        }
    }
}
