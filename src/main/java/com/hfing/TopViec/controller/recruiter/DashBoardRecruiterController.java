package com.hfing.TopViec.controller.recruiter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardRecruiterController {
    @GetMapping("/recruiter")
    public String getDashBoardRecruiter() {
        return "recruiter/dashboard/show";
    }

}
