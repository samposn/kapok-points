package com.gdgxwl.base.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard")
public class IndexController {

	@RequestMapping(value = "/index")
	public String index() {
		return "base/index";
	}

	// 单模块模式
	@RequestMapping(value = "/home")
	public String home() {
		return "base/home/home";
	}

	// 单模块模式
	@RequestMapping(value = "/home/index")
	public String homeIndex() {
		return "base/home/index";
	}

}