package com.gdgxwl.base.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * MainController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping
    public String index() {
        return "base/main";
    }

    @RequestMapping(value = "/workbench")
    public String workbench(HttpServletRequest req) {
        return req.getParameter("url");
    }
}
