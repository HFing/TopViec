package com.hfing.TopViec.controller.recruiter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.UUID;
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
    private JavaMailSender mailSender;

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

        // In ra giá trị của monthlyUserCounts
        System.out.println(">>>>> monthlyUserCounts: " + monthlyUserCounts);

        try {
            String monthlyUserCountsJson = new ObjectMapper().writeValueAsString(monthlyUserCounts);

            // In ra giá trị của monthlyUserCountsJson
            System.out.println(">>>> monthlyUserCountsJson: " + monthlyUserCountsJson);

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

        model.addAttribute("isVerifyEmail", user.getIsVerifyEmail());
        return "recruiter/dashboard/show";
    }

    @GetMapping("/recruiter/sendVerificationEmail")
    public String sendVerificationEmailForRecruiter(RedirectAttributes redirectAttributes) {
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
        if (user != null && !user.getIsVerifyEmail()) {
            // Generate verification token
            String token = UUID.randomUUID().toString();
            String verificationUrl = "http://localhost:8080/verify?token=" + token;
            // Save token to user
            user.setVerificationToken(token);
            userService.saveUser(user);
            // Send verification email
            sendVerificationEmail(user.getEmail(), verificationUrl);
        }
        redirectAttributes.addFlashAttribute("message", "Verification email has been sent to your email address.");

        return "redirect:/recruiter";
    }

    private void sendVerificationEmail(String email, String verificationUrl) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setFrom("h5studiogl@gmail.com");
        message.setSubject("Account Verification");
        message.setText("Please click the following link to verify your account: " + verificationUrl);
        mailSender.send(message);
    }

}
