package com.hfing.TopViec.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PricingController {

    @GetMapping("/pricing")
    public String getPricingPage() {
        return "client/pricing/show";
    }

    @GetMapping("/pricing/1-job")
    public String getPricingPage1Job() {
        return "client/pricing/1-job";
    }

    @GetMapping("/pricing/3-job")
    public String getPricingPage3Job() {
        return "client/pricing/3-job";
    }

    @GetMapping("/pricing/5-job")
    public String getPricingPage5Job() {
        return "client/pricing/5-job";
    }

}
