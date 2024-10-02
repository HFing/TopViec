package com.hfing.TopViec.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.UserRole;
import com.hfing.TopViec.service.RoleService;
import com.hfing.TopViec.service.UserRoleService;
import com.hfing.TopViec.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;
    private final UserRoleService userRoleService;

    public OAuth2LoginSuccessHandler(UserService userService, PasswordEncoder passwordEncoder,
            RoleService roleService, UserRoleService userRoleService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
        this.userRoleService = userRoleService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException {
        try {
            HttpSession session = request.getSession();
            OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
            String email = oAuth2User.getAttribute("email");
            String fullName = oAuth2User.getAttribute("name");
            String avatarUrl = oAuth2User.getAttribute("picture");

            // Logging để kiểm tra các giá trị
            System.out.println("OAuth2 Authentication Success: " + email);

            User user = userService.getUserByEmail(email);
            if (user == null) {
                user = new User();
                user.setEmail(email);
                user.setFullName(fullName);
                user.setAvatarUrl(avatarUrl);
                user.setIsActive(true);
                user.setHasCompany(false);
                user.setEmailNotificationActive(true);
                user.setPassword(passwordEncoder.encode("default_password"));
                user.setRoleName("USER");
                user.setIsVerifyEmail(true);
                user.setAvatarUrl("default_avatar.jpg");
                user.setPhone("Not updated");
                userService.saveUser(user);

                user = userService.getUserByEmail(email);
                UserRole userRole = new UserRole();
                userRole.setUser(user);
                userRole.setRole(roleService.findByName("USER"));
                userRoleService.saveUserRole(userRole);

            }

            // Log các giá trị trước khi đặt vào session
            System.out.println("User Full Name: " + user.getFullName());
            System.out.println("User Avatar URL: " + user.getAvatarUrl());
            System.out.println("User Email: " + user.getEmail());
            System.out.println("User Role: " + user.getRoleName());
            // Đặt các giá trị vào session
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatarUrl", user.getAvatarUrl());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("role", user.getRoleName());
            session.setAttribute("phone", user.getPhone());
            SecurityContextHolder.getContext().setAuthentication(authentication);

            // Chuyển hướng đến trang chính
            response.sendRedirect(request.getContextPath() + "/");

        } catch (Exception e) {
            e.printStackTrace(); // Log ngoại lệ nếu có
            response.sendRedirect("/login?error"); // Chuyển hướng đến trang lỗi nếu có vấn đề
        }
    }
}
