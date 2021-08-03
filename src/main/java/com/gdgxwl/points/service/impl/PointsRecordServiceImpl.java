package com.gdgxwl.points.service.impl;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.service.impl.BaseServiceImpl;
import com.gdgxwl.points.domain.PointsRecord;
import com.gdgxwl.points.repository.PointsRecordDao;
import com.gdgxwl.points.service.PointsRecordService;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * PointsRecordServiceImpl
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Service(value = "pointsRecordService")
@Transactional(readOnly = true)
public class PointsRecordServiceImpl extends
    BaseServiceImpl<PointsRecordDao, PointsRecord, Integer> implements
    PointsRecordService {

    @Autowired
    private PointsRecordDao pointsRecordDao;

    @Autowired
    public PointsRecordServiceImpl(PointsRecordDao pointsRecordDao) {
        super(pointsRecordDao);
    }

    @Override
    public Map<String, Object> search(Map<String, SearchFilter> conditions, Pageable pageable) {
        try {
            resetResultMap();
            Page<Map<String, Object>> page = pointsRecordDao.search(conditions, pageable);
            resultMap.put(RESULT_ROWS, page.getContent());
            resultMap.put(RESULT_TOTAL, page.getTotalElements());
            resultMap.put(RESULT_MSG, "查询成功！");
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put(RESULT_CODE, -1);
            resultMap.put(RESULT_MSG, "查询出错");
        }
        return resultMap;
    }

    @Override
    public Map<String, Object> getOne(Integer id) {
        try {
            resetResultMap();
            Map<String, Object> row = pointsRecordDao.getOne(id);
            resultMap.put(RESULT_ROW, row);
            resultMap.put(RESULT_MSG, "查询成功！");
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put(RESULT_CODE, -1);
            resultMap.put(RESULT_MSG, "查询出错");
        }
        return resultMap;
    }

    @Override
    public BigDecimal totalPoints(Map<String, SearchFilter> conditions) {
        BigDecimal totalAddPoints = new BigDecimal(0);
        BigDecimal totalMinusPoints = new BigDecimal(0);
        try {
            List<Map<String, Object>> list = pointsRecordDao.totalPoints(conditions);
            for (Map<String, Object> item : list) {
                if (item.get("record_add_points") != null &&
                    NumberUtils.isNumber(item.get("record_add_points").toString())) {
                    totalAddPoints = new BigDecimal(item.get("record_add_points").toString()).add(totalAddPoints);
                }
                if (item.get("record_minus_points") != null &&
                    NumberUtils.isNumber(item.get("record_minus_points").toString())) {
                    totalMinusPoints = new BigDecimal(item.get("record_minus_points").toString()).add(totalMinusPoints);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalAddPoints.subtract(totalMinusPoints);
    }
}
