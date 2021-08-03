package com.gdgxwl.points.service;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.service.BaseService;
import com.gdgxwl.points.domain.PointsRecord;
import com.gdgxwl.points.repository.PointsRecordDao;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * PointsRecordService
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public interface PointsRecordService extends BaseService<PointsRecordDao, PointsRecord, Integer> {

    Map<String, Object> search(Map<String, SearchFilter> conditions, Pageable pageable);

    Map<String, Object> getOne(Integer id);

    Double totalPoints(Map<String, SearchFilter> conditions);

}
