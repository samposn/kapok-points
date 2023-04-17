package com.gdgxwl.points.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.gdgxwl.core.common.json.JsonUtil;
import com.gdgxwl.core.service.impl.BaseServiceImpl;
import com.gdgxwl.points.domain.PointsLink;
import com.gdgxwl.points.domain.PointsProduct;
import com.gdgxwl.points.repository.PointsLinkDao;
import com.gdgxwl.points.repository.PointsProductDao;
import com.gdgxwl.points.service.PointsLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

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
    private PointsProductDao pointsProductDao;

    @Autowired
    private PointsLinkDao pointsLinkDao;

    @Autowired
    public PointsLinkServiceImpl(PointsLinkDao pointsLinkDao) {
        super(pointsLinkDao);
    }

    @Override
    public Map<String, Object> doSelectLink(String id) throws Exception {

        PointsLink pointsLink = pointsLinkDao.findOne(id);
        if (pointsLink == null) {
            resetResultMap();
            resultMap.put("resultCode", 1);
            resultMap.put("errorCode", "");
            resultMap.put("resultMsg", "找不到对应商品的授权登记链接！请联系商家。");
            return resultMap;
        }

        String pointsLinkJsonStr = JsonUtil.toJsonString(pointsLink);
        JSONObject pointsLinkJsonObject = JSON.parseObject(pointsLinkJsonStr);

        Integer productId = pointsLinkJsonObject.getInteger("productId");
        PointsProduct pointsProduct = pointsProductDao.findOne(productId);

        pointsLinkJsonObject.put("productPrice", pointsProduct.getProductPrice());
        pointsLinkJsonObject.put("productName", pointsProduct.getProductName());
        pointsLinkJsonObject.put("productCopyright", pointsProduct.getProductCopyright());

        resetResultMap();
        resultMap.put("resultCode", 0);
        resultMap.put("errorCode", "");
        resultMap.put("resultMsg", "查询成功");
        resultMap.put("row", pointsLinkJsonObject);

        return resultMap;
    }
}
