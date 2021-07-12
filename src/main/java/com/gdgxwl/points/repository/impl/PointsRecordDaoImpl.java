package com.gdgxwl.points.repository.impl;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.repository.impl.BaseDaoImpl;
import com.gdgxwl.core.repository.impl.Field;
import com.gdgxwl.core.repository.impl.ResultFields;
import com.gdgxwl.points.repository.PointsRecordDaoPlus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * PointsRecordDaoImpl
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public class PointsRecordDaoImpl extends BaseDaoImpl implements PointsRecordDaoPlus {

    @Override
    public Page<Map<String, Object>> search(
        Map<String, SearchFilter> conditions, Pageable pageable) {

        ResultFields fields = new ResultFields();
        fields.addField("record_platform")
            .addField("record_penname")
            .addField("record_uid")
            .addField("record_qq")
            .addField("product_name")
            .addField("product_price")
            .addField("product_add_points")
            .addField("product_minus_points")
            .addField("product_copyright")
            .addField("product_operator")
            .addField("record_payment_type")
            .addField("record_tabbao_num")
            .addField("create_time", Field.DataType.Timestamp);

        String sql = "SELECT "
            + " 	r.RECORD_PLATFORM "
            + " 	,r.RECORD_PENNAME "
            + " 	,r.RECORD_UID "
            + " 	,r.RECORD_QQ "
            + " 	,p.PRODUCT_NAME "
            + " 	,p.PRODUCT_PRICE "
            + " 	,p.PRODUCT_ADD_POINTS "
            + " 	,p.PRODUCT_MINUS_POINTS "
            + " 	,p.PRODUCT_COPYRIGHT "
            + " 	,p.PRODUCT_OPERATOR "
            + " 	,r.RECORD_PAYMENT_TYPE "
            + " 	,r.RECORD_TAOBAO_NUM "
            + "     ,r.CREATE_TIME "
            + " FROM "
            + " 	points_record r "
            + " 	LEFT JOIN points_product p ON r.product_id = p.product_id "
            + " WHERE "
            + "     1 = 1 ";
        return selectBySqlPageable(sql, conditions, pageable, fields);
    }

}
