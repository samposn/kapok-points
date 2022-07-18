package com.gdgxwl.points.web;

import com.alibaba.fastjson2.JSONObject;
import com.gdgxwl.core.common.json.JsonUtil;
import com.gdgxwl.core.common.web.SearchUtil;
import com.gdgxwl.points.domain.PointsRecord;
import com.gdgxwl.points.service.PointsLinkService;
import com.gdgxwl.points.service.PointsRecordService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * PointsRecordController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/record")
public class PointsRecordController {

    private final PointsRecordService pointsRecordService;
    private final PointsLinkService pointsLinkService;

    @RequestMapping(value = "/list")
    public String list() {
        return "points/record/record";
    }

    @RequestMapping(value = "/add/{id}")
    public String add(Model model,  @PathVariable String id) throws Exception {
        Map<String, Object> stringObjectMap = pointsLinkService.doSelectLink(id);
        model.addAttribute("resultCode", stringObjectMap.get("resultCode"));
        model.addAttribute("resultMsg", stringObjectMap.get("resultMsg"));
        model.addAttribute("errorCode", stringObjectMap.get("errorCode"));

        JSONObject pointsLink = (JSONObject) stringObjectMap.get("row");
        Map<String, Object> data;
        if (pointsLink != null) {
            data = JsonUtil.parseValue(pointsLink.getString("params"));
            String everLink = data.getOrDefault("everLink","").toString();
            String recordUrlExpires = data.getOrDefault("recordUrlExpires", "1970-01-01 00:00:00").toString();
            if (StringUtils.equals(everLink, "YES")) {
                data.put("exp", Long.MAX_VALUE);
            } else {
                Date expDate = DateUtils.parseDate(recordUrlExpires, "yyyy-MM-dd HH:mm:ss");
                data.put("exp", expDate.getTime());
            }
            data.put("productId", pointsLink.getString("productId"));
            data.put("productName", pointsLink.getString("productName"));
            data.put("productPrice", pointsLink.getString("productPrice"));
            data.put("productCopyright", pointsLink.getString("productCopyright"));
        } else {
            data = new HashMap<>();
            data.put("exp", 0);
        }
        model.addAttribute("row", data);
        return "points/record/record-add";
    }

    @RequestMapping(value = "/query")
    public String query() {
        return "points/record/record-query";
    }

    @RequestMapping(value = "/query/show/{qq}")
    public String queryShow(Model model,
                            @PathVariable String qq) {
        model.addAttribute("qq", qq);
        return "points/record/record-query-show";
    }

    // 查询记录
    @RequestMapping(value = "/search")
    @ResponseBody
    public Map<String, Object> search(HttpServletRequest req) {
        Map<String, Object> stringObjectMap = pointsRecordService.search(SearchUtil.getSearchFilters(req),
            SearchUtil.getPageableWithOrderBy(req, "r.LAST_UPDATE_TIME_desc"));
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");
        String totalPoints = decimalFormat
            .format(pointsRecordService.totalPoints(SearchUtil.getSearchFilters(req)));
        stringObjectMap.put("totalPoints", totalPoints);
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
