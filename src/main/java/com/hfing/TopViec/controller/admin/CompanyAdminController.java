package com.hfing.TopViec.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyAdminController {
    @GetMapping("/admin/company")
    public String getMethodName() {
        return "admin/company/show";
    }

}
