package com.hfing.TopViec.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JobController {
    @GetMapping("/job")
    public String getJobDetailPage() {
        return "client/job/show";
    }

}
