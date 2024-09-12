package com.hfing.TopViec.controller.recruiter;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;

@Controller
public class JobRecruiter {

    private final UserService userService;
    private final JobPostService jobPostService;
    private final InfoCompanyService infoCompanyService;

    public JobRecruiter(UserService userService, JobPostService jobPostService, InfoCompanyService infoCompanyService) {
        this.userService = userService;
        this.jobPostService = jobPostService;
        this.infoCompanyService = infoCompanyService;
    }

    @GetMapping("/recruiter/job")
    public String getJobListRecruiter(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        model.addAttribute("jobPosts", jobPostService.getJobPostsByUserId(user.getId()));
        return "recruiter/job/show";
    }

    @GetMapping("/recruiter/job/create")
    public String getCreateJobRecruiter(Model model) {
        model.addAttribute("newJobPost", new JobPost());
        return "recruiter/job/create";
    }

}
