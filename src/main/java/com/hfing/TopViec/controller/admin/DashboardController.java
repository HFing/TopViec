package com.hfing.TopViec.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hfing.TopViec.repository.InfoCompanyRepository;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostActivityService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;

@Controller
public class DashboardController {

    private final UserService userService;
    private final JobPostActivityService jobPostActivityService;
    private final InfoCompanyService infoCompanyService;
    private final JobPostService jobPostService;

    public DashboardController(UserService userService, JobPostActivityService jobPostActivityService,
            InfoCompanyService infoCompanyService, JobPostService jobPostService) {
        this.userService = userService;
        this.jobPostActivityService = jobPostActivityService;
        this.infoCompanyService = infoCompanyService;
        this.jobPostService = jobPostService;
    }

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        List<Long> monthlyUserCounts = userService.getMonthlyUserCounts();
        model.addAttribute("monthlyUserCounts", monthlyUserCounts);

        Map<Integer, Long> jobPostActivityCountsByStatus = jobPostActivityService.getJobPostActivityCountsByStatus();
        try {
            String jobPostActivityCountsByStatusJson = objectMapper.writeValueAsString(jobPostActivityCountsByStatus);
            model.addAttribute("jobPostActivityCountsByStatus", jobPostActivityCountsByStatusJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("companies", infoCompanyService.getAllCompanies());

        model.addAttribute("approvedJobPostsCount", jobPostService.countByStatus(1));
        model.addAttribute("pendingJobPostsCount", jobPostService.countByStatus(2));
        model.addAttribute("expiredJobPostsCount", jobPostService.countExpiredJobPosts());
        model.addAttribute("allApplicantsCount", userService.countUsersByRoleName("USER"));
        return "admin/dashboard/show";
    }

}
