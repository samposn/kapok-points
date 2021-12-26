package com.gdgxwl.datacheck.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * IplnDataCheckItem
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public class IplnDataCheckItem implements Serializable {

    private static final long serialVersionUID = 8588991509781147753L;

    private String id;
    private String checkId;
    private String checkItemCode;
    private String checkItemTitle;
    private int order;
    private String type;
    private String sourceSql;
    private String targetSql;
    private String checkRule;
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
    public String getCheckItemCode() {
        return checkItemCode;
    }
    public void setCheckItemCode(String checkItemCode) {
        this.checkItemCode = checkItemCode;
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
    public String getSourceSql() {
        return sourceSql;
    }
    public void setSourceSql(String sourceSql) {
        this.sourceSql = sourceSql;
    }
    public String getTargetSql() {
        return targetSql;
    }
    public void setTargetSql(String targetSql) {
        this.targetSql = targetSql;
    }
    public String getCheckRule() {
        return checkRule;
    }
    public void setCheckRule(String checkRule) {
        this.checkRule = checkRule;
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
