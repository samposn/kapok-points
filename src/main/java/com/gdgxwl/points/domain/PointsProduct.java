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
    private Integer productAddPoints;

    /**
     * 扣除积分
     */
    @Column(name = "PRODUCT_MINUS_POINTS")
    private Integer productMinusPoints;

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

    public Integer getProductAddPoints() {
        return productAddPoints;
    }

    public void setProductAddPoints(Integer productAddPoints) {
        this.productAddPoints = productAddPoints;
    }

    public Integer getProductMinusPoints() {
        return productMinusPoints;
    }

    public void setProductMinusPoints(Integer productMinusPoints) {
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
}
