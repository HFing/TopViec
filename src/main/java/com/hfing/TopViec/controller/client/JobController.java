package com.hfing.TopViec.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobController {
    @GetMapping("/job")
    public String getJobDetailPage() {
        return "client/job/show";
    }

}
