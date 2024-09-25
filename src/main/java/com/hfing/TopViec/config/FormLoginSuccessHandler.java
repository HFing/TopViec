package com.hfing.TopViec.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class FormLoginSuccessHandler implements AuthenticationSuccessHandler {

    private final UserService userService;

    public FormLoginSuccessHandler(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String email = userDetails.getUsername();
        User user = userService.getUserByEmail(email);

        if (user != null) {
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatarUrl", user.getAvatarUrl());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("role", user.getRoleName());
            System.out.println("ROLE NAME >>><<<: " + user.getRoleName());
        }

        // Redirect to the default page after login
        response.sendRedirect(request.getContextPath());
    }
}