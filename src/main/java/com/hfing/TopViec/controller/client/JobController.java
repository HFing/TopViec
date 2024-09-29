package com.hfing.TopViec.controller.client;

import java.util.Locale;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.JobPostActivity;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.JobPostActivityService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;

import jakarta.validation.Valid;

@Controller
public class JobController {

    private final JobPostService jobPostService;
    private final CommonCityService commonCityService;
    private final InfoCompanyService infoCompanyService;
    private final JobPostActivityService jobPostActivityService;
    private final InfoResumeService infoResumeService;
    private final UserService userService;

    public JobController(JobPostService jobPostService, CommonCityService commonCityService,
            InfoCompanyService infoCompanyService, JobPostActivityService jobPostActivityService,
            InfoResumeService infoResumeService, UserService userService) {
        this.jobPostService = jobPostService;
        this.commonCityService = commonCityService;
        this.infoCompanyService = infoCompanyService;
        this.jobPostActivityService = jobPostActivityService;
        this.infoResumeService = infoResumeService;
        this.userService = userService;
    }

    @GetMapping("/job/{id}")
    public String getJobDetailPage(@PathVariable("id") Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                userEmail = userDetails.getUsername();
            } else if (principal instanceof OAuth2User) {
                OAuth2User oAuth2User = (OAuth2User) principal;
                userEmail = oAuth2User.getAttribute("email");
            }
        }
        User user = userService.getUserByEmail(userEmail);

        JobPost jobPost = jobPostService.getJobPostById(id);
        java.text.NumberFormat numberFormat = java.text.NumberFormat.getInstance(new Locale("vi", "VN"));
        String formattedSalaryMax = numberFormat.format(jobPost.getSalaryMax());
        model.addAttribute("city", commonCityService.findById(jobPost.getLocation().getCity().getId()));
        model.addAttribute("jobPost", jobPost);
        model.addAttribute("formattedSalaryMax", formattedSalaryMax);
        model.addAttribute("infoCompany", infoCompanyService.getCompanyById(jobPost.getCompany().getId()));

        model.addAttribute("jobPostActivity", new JobPostActivity());
        model.addAttribute("resumes", infoResumeService.getResumeByUserId(user.getId()));

        boolean hasApplied = jobPostActivityService.hasApplied(id, user.getId());
        model.addAttribute("hasApplied", hasApplied);

        return "client/job/show";
    }

    @PostMapping("/job/apply")
    public String applyForJob(@ModelAttribute("jobPostActivity") JobPostActivity jobPostActivity,
            @RequestParam("jobPostId") Long jobPostId,
            Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                UserDetails userDetails = (UserDetails) principal;
                userEmail = userDetails.getUsername();
            } else if (principal instanceof OAuth2User) {
                OAuth2User oAuth2User = (OAuth2User) principal;
                userEmail = oAuth2User.getAttribute("email");
            }
        }
        User user = userService.getUserByEmail(userEmail);

        // Thiết lập các thuộc tính bổ sung
        jobPostActivity.setCreateAt(LocalDateTime.now());
        jobPostActivity.setUpdateAt(LocalDateTime.now());
        jobPostActivity.setIsSentEmail(false);
        jobPostActivity.setIsDeleted(false);
        jobPostActivity.setStatus(1);
        jobPostActivity.setUser(user);

        // Thiết lập jobPost cho jobPostActivity
        JobPost jobPost = jobPostService.getJobPostById(jobPostId);
        jobPostActivity.setJobPost(jobPost);

        // Lưu JobPostActivity
        jobPostActivityService.save(jobPostActivity);

        // Chuyển hướng hoặc trả về một trang sau khi lưu thành công
        return "redirect:/job/" + jobPostActivity.getJobPost().getId();
    }

}
