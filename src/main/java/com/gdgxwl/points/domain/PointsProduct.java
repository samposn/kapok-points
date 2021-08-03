package com.gdgxwl.points.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.gdgxwl.base.domain.BaseEntity;
import com.gdgxwl.core.common.json.JsonDateTimeSerializer;
import org.springframework.data.annotation.LastModifiedDate;
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
@Table(name = "POINTS_PRODUCT")
public class PointsProduct extends BaseEntity {

    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "PRODUCT_ID")
    private Integer productId;

    /**
     * 商品名称
     */
    @Column(name = "PRODUCT_NAME", length = 200)
    private String productName;

    /**
     * 商品价格
     */
    @Column(name = "PRODUCT_PRICE")
    private BigDecimal productPrice;

    /**
     * 获取积分
     */
    @Column(name = "PRODUCT_ADD_POINTS")
    private BigDecimal productAddPoints;

    /**
     * 扣除积分
     */
    @Column(name = "PRODUCT_MINUS_POINTS")
    private BigDecimal productMinusPoints;

    /**
     * 版权方
     */
    @Column(name = "PRODUCT_COPYRIGHT", length = 200)
    private String productCopyright;

    /**
     * 经办人
     */
    @Column(name = "PRODUCT_OPERATOR", length = 50)
    private String productOperator;

    /**
     * 链接有效时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonSerialize(using = JsonDateTimeSerializer.class)
    @Column(name = "PRODUCT_URL_EXPIRES")
    private Date productUrlExpires;

    /**
     * 状态
     */
    @Column(name = "PRODUCT_STATUS", length = 50)
    private String productStatus;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public BigDecimal getProductAddPoints() {
        return productAddPoints;
    }

    public void setProductAddPoints(BigDecimal productAddPoints) {
        this.productAddPoints = productAddPoints;
    }

    public BigDecimal getProductMinusPoints() {
        return productMinusPoints;
    }

    public void setProductMinusPoints(BigDecimal productMinusPoints) {
        this.productMinusPoints = productMinusPoints;
    }

    public String getProductCopyright() {
        return productCopyright;
    }

    public void setProductCopyright(String productCopyright) {
        this.productCopyright = productCopyright;
    }

    public String getProductOperator() {
        return productOperator;
    }

    public void setProductOperator(String productOperator) {
        this.productOperator = productOperator;
    }

    public Date getProductUrlExpires() {
        return productUrlExpires;
    }

    public void setProductUrlExpires(Date productUrlExpires) {
        this.productUrlExpires = productUrlExpires;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }
}
