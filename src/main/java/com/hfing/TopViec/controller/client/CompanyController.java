package com.hfing.TopViec.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyController {
    @GetMapping("/companies")
    public String getComPany() {
        return "client/company/show";
    }

    @GetMapping("/companies/{id}")
    public String getMethodName() {
        return "client/company/detail";
    }

}
