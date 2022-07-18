package com.gdgxwl.points.web;

import com.gdgxwl.points.domain.PointsLink;
import com.gdgxwl.points.service.PointsLinkService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * PointsLinkController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/link")
public class PointsLinkController {

    private final PointsLinkService pointsLinkService;

    // 保存链接
    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Map<String, Object> save(PointsLink pointsLink) {
        return pointsLinkService.doSave(pointsLink);
    }

    @ResponseBody
    @RequestMapping(value = "/del", method = RequestMethod.DELETE)
    public Map<String, Object> del(@RequestBody String idStr) {
        String[] ids = StringUtils.split(idStr, ",");
        List<PointsLink> pointsLinks = Arrays.stream(ids).map(id -> {
            PointsLink pointsLink = new PointsLink();
            pointsLink.setId(id);
            return pointsLink;
        }).collect(Collectors.toList());
        return pointsLinkService.doDelete(pointsLinks);
    }

}
