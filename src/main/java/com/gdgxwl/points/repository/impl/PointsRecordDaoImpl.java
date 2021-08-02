package com.gdgxwl.points.repository.impl;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.repository.impl.BaseDaoImpl;
import com.gdgxwl.core.repository.impl.Field;
import com.gdgxwl.core.repository.impl.ResultFields;
import com.gdgxwl.points.repository.PointsRecordDaoPlus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
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
        fields.addField("recordId")
            .addField("record_platform")
            .addField("record_penname")
            .addField("record_uid")
            .addField("record_qq")
            .addField("product_name")
            .addField("product_price")
            .addField("record_price")
            .addField("record_add_points")
            .addField("record_minus_points")
            .addField("product_copyright")
            .addField("record_operator")
            .addField("product_status")
            .addField("record_payment_type")
            .addField("record_taobao_num")
            .addField("record_url_expires", Field.DataType.Timestamp)
            .addField("create_time", Field.DataType.Timestamp);

        String sql = "SELECT "
            + "     r.RECORD_ID "
            + " 	,r.RECORD_PLATFORM "
            + " 	,r.RECORD_PENNAME "
            + " 	,r.RECORD_UID "
            + " 	,r.RECORD_QQ "
            + " 	,p.PRODUCT_NAME "
            + " 	,r.PRODUCT_PRICE "
            + " 	,r.RECORD_PRICE "
            + " 	,r.RECORD_ADD_POINTS "
            + " 	,r.RECORD_MINUS_POINTS "
            + " 	,p.PRODUCT_COPYRIGHT "
            + " 	,r.RECORD_OPERATOR "
            + "     ,p.PRODUCT_STATUS "
            + " 	,r.RECORD_PAYMENT_TYPE "
            + " 	,r.RECORD_TAOBAO_NUM "
            + "     ,r.RECORD_URL_EXPIRES "
            + "     ,r.CREATE_TIME "
            + " FROM "
            + " 	points_record r "
            + " 	LEFT JOIN points_product p ON r.product_id = p.product_id "
            + " WHERE "
            + "     1 = 1 ";
        return selectBySqlPageable(sql, conditions, pageable, fields);
    }

    @Override
    public Map<String, Object> getOne(Integer id) {

        ResultFields fields = new ResultFields();
        fields.addField("recordId")
            .addField("recordPlatform")
            .addField("recordPenname")
            .addField("recordUid")
            .addField("recordQq")
            .addField("product_name")
            .addField("productPrice")
            .addField("recordPrice")
            .addField("recordAddPoints")
            .addField("recordMinusPoints")
            .addField("product_copyright")
            .addField("recordOperator")
            .addField("product_status")
            .addField("recordPaymentType")
            .addField("recordTaobaoNum")
            .addField("productId")
            .addField("createrId")
            .addField("recordUrlExpires", Field.DataType.Timestamp)
            .addField("createTime", Field.DataType.Timestamp);

        String sql = "SELECT "
            + "     r.RECORD_ID "
            + " 	,r.RECORD_PLATFORM "
            + " 	,r.RECORD_PENNAME "
            + " 	,r.RECORD_UID "
            + " 	,r.RECORD_QQ "
            + " 	,p.PRODUCT_NAME "
            + " 	,r.PRODUCT_PRICE "
            + " 	,r.RECORD_PRICE "
            + " 	,r.RECORD_ADD_POINTS "
            + " 	,r.RECORD_MINUS_POINTS "
            + " 	,p.PRODUCT_COPYRIGHT "
            + " 	,r.RECORD_OPERATOR "
            + "     ,p.PRODUCT_STATUS "
            + " 	,r.RECORD_PAYMENT_TYPE "
            + " 	,r.RECORD_TAOBAO_NUM "
            + "     ,r.PRODUCT_ID "
            + "     ,r.CREATE_BY "
            + "     ,r.RECORD_URL_EXPIRES "
            + "     ,r.CREATE_TIME "
            + " FROM "
            + " 	points_record r "
            + " 	LEFT JOIN points_product p ON r.product_id = p.product_id "
            + " WHERE "
            + "     1 = 1 "
            + "     AND r.RECORD_ID = " + id;
        return selectOneBySql(sql,fields);
    }

    @Override
    public List<Map<String, Object>> totalPoints(Map<String, SearchFilter> conditions) {

        ResultFields fields = new ResultFields();
        fields.addField("record_add_points")
            .addField("record_minus_points");

        String sql = "SELECT "
            + " 	r.RECORD_ADD_POINTS "
            + " 	,r.RECORD_MINUS_POINTS "
            + " FROM "
            + " 	points_record r "
            + " 	LEFT JOIN points_product p ON r.product_id = p.product_id "
            + " WHERE "
            + "     1 = 1 ";

        return selectBySql(sql, conditions, fields);
    }


}
