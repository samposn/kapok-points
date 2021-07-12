package com.gdgxwl.points.repository;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.repository.BaseDao;
import com.gdgxwl.points.domain.PointsRecord;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * PointsRecordDao
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public interface PointsRecordDao extends BaseDao<PointsRecord, Integer>, PointsRecordDaoPlus {



}
