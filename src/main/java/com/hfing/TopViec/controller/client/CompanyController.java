package com.hfing.TopViec.controller.client;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoCompanyImage;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.InfoCompanyImageService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.NotificationService;
import com.hfing.TopViec.service.UserService;

import org.springframework.ui.Model;

@Controller
public class CompanyController {
    private final InfoCompanyService companyService;
    private final InfoCompanyImageService companyImageService;
    private final JobPostService jobPostService;
    private final UserService userService;
    private final NotificationService notificationService;

    public CompanyController(InfoCompanyService companyService, InfoCompanyImageService companyImageService,
            JobPostService jobPostService, UserService userService, NotificationService notificationService) {
        this.companyService = companyService;
        this.companyImageService = companyImageService;
        this.jobPostService = jobPostService;
        this.userService = userService;
        this.notificationService = notificationService;
    }

    @GetMapping("/companies")
    public String getComPany(Model model) {
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
        if (user != null) {
            model.addAttribute("notifications", notificationService.getNotificationsByUser(user));
            model.addAttribute("notificationCount", notificationService.countNotificationsByUser(user));
        }
        List<InfoCompany> companies = companyService.getAllCompanies();
        model.addAttribute("companies", companies);
        return "client/company/show";
    }

    @GetMapping("/companies/{id}")
    public String getCompanyById(@PathVariable("id") Long id, Model model) {

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
        if (user != null) {
            model.addAttribute("notifications", notificationService.getNotificationsByUser(user));
            model.addAttribute("notificationCount", notificationService.countNotificationsByUser(user));
        }
        InfoCompany company = companyService.getCompanyById(id);
        List<InfoCompanyImage> images = companyImageService.findByCompany(company);
        model.addAttribute("company", company);
        model.addAttribute("city", company.getLocation().getCity().getName());
        model.addAttribute("sizeEmployees", company.getEmployeeSize().getSizeDescription());
        model.addAttribute("images", images);
        model.addAttribute("jobPosts", jobPostService.getJobPostsByCompanyId(id));
        return "client/company/detail";
    }

}
