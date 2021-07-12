package com.gdgxwl.points.service.impl;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.service.impl.BaseServiceImpl;
import com.gdgxwl.points.domain.PointsRecord;
import com.gdgxwl.points.repository.PointsRecordDao;
import com.gdgxwl.points.service.PointsRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        try{
            resetResultMap();
            Page<Map<String, Object>> page = pointsRecordDao.search(conditions, pageable);
            resultMap.put(RESULT_ROWS, page.getContent());
            resultMap.put(RESULT_TOTAL, page.getTotalElements());
            resultMap.put(RESULT_MSG, "查询成功！");
        }catch(Exception e){
            e.printStackTrace();
            resultMap.put(RESULT_CODE, -1);
            resultMap.put(RESULT_MSG, "查询出错");
        }
        return resultMap;
    }
}
