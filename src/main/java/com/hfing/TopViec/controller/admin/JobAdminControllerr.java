package com.hfing.TopViec.controller.admin;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.CommonCareer;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.Notification;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;
import com.hfing.TopViec.service.CommonCareerService;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.NotificationService;
import com.hfing.TopViec.service.UserService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JobAdminControllerr {
    private final UserService userService;
    private final JobPostService jobPostService;
    private final CommonCareerService commonCareerService;
    private final CommonCityService commonCityService;
    private final InfoCompanyService companyService;
    private final CommonLocationService commonLocationService;
    private final InfoCompanyService infoCompanyService;
    private final NotificationService notificationService;

    public JobAdminControllerr(UserService userService, JobPostService jobPostService,
            CommonCareerService commonCareerService, CommonCityService commonCityService,
            InfoCompanyService companyService, CommonLocationService commonLocationService,
            InfoCompanyService infoCompanyService, NotificationService notificationService) {
        this.userService = userService;
        this.jobPostService = jobPostService;
        this.commonCareerService = commonCareerService;
        this.commonCityService = commonCityService;
        this.companyService = companyService;
        this.commonLocationService = commonLocationService;
        this.infoCompanyService = infoCompanyService;
        this.notificationService = notificationService;
    }

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/admin/job")
    public String getJobAdminPage(Model model) {
        model.addAttribute("jobList", jobPostService.getAllJobPosts());
        model.addAttribute("jobPost", new JobPost());
        model.addAttribute("companies", infoCompanyService.getAllCompanies());
        return "admin/job/show";
    }

    @GetMapping("/admin/job/search")
    public String searchJobAdminPage(@RequestParam(required = false) Long company,
            @RequestParam(required = false) Integer status,
            Model model) {
        List<JobPost> jobPosts = jobPostService.searchJobPosts(company, status);
        model.addAttribute("jobList", jobPosts);
        model.addAttribute("companies", infoCompanyService.getAllCompanies());
        model.addAttribute("jobPost", new JobPost());
        return "admin/job/show";
    }

    @PostMapping("/admin/job/updateStatus")
    public String updateJobStatus(@RequestParam("id") Long jobPostId,
            @RequestParam("status") int status,
            RedirectAttributes redirectAttributes) {
        JobPost jobPost = jobPostService.getJobPostById(jobPostId);
        jobPost.setStatus(status);
        jobPostService.saveJobPost(jobPost);

        String userEmail = jobPost.getUser().getEmail();
        String jobTitle = jobPost.getJobName();
        String statusText = getStatusText(status);

        sendStatusUpdateEmail(userEmail, jobTitle, statusText);
        User user = userService.getUserById(jobPost.getUser().getId());
        Notification notification = new Notification();
        notification.setCreateAt(LocalDateTime.now());
        notification.setUser(user);
        notification.setJobName("Your job post " + jobTitle + " has been updated to " + statusText);
        notification.setCareer(jobPost.getCareer());
        notificationService.saveNotification(notification);
        redirectAttributes.addFlashAttribute("message", "Job status updated successfully!");
        return "redirect:/admin/job";
    }

    private void sendStatusUpdateEmail(String email, String jobTitle, String status) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(email);
            helper.setFrom("h5studiogl@gmail.com");
            helper.setSubject("Job Post Status Update");

            // HTML content for email
            String htmlMsg = "<div style='text-align: center; font-family: Arial, sans-serif;'>"
                    + "<h2 style='color: #333;'>Job Post Status Update</h2>"
                    + "<p>The status of your job post <strong>" + jobTitle + "</strong> has been updated to <strong>"
                    + status + "</strong>.</p>"
                    + "<p>If you have any questions, please contact our support team.</p>"
                    + "</div>";

            helper.setText(htmlMsg, true);

            mailSender.send(message);
        } catch (MessagingException e) {
            // Handle exception, e.g., log or notify
            e.printStackTrace();
        }
    }

    private String getStatusText(int status) {
        switch (status) {
            case 1:
                return "Approved";
            case 2:
                return "Pending";
            case 0:
                return "Rejected";
            default:
                return "Unknown";
        }
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

    @GetMapping("/admin/job/create")
    public String getCreateJobPage(Model model) {
        List<CommonCareer> careers = commonCareerService.findAll();
        List<CommonCity> cities = commonCityService.findAll();
        List<InfoCompany> companies = companyService.getAllCompanies();

        model.addAttribute("newJobPost", new JobPost());
        model.addAttribute("careers", careers);
        model.addAttribute("cities", cities);
        model.addAttribute("experiences", Experience.values());
        model.addAttribute("positions", Position.values());
        model.addAttribute("academicLevels", AcademicLevel.values());
        model.addAttribute("typeOfWorkplaces", TypeOfWorkplace.values());
        model.addAttribute("jobTypes", JobType.values());
        model.addAttribute("companies", companies);

        return "admin/job/create";
    }

    @PostMapping("/admin/job/create")
    public String postCreateJob(@ModelAttribute("newJobPost") JobPost newJobPost,
            @RequestParam("location.city.id") Long cityId,
            @RequestParam("location.district.id") Long districtId,
            @RequestParam("company.id") Long companyId) {
        // Set the city and district

        newJobPost.setLocation(commonLocationService.findByCityIdAndDistrictId(cityId, districtId));

        // Set the company
        InfoCompany company = companyService.getCompanyById(companyId);
        newJobPost.setCompany(company);
        newJobPost.setUser(company.getUser());
        newJobPost.setCreateAt(LocalDateTime.now());
        newJobPost.setStatus(2);
        // Save the job post
        jobPostService.saveJobPost(newJobPost);

        return "redirect:/admin/job";
    }

    @GetMapping("/admin/job/delete")
    public String deleteJob(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        jobPostService.deleteJobPost(id);
        return "redirect:/admin/job";
    }

}
