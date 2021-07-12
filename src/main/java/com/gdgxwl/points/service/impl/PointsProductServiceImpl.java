package com.gdgxwl.points.service.impl;

import com.gdgxwl.core.service.impl.BaseServiceImpl;
import com.gdgxwl.points.domain.PointsProduct;
import com.gdgxwl.points.repository.PointsProductDao;
import com.gdgxwl.points.service.PointsProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * PointsProductServiceImpl
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Service(value = "pointsProductService")
@Transactional(readOnly = true)
public class PointsProductServiceImpl extends
    BaseServiceImpl<PointsProductDao, PointsProduct, Integer> implements
    PointsProductService {

    @Autowired
    public PointsProductServiceImpl(PointsProductDao pointsProductDao) {
        super(pointsProductDao);
    }
}
