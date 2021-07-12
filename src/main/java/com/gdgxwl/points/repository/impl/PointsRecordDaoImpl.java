package com.gdgxwl.points.repository.impl;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.repository.impl.BaseDaoImpl;
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
        String sql = "SELECT "
            + " 	r.RECORD_PLATFORM AS record_platform "
            + " 	,r.RECORD_PENNAME AS record_penname "
            + " 	,r.RECORD_UID AS record_uid "
            + " 	,r.RECORD_QQ AS record_qq "
            + " 	,p.PRODUCT_NAME AS product_name "
            + " 	,p.PRODUCT_PRICE AS product_price "
            + " 	,p.PRODUCT_ADD_POINTS AS product_add_points "
            + " 	,p.PRODUCT_MINUS_POINTS AS product_minus_points "
            + " 	,p.PRODUCT_COPYRIGHT AS product_copyright "
            + " 	,p.PRODUCT_OPERATOR AS product_operator "
            + " 	,r.RECORD_PAYMENT_TYPE AS record_payment_type "
            + " 	,r.RECORD_TAOBAO_NUM AS record_tabbao_num"
            + " FROM "
            + " 	points_record r "
            + " 	LEFT JOIN points_product p ON r.product_id = p.product_id "
            + " WHERE "
            + "     1 = 1 ";
        return selectBySqlPageable(sql, conditions, pageable);
    }

}
