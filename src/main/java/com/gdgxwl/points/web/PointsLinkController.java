package com.gdgxwl.points.web;

import com.gdgxwl.points.domain.PointsLink;
import com.gdgxwl.points.service.PointsLinkService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

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

}
