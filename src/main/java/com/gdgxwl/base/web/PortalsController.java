package com.gdgxwl.base.web;

import com.fasterxml.jackson.core.type.TypeReference;
import com.gdgxwl.core.common.json.JsonUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

/**
 * @author Will WM. Zhang
 * @since 2017-06-11 15:44
 */
@Controller
@RequestMapping("/portals")
public class PortalsController {

    @RequestMapping(value = "/partym")
    public String partym() {
        return "wpc/partym";
    }

    @RequestMapping(value = "/partym/data")
    @ResponseBody
    public Object partymData() throws Exception{
        String partymData = FileUtils.readFileToString(ResourceUtils.getFile("classpath:datas/partym.json"), Charset.defaultCharset());
        TypeReference typeReference = new TypeReference<List<Map<String, Object>>>() {};
        return JsonUtil.parseValue(partymData, typeReference);
    }

    @RequestMapping(value = "/personal")
    public String personal() {
        return "wpc/personal";
    }

    @RequestMapping(value = "/dangan")
    public String dangan() {
        return "wpc/dangan";
    }
    @RequestMapping(value = "/pay")
    public String pay() {
        return "wpc/pay";
    }
    @RequestMapping(value = "/notice")
    public String notice() {
        return "wpc/notice";
    }
    @RequestMapping(value = "/study")
    public String study() {
        return "wpc/study";
    }
    @RequestMapping(value = "/activity")
    public String activity() {
        return "wpc/activity";
    }
    @RequestMapping(value = "/integral")
    public String integral() {
        return "wpc/integral";
    }
    @RequestMapping(value = "/dangzhibu")
    public String dangzhibu() {
        return "wpc/dangzhibu";
    }

}
