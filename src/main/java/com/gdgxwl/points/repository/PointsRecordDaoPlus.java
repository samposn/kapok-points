package com.gdgxwl.points.repository;

import com.gdgxwl.core.common.persistence.SearchFilter;
import com.gdgxwl.core.repository.BaseDaoPlus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

/**
 * PointsRecordDaoPlus
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public interface PointsRecordDaoPlus extends BaseDaoPlus {

    Page<Map<String, Object>> search(
        Map<String, SearchFilter> conditions, Pageable pageable);

}
