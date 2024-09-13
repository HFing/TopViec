package com.hfing.TopViec.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JobAdminControllerr {
    private final UserService userService;
    private final JobPostService jobPostService;

    public JobAdminControllerr(UserService userService, JobPostService jobPostService) {
        this.userService = userService;
        this.jobPostService = jobPostService;
    }

    @GetMapping("/admin/job")
    public String getJobAdminPage(Model model) {
        model.addAttribute("jobList", jobPostService.getAllJobPosts());
        model.addAttribute("jobPost", new JobPost()); // Add this line
        return "admin/job/show";
    }

    @PostMapping("/admin/job/updateStatus")
    public String updateJobStatus(@RequestParam("id") Long jobPostId, @RequestParam("status") int status) {
        JobPost jobPost = jobPostService.getJobPostById(jobPostId);
        jobPost.setStatus(status);
        jobPostService.saveJobPost(jobPost);
        return "redirect:/admin/job";
    }

    @GetMapping("/admin/job/{id}")
    public String viewJobPost(@PathVariable("id") Long jobPostId, Model model) {
        JobPost jobPost = jobPostService.getJobPostById(jobPostId);

        model.addAttribute("jobPost", jobPost);
        model.addAttribute("cityname", jobPost.getLocation().getCity().getName());
        model.addAttribute("districtname", jobPost.getLocation().getDistrict().getName());
        model.addAttribute("careername", jobPost.getCareer().getName());
        model.addAttribute("companyname", jobPost.getCompany().getCompanyName());
        model.addAttribute("user", userService.getUserById(jobPost.getUser().getId()).getFullName());
        return "admin/job/detail";
    }

}
