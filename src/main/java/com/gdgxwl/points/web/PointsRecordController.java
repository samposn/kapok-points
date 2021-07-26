package com.gdgxwl.points.web;

import com.gdgxwl.core.common.web.SearchUtil;
import com.gdgxwl.points.domain.PointsRecord;
import com.gdgxwl.points.service.PointsProductService;
import com.gdgxwl.points.service.PointsRecordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * PointsRecordController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequestMapping(value = "/record")
public class PointsRecordController {

    @Autowired
    private PointsProductService pointsProductService;

    @Autowired
    private PointsRecordService pointsRecordService;

    @RequestMapping(value = "/list")
    public String list() {
        return "points/record/record";
    }

    @RequestMapping(value = "/add/{productId}")
    public String add(Model model,  @PathVariable Integer productId) {
        Map<String, Object> stringObjectMap = pointsProductService.doSelect(productId);
        model.addAttribute("resultCode", stringObjectMap.get("resultCode"));
        model.addAttribute("resultMsg", stringObjectMap.get("resultMsg"));
        model.addAttribute("errorCode", stringObjectMap.get("errorCode"));
        model.addAttribute("row", stringObjectMap.get("row"));
        return "points/record/record-add";
    }

    @RequestMapping(value = "/query")
    public String query() {
        return "points/record/record-query";
    }

    @RequestMapping(value = "/query/show/{qq}/{uid}")
    public String queryShow(Model model,
                            @PathVariable String qq,
                            @PathVariable String uid) {
        model.addAttribute("qq", qq);
        model.addAttribute("uid", uid);
        return "points/record/record-query-show";
    }

    // 查询记录
    @RequestMapping(value = "/search")
    @ResponseBody
    public Map<String, Object> search(HttpServletRequest req) {
        Map<String, Object> stringObjectMap = pointsRecordService.search(SearchUtil.getSearchFilters(req),SearchUtil.getPageable(req));
        stringObjectMap.put("totalPoints", pointsRecordService.totalPoints(SearchUtil.getSearchFilters(req)));
        return stringObjectMap;
    }

    // 加载记录
    @RequiresPermissions("RECORD_EDIT")
    @RequestMapping(value = "/get/{id}")
    @ResponseBody
    public Map<String, Object> get(@PathVariable Integer id) {
        return pointsRecordService.getOne(id);
    }

    // 删除记录
    @RequiresPermissions("RECORD_DEL")
    @RequestMapping(value = "/del/{id}")
    @ResponseBody
    public Map<String, Object> del(@PathVariable Integer id) {
        return pointsRecordService.doDelete(id);
    }

    // 保存记录
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(PointsRecord pointsRecord) {
        return pointsRecordService.doSave(pointsRecord);
    }

}
