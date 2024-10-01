package com.hfing.TopViec.controller.recruiter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Map;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostActivityService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;

@Controller
public class DashBoardRecruiterController {
    private final JobPostActivityService jobPostActivityService;
    private final UserService userService;
    private final InfoCompanyService infoCompanyService;
    private final JobPostService jobPostService;

    public DashBoardRecruiterController(JobPostActivityService jobPostActivityService, UserService userService,
            InfoCompanyService infoCompanyService, JobPostService jobPostService) {
        this.jobPostActivityService = jobPostActivityService;
        this.userService = userService;
        this.infoCompanyService = infoCompanyService;
        this.jobPostService = jobPostService;
    }

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/recruiter")
    public String getDashBoardRecruiter(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        InfoCompany company = infoCompanyService.findByUser(user);
        Map<String, Integer> monthlyUserCounts = jobPostActivityService.getMonthlyApplicantCounts(company.getId());

        try {

            String monthlyUserCountsJson = new ObjectMapper().writeValueAsString(monthlyUserCounts);
            model.addAttribute("monthlyUserCounts", monthlyUserCountsJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        Map<Integer, Long> applicantCountsByStatus = jobPostActivityService.getApplicantCountsByStatus(company.getId());
        try {
            String applicantCountsByStatusJson = new ObjectMapper().writeValueAsString(applicantCountsByStatus);
            model.addAttribute("jobPostActivityCountsByStatus", applicantCountsByStatusJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        long approvedJobPostsCount = jobPostService.countApprovedJobPosts(company.getId());
        model.addAttribute("approvedJobPostsCount", approvedJobPostsCount);

        long pendingJobPostsCount = jobPostService.countPendingJobPosts(company.getId());
        model.addAttribute("pendingJobPostsCount", pendingJobPostsCount);

        long expiredJobPostsCount = jobPostService.countExpiredJobPosts(company.getId());
        model.addAttribute("expiredJobPostsCount", expiredJobPostsCount);

        long allApplicantsCount = jobPostActivityService.countTotalApplicants(company.getId());
        model.addAttribute("allApplicantsCount", allApplicantsCount);

        return "recruiter/dashboard/show";
    }

}
