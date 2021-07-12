package com.gdgxwl.base.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * GxwlSysController
 *
 * @author <a href="mailto:samposn@163.com">Will WM. Zhang</a>
 * @since 1.0
 */
@Controller
@RequestMapping("/sys")
public class GxwlSysController {

    @RequestMapping
    public String index() {
        return "base/sys/sys";
    }

}
