package com.hfing.TopViec.controller.recruiter;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hfing.TopViec.domain.PaymentHistory;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.PaymentHistoryService;
import com.hfing.TopViec.service.UserService;

import ch.qos.logback.classic.net.SyslogAppender;

@Controller
public class InvoicesRecruiterController {
    private final PaymentHistoryService paymentHistoryService;
    private final UserService userService;

    public InvoicesRecruiterController(PaymentHistoryService paymentHistoryService, UserService userService) {
        this.paymentHistoryService = paymentHistoryService;
        this.userService = userService;
    }

    @GetMapping("/recruiter/invoices")
    public String invoices(Model model) {
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
        PaymentHistory paymentHistory = paymentHistoryService.findByUserID(user.getId());
        String formattedCreatedAt = paymentHistory.getFormattedCreatedAt();
        model.addAttribute("formattedCreatedAt", formattedCreatedAt);
        model.addAttribute("invoices", paymentHistoryService.findByUserID(user.getId()));
        return "recruiter/invoice/show";
    }
}
