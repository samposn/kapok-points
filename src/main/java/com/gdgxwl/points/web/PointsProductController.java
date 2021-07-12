package com.gdgxwl.points.web;

import com.gdgxwl.base.domain.GxwlSysUser;
import com.gdgxwl.core.common.web.SearchUtil;
import com.gdgxwl.points.domain.PointsProduct;
import com.gdgxwl.points.service.PointsProductService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * ProductController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequestMapping(value = "/product")
public class PointsProductController {

    @Autowired
    private PointsProductService pointsProductService;

    @RequestMapping(value = "/list")
    public String list() {
        return "points/product/product";
    }

    // 查询商品
    @RequestMapping(value = "/search")
    @ResponseBody
    public Map<String, Object> search(HttpServletRequest req) {
        return doSearch(req);
    }

    // 加载商品
    @RequiresPermissions("PRODUCT_EDIT")
    @RequestMapping(value = "/get/{id}")
    @ResponseBody
    public Map<String, Object> get(@PathVariable Integer id) {
        return pointsProductService.doSelect(id);
    }

    // 删除商品
    @RequiresPermissions("PRODUCT_DEL")
    @RequestMapping(value = "/del/{id}")
    @ResponseBody
    public Map<String, Object> del(@PathVariable Integer id) {
        return pointsProductService.doDelete(id);
    }

    // 保存商品
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(PointsProduct pointsProduct) {
        return pointsProductService.doSave(pointsProduct);
    }

    private Map<String, Object> doSearch(HttpServletRequest req) {
        // 构造默认条件
        Map<String, Object> params = new HashMap<String, Object>();

        // 使用 SearchUtil 工具类从前端请求 ServletRequest 里获得 PointsProduct 的查询对象, 并附加上默认条件
        Specification<PointsProduct> spec = SearchUtil.getSpecification(PointsProduct.class, req, params);

        String isAll = req.getParameter("isAll");

        if ("Y".equals(isAll)) {
            Sort sort = SearchUtil.getSort("productId_desc");
            return pointsProductService.doSearch(spec, sort);
        }
        else {
            // 使用 SearchUtil 工具类从前端请求 ServletRequest 里获得分页对象，按用户 ID 倒序
            Pageable pageable = SearchUtil.getPageableWithOrderBy(req, "productId_desc");
            return pointsProductService.doSearch(spec, pageable);
        }
    }

}
