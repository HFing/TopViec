package com.hfing.TopViec.controller.recruiter;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.stream.Collectors;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.InfoResumeSaved;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.JobPostActivity;
import com.hfing.TopViec.domain.Notification;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.InfoResumeSavedService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.JobPostActivityService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.NotificationService;
import com.hfing.TopViec.service.UserService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.time.LocalDateTime;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CandidateRecruiterController {
    private final InfoResumeService infoResumeService;
    private final InfoResumeSavedService infoResumeSavedService;
    private final UserService userService;
    private final InfoCompanyService infoCompanyService;
    private final CommonCityService commonCityService;
    private final JobPostActivityService jobPostActivityService;
    private final JobPostService jobPostService;
    private final NotificationService notificationService;

    public CandidateRecruiterController(InfoResumeService infoResumeService,
            InfoResumeSavedService infoResumeSavedService,
            UserService userService, InfoCompanyService infoCompanyService, CommonCityService commonCityService,
            JobPostActivityService jobPostActivityService, JobPostService jobPostService,
            NotificationService notificationService) {
        this.infoResumeService = infoResumeService;
        this.infoResumeSavedService = infoResumeSavedService;
        this.userService = userService;
        this.infoCompanyService = infoCompanyService;
        this.commonCityService = commonCityService;
        this.jobPostActivityService = jobPostActivityService;
        this.jobPostService = jobPostService;
        this.notificationService = notificationService;
    }

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/recruiter/candidate")
    public String getCadidateFindPage(Model model) {

        model.addAttribute("cities", commonCityService.findAll());
        model.addAttribute("infoResumes", infoResumeService.findAll());

        return "recruiter/candidate/show";
    }

    @GetMapping("/recruiter/candidate/{id}")
    public String getCadidateDetailPage(@PathVariable("id") Long id, Model model) {
        InfoResume resume = infoResumeService.findByIdNotOpt(id);
        model.addAttribute("candidate", resume);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        InfoResumeSaved infoResumeSaved = infoResumeSavedService.findByCompanyAndResume(company, resume);
        boolean isSaved = infoResumeSaved != null;

        if (infoResumeSaved == null) {
            infoResumeSaved = new InfoResumeSaved();
            infoResumeSaved.setCompany(company);
            infoResumeSaved.setResume(resume);
        }

        model.addAttribute("infoResumeSaved", infoResumeSaved);
        model.addAttribute("isSaved", isSaved);
        return "recruiter/candidate/profile";
    }

    @PostMapping("/recruiter/candidate/save")
    public String saveResume(@ModelAttribute InfoResumeSaved infoResumeSaved, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        InfoResume resume = infoResumeService.findByIdNotOpt(infoResumeSaved.getResume().getId());

        InfoResumeSaved existingInfoResumeSaved = infoResumeSavedService.findByCompanyAndResume(company, resume);
        if (existingInfoResumeSaved == null) {
            infoResumeSaved.setCompany(company);
            infoResumeSaved.setResume(resume);
            infoResumeSaved.setSavedAt(new Date());
            infoResumeSavedService.saveInfoResumeSaved(infoResumeSaved);
        }

        model.addAttribute("infoResumeSaved", infoResumeSaved);
        model.addAttribute("candidate", resume);
        return "redirect:/recruiter/candidate/" + resume.getId();
    }

    @GetMapping("/recruiter/candidate/save")
    public String getSavePageCandidate(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        infoResumeSavedService.findByCompany(company);
        model.addAttribute("infoResumes", infoResumeSavedService.findByCompany(company));
        return "recruiter/candidate/save";
    }

    @PostMapping("/recruiter/candidate/unsave/{id}")
    public String unsaveResume(@PathVariable("id") Long id, Model model) {

        infoResumeSavedService.deleteById(id);

        return "redirect:/recruiter/candidate/save";
    }

    @GetMapping("/recruiter/candidate/search")
    public String searchCandidates(@RequestParam("keyword") String keyword,
            @RequestParam(value = "city", required = false) Long cityId, Model model) {
        List<InfoResume> infoResumes = infoResumeService.searchResumes(keyword, cityId);
        List<CommonCity> cities = commonCityService.findAll();
        model.addAttribute("infoResumes", infoResumes);
        model.addAttribute("cities", cities);
        return "recruiter/candidate/show";
    }

    @GetMapping("/recruiter/candidate/application")
    public String getMethodName(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        InfoCompany company = infoCompanyService.findByUser(user);
        List<JobPost> jobPosts = company.getJobPosts();

        List<JobPostActivity> jobPostActivities = jobPosts.stream()
                .flatMap(jobPost -> jobPost.getJobPostActivities().stream())
                .collect(Collectors.toList());

        model.addAttribute("jobPostActivities", jobPostActivities);
        model.addAttribute("jobPosts", jobPosts);
        return "recruiter/candidate/application";
    }

    @PostMapping("/recruiter/candidate/sendMail")
    public String sendMail(@RequestParam("recipientName") String recipientName,
            @RequestParam("recipientEmail") String recipientEmail,
            @RequestParam("emailSubject") String emailSubject,
            @RequestParam("emailContent") String emailContent, RedirectAttributes redirectAttributes) {

        sendEmail(recipientEmail, emailSubject, emailContent);
        redirectAttributes.addFlashAttribute("message", "Email sent successfully!");

        return "redirect:/recruiter/candidate/application";
    }

    private void sendEmail(String recipientEmail, String emailSubject, String emailContent) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(recipientEmail);
            helper.setFrom("h5studiogl@gmail.com");
            helper.setSubject(emailSubject);

            // HTML content for email
            String htmlMsg = "<div style='font-family: Arial, sans-serif;'>"
                    + emailContent
                    + "</div>";

            helper.setText(htmlMsg, true);

            mailSender.send(message);
        } catch (MessagingException e) {
            // Handle exception, e.g., log the error or notify the user
            e.printStackTrace();
        }
    }

    @PostMapping("/recruiter/candidate/updateStatus")
    public String updateStatus(@RequestParam("activityId") Long activityId, @RequestParam("status") int status,
            RedirectAttributes redirectAttributes) {
        JobPostActivity jobPostActivity = jobPostActivityService.findById(activityId);
        if (jobPostActivity != null) {
            jobPostActivity.setStatus(status);
            jobPostActivityService.save(jobPostActivity);
        }

        Notification notification = new Notification();
        notification.setCreateAt(LocalDateTime.now());
        notification.setJobName(jobPostActivity.getJobPost().getJobName());
        notification.setUser(jobPostActivity.getUser());
        notification.setCity(jobPostActivity.getJobPost().getLocation().getCity());
        notification.setCareer(jobPostActivity.getJobPost().getCareer());
        notification.setIsActive(true);
        notification.setPosition(jobPostActivity.getJobPost().getPosition().getDisplayName());
        notificationService.saveNotification(notification);

        sendStatusUpdateEmail(jobPostActivity.getUser().getEmail(), jobPostActivity.getJobPost().getJobName(), status);
        redirectAttributes.addFlashAttribute("message", "Recruitment status updated successfully!");
        return "redirect:/recruiter/candidate/application";
    }

    private void sendStatusUpdateEmail(String email, String jobName, int status) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(email);
            helper.setFrom("h5studiogl@gmail.com");
            helper.setSubject("Application Status Update");

            // HTML content for email
            String statusMessage = getStatusMessage(status);
            String htmlMsg = "<div style='text-align: center; font-family: Arial, sans-serif;'>"
                    + "<h2 style='color: #333;'>Application Status Update</h2>"
                    + "<p>Your application for the position of <strong>" + jobName
                    + "</strong> has been updated to the following status:</p>"
                    + "<p><strong>" + statusMessage + "</strong></p>"
                    + "<p>If you have any questions, please contact our support team.</p>"
                    + "</div>";

            helper.setText(htmlMsg, true);

            mailSender.send(message);
        } catch (MessagingException e) {
            // Xử lý ngoại lệ, ví dụ: ghi log hoặc thông báo lỗi
            e.printStackTrace();
        }
    }

    private String getStatusMessage(int status) {
        switch (status) {
            case 1:
                return "Pending Confirmation";
            case 2:
                return "Contacted";
            case 3:
                return "Tested";
            case 4:
                return "Interviewed";
            case 5:
                return "Hired";
            case 0:
                return "Not Hired";
            default:
                return "Unknown Status";
        }
    }

    @GetMapping("/recruiter/candidate/application/search")
    public String searchCandidates(@RequestParam(required = false) Long posted,
            @RequestParam(required = false) Integer status,
            Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        InfoCompany company = infoCompanyService.findByUser(user);
        List<JobPost> jobPosts = company.getJobPosts();

        List<JobPostActivity> jobPostActivities = jobPosts.stream()
                .flatMap(jobPost -> jobPost.getJobPostActivities().stream())
                .filter(activity -> (posted == null || activity.getJobPost().getId().equals(posted)) &&
                        (status == null || Integer.valueOf(activity.getStatus()).equals(status)))
                .collect(Collectors.toList());

        model.addAttribute("jobPostActivities", jobPostActivities);
        model.addAttribute("jobPosts", jobPosts);

        return "recruiter/candidate/application";
    }

}
