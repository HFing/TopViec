package com.hfing.TopViec.controller.client;

import java.util.Locale;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.JobPostService;

@Controller
public class JobController {

    private final JobPostService jobPostService;
    private final CommonCityService commonCityService;

    public JobController(JobPostService jobPostService, CommonCityService commonCityService) {
        this.jobPostService = jobPostService;
        this.commonCityService = commonCityService;
    }

    @GetMapping("/job/{id}")
    public String getJobDetailPage(@PathVariable("id") Long id, Model model) {
        JobPost jobPost = jobPostService.getJobPostById(id);
        java.text.NumberFormat numberFormat = java.text.NumberFormat.getInstance(new Locale("vi", "VN"));
        String formattedSalaryMax = numberFormat.format(jobPost.getSalaryMax());
        model.addAttribute("city", commonCityService.findById(jobPost.getLocation().getCity().getId()));
        model.addAttribute("jobPost", jobPost);
        model.addAttribute("formattedSalaryMax", formattedSalaryMax);
        return "client/job/show";
    }

}
