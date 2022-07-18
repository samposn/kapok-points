package com.gdgxwl.points.service;

import com.alibaba.fastjson2.JSONObject;
import com.gdgxwl.core.service.BaseService;
import com.gdgxwl.points.domain.PointsProduct;
import com.gdgxwl.points.repository.PointsProductDao;

import java.util.Map;

/**
 * PointsProductService
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
public interface PointsProductService extends BaseService<PointsProductDao, PointsProduct, Integer> {

    Map<String, Object> doSelectProduct(Integer id) throws Exception;

}
