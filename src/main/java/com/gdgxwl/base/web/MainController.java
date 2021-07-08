package com.gdgxwl.base.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping
public class MainController {

	@RequestMapping(value = "/main")
	public String main() {
		return "base/main";
	}

	@RequestMapping(value = "/main/workbench")
	public String home(HttpServletRequest req) {
		return req.getParameter("url");
	}

}