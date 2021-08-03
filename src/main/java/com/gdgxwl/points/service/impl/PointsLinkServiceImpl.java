package com.gdgxwl.points.service.impl;

import com.gdgxwl.core.service.impl.BaseServiceImpl;
import com.gdgxwl.points.domain.PointsLink;
import com.gdgxwl.points.repository.PointsLinkDao;
import com.gdgxwl.points.service.PointsLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * PointsLinkServiceImpl
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Service(value = "pointsLinkService")
@Transactional(readOnly = true)
public class PointsLinkServiceImpl extends
    BaseServiceImpl<PointsLinkDao, PointsLink,  String> implements
    PointsLinkService {

    @Autowired
    public PointsLinkServiceImpl(PointsLinkDao pointsLinkDao) {
        super(pointsLinkDao);
    }
}
