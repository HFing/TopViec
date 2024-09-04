package com.hfing.TopViec.controller.client;

import java.time.LocalDate;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hfing.TopViec.domain.JobSeekerProfile;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.JobSeekerProfileService;
import com.hfing.TopViec.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;

@Controller
public class ProfileController {

    private final UserService userService;
    private final JobSeekerProfileService jobSeekerProfileService;

    public ProfileController(UserService userService, JobSeekerProfileService jobSeekerProfileService) {
        this.userService = userService;
        this.jobSeekerProfileService = jobSeekerProfileService;
    }

    @GetMapping("/profile")
    public String getProfilePage(Model model, HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String email = authentication.getName();
            User user = userService.getUserByEmail(email);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("avatarUrl", user.getAvatarUrl());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("phone", user.getPhone());
                model.addAttribute("fullName", user.getFullName());
                model.addAttribute("avatarUrl", user.getAvatarUrl());
                model.addAttribute("email", user.getEmail());
                model.addAttribute("phone", user.getPhone());
            }
        }
        return "client/profile/show";
    }

    @GetMapping("/profile/accountsettings")
    public String showAccountSettings(Model model) {
        JobSeekerProfile jobSeekerProfile = new JobSeekerProfile();
        // Initialize jobSeekerProfile with existing data if needed
        model.addAttribute("jobSeekerProfile", jobSeekerProfile);
        return "client/profile/account";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam("fullName") String fullName,
            @RequestParam("phone") String phone,
            @ModelAttribute JobSeekerProfile jobSeekerProfile) {
        // Handle fullName and phone separately
        // Update jobSeekerProfile with other fields
        // Save jobSeekerProfile to the database
        return "redirect:/profile/accountsettings";
    }

}
