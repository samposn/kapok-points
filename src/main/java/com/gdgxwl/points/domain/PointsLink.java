package com.gdgxwl.points.domain;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * PointsLink
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Data
@Entity
@GenericGenerator(name = "jpa-uuid", strategy = "uuid")
@Table(name = "POINTS_LINK")
public class PointsLink {


    /**
     * 主键
     */
    @Id
    @GeneratedValue(generator = "jpa-uuid")
    @Column(name = "ID")
    private String id ;

    /**
     * 链接标题
     */
    @Column(name = "LINK_TITLE")
    private String linkTitle;

    /**
     * 商品 ID
     */
    @Column(name = "PRODUCT_ID")
    private Integer productId;

    /**
     * 参数
     */
    @Column(name = "PARAMS")
    private String params;

}
