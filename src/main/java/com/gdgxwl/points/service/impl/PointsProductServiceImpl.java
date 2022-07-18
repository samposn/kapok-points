package com.gdgxwl.points.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.gdgxwl.core.common.json.JsonUtil;
import com.gdgxwl.core.service.impl.BaseServiceImpl;
import com.gdgxwl.points.domain.PointsLink;
import com.gdgxwl.points.domain.PointsProduct;
import com.gdgxwl.points.repository.PointsLinkDao;
import com.gdgxwl.points.repository.PointsProductDao;
import com.gdgxwl.points.service.PointsProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    private PointsProductDao pointsProductDao;

    @Autowired
    private PointsLinkDao pointsLinkDao;

    @Autowired
    public PointsProductServiceImpl(PointsProductDao pointsProductDao) {
        super(pointsProductDao);
    }

    @Override
    public Map<String, Object> doSelectProduct(Integer id) throws Exception {

        String productJsonStr = JsonUtil.toJsonString(pointsProductDao.findOne(id));

        JSONObject pointsProduct = JSON.parseObject(productJsonStr);

        Specification<PointsLink> spec = (root, criteriaQuery, criteriaBuilder) -> {
            Path<Integer> productIdPath = root.get("productId");
            return criteriaBuilder.equal(productIdPath, id);
        };

        List<JSONObject> pointsLinks = pointsLinkDao.findAll(spec).stream().map(item -> {
            JSONObject pointsLink = JSON.parseObject(item.getParams());
            pointsLink.put("id", item.getId());
            pointsLink.put("productId", id);
            pointsLink.put("linkTitle", item.getLinkTitle());
            return pointsLink;
        }).collect(Collectors.toList());

        pointsProduct.put("pointsLinks", pointsLinks);

        resetResultMap();
        resultMap.put("resultCode", 0);
        resultMap.put("errorCode", "");
        resultMap.put("resultMsg", "查询成功");
        resultMap.put("row", pointsProduct);

        return resultMap;
    }
}
