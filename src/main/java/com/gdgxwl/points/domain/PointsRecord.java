package com.gdgxwl.points.domain;

import com.gdgxwl.base.domain.BaseEntity;

import javax.persistence.*;
import java.math.BigDecimal;

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
    @Column(name = "RECORD_PLATFORM", length = 200)
    private String recordPlatform;

    /**
     * 笔名
     */
    @Column(name = "RECORD_PENNAME", length = 50)
    private String recordPenname;

    /**
     *
     */
    @Column(name = "RECORD_UID", length = 50)
    private String recordUid;

    /**
     * 扣除积分
     */
    @Column(name = "RECORD_QQ")
    private Integer recordQq;

    /**
     * 版权方
     */
    @Column(name = "RECORD_PAYMENT_TYPE", length = 20)
    private String recordPaymentType;

    /**
     * 经办人
     */
    @Column(name = "RECORD_TAOBAO_NUM", length = 50)
    private String recordTaobaoNum;

    /**
     * 状态
     */
    @Column(name = "RECORD_STATUS", length = 50)
    private String recordStatus;

    /**
     * 商品 ID
     */
    @Column(name = "PRODUCT_ID")
    private Long productId;

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

    public Integer getRecordQq() {
        return recordQq;
    }

    public void setRecordQq(Integer recordQq) {
        this.recordQq = recordQq;
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

    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }
}
