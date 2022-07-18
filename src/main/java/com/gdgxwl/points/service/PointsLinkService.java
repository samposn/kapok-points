package com.gdgxwl.points.service;

import com.gdgxwl.core.service.BaseService;
import com.gdgxwl.points.domain.PointsLink;
import com.gdgxwl.points.repository.PointsLinkDao;

import java.util.Map;

/**
 * PointsLinkService
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public interface PointsLinkService extends BaseService<PointsLinkDao, PointsLink, String> {

    Map<String, Object> doSelectLink(String id) throws Exception;

}
