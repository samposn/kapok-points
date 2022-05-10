package com.gdgxwl.points.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * IndexController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequestMapping
public class PointsController {

    @RequestMapping("/")
    public String index() {
        return "points/index";
    }

    @RequestMapping("/authInfo")
    public String authInfo() {
        return "points/auth-info";
    }

}
