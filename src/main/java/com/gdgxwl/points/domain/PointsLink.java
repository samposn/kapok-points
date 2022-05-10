package com.gdgxwl.points.domain;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.gdgxwl.core.common.json.JsonDateTimeSerializer;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

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
     * 参数
     */

    @Column(name = "PARAMS")
    private String params;

    /**
     * 过期时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonSerialize(using = JsonDateTimeSerializer.class)
    @Column(name = "EXPIRES")
    private Date expires;
}
