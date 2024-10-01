package com.hfing.TopViec.controller.client;

import java.util.Locale;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.stream.Collectors;
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

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.util.Collections;

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

    @Autowired
    private JavaMailSender mailSender;

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

        jobPost.setViews(jobPost.getViews() + 1);
        jobPostService.saveJobPost(jobPost);

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

        List<JobPost> relatedJobs = jobPostService.getRelatedJobs(jobPost);

        // Loại bỏ công việc hiện tại khỏi danh sách các công việc liên quan
        relatedJobs.removeIf(job -> job.getId().equals(jobPost.getId()));

        if (relatedJobs.size() > 4) {
            Collections.shuffle(relatedJobs);
            relatedJobs = relatedJobs.subList(0, 4);
        } else if (relatedJobs.size() < 4) {
            List<JobPost> allJobs = jobPostService.getAllJobPosts();

            allJobs.removeIf(job -> job.getId().equals(jobPost.getId()));

            allJobs.removeAll(relatedJobs);
            Collections.shuffle(allJobs);
            relatedJobs.addAll(allJobs.stream().limit(4 - relatedJobs.size()).collect(Collectors.toList()));
        }

        model.addAttribute("relatedJobs", relatedJobs);

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

        JobPost jobPost = jobPostService.getJobPostById(jobPostId);
        jobPostActivity.setJobPost(jobPost);

        jobPostActivityService.save(jobPostActivity);
        sendApplicationNotificationEmail(userEmail, jobPost.getJobName());
        return "redirect:/job/" + jobPostActivity.getJobPost().getId();
    }

    private void sendApplicationNotificationEmail(String email, String jobTitle) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(email);
            helper.setFrom("h5studiogl@gmail.com");
            helper.setSubject("Job Application Received");

            // HTML content for email
            String htmlMsg = "<div style='text-align: center; font-family: Arial, sans-serif;'>"
                    + "<h2 style='color: #333;'>Job Application Received</h2>"
                    + "<p>Thank you for applying for the position of <strong>" + jobTitle + "</strong>.</p>"
                    + "<p>We have received your application and will review it shortly.</p>"
                    + "<p>If you have any questions, please contact our support team.</p>"
                    + "</div>";

            helper.setText(htmlMsg, true);

            mailSender.send(message);
        } catch (MessagingException e) {
            // Xử lý ngoại lệ, ví dụ: ghi log hoặc thông báo lỗi
            e.printStackTrace();
        }
    }

}
