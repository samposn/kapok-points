package com.gdgxwl.points.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.gdgxwl.base.domain.BaseEntity;
import com.gdgxwl.core.common.json.JsonDateTimeSerializer;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * PointsProduct
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Entity
@Table(name = "POINTS_RECORD")
public class PointsRecord extends BaseEntity {

    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "RECORD_ID")
    private Integer recordId;

    /**
     * 平台
     */
    @Column(name = "RECORD_PLATFORM", length = 50)
    private String recordPlatform;

    /**
     * 笔名
     */
    @Column(name = "RECORD_PENNAME", length = 50)
    private String recordPenname;

    /**
     * UID
     */
    @Column(name = "RECORD_UID", length = 50)
    private String recordUid;

    /**
     * QQ
     */
    @Column(name = "RECORD_QQ", length = 20)
    private String recordQq;

    /**
     * 商品价格
     */
    @Column(name = "PRODUCT_PRICE")
    private BigDecimal productPrice;

    /**
     * 销售价格
     */
    @Column(name = "RECORD_PRICE")
    private BigDecimal recordPrice;

    /**
     * 获取积分
     */
    @Column(name = "RECORD_ADD_POINTS")
    private BigDecimal recordAddPoints;

    /**
     * 扣除积分
     */
    @Column(name = "RECORD_MINUS_POINTS")
    private BigDecimal recordMinusPoints;

    /**
     * 支付方式
     */
    @Column(name = "RECORD_PAYMENT_TYPE", length = 20)
    private String recordPaymentType;

    /**
     * 淘宝订单号
     */
    @Column(name = "RECORD_TAOBAO_NUM", length = 50)
    private String recordTaobaoNum;

    /**
     * 商品 ID
     */
    @Column(name = "PRODUCT_ID")
    private Long productId;

    /**
     * 经办人
     */
    @Column(name = "RECORD_OPERATOR", length = 50)
    private String recordOperator;

    /**
     * 链接有效时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonSerialize(using = JsonDateTimeSerializer.class)
    @Column(name = "RECORD_URL_EXPIRES")
    private Date recordUrlExpires;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getRecordPlatform() {
        return recordPlatform;
    }

    public void setRecordPlatform(String recordPlatform) {
        this.recordPlatform = recordPlatform;
    }

    public String getRecordPenname() {
        return recordPenname;
    }

    public void setRecordPenname(String recordPenname) {
        this.recordPenname = recordPenname;
    }

    public String getRecordUid() {
        return recordUid;
    }

    public void setRecordUid(String recordUid) {
        this.recordUid = recordUid;
    }

    public String getRecordQq() {
        return recordQq;
    }

    public void setRecordQq(String recordQq) {
        this.recordQq = recordQq;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public BigDecimal getRecordPrice() {
        return recordPrice;
    }

    public void setRecordPrice(BigDecimal recordPrice) {
        this.recordPrice = recordPrice;
    }

    public BigDecimal getRecordAddPoints() {
        return recordAddPoints;
    }

    public void setRecordAddPoints(BigDecimal recordAddPoints) {
        this.recordAddPoints = recordAddPoints;
    }

    public BigDecimal getRecordMinusPoints() {
        return recordMinusPoints;
    }

    public void setRecordMinusPoints(BigDecimal recordMinusPoints) {
        this.recordMinusPoints = recordMinusPoints;
    }

    public String getRecordPaymentType() {
        return recordPaymentType;
    }

    public void setRecordPaymentType(String recordPaymentType) {
        this.recordPaymentType = recordPaymentType;
    }

    public String getRecordTaobaoNum() {
        return recordTaobaoNum;
    }

    public void setRecordTaobaoNum(String recordTaobaoNum) {
        this.recordTaobaoNum = recordTaobaoNum;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getRecordOperator() {
        return recordOperator;
    }

    public void setRecordOperator(String recordOperator) {
        this.recordOperator = recordOperator;
    }

    public Date getRecordUrlExpires() {
        return recordUrlExpires;
    }

    public void setRecordUrlExpires(Date recordUrlExpires) {
        this.recordUrlExpires = recordUrlExpires;
    }
}
