package com.hfing.TopViec.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.RoleService;
import com.hfing.TopViec.service.UploadService;
import com.hfing.TopViec.service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final RoleService roleService;
    // private final PasswordEncoder passwordEncoder;

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    public UserController(UserService userService, UploadService uploadService, RoleService roleService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.roleService = roleService;
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("roles", roleService.getAllRoles());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String creatUserPage(Model model, @RequestParam("avatarFile") MultipartFile file,
            @ModelAttribute("newUser") User newUser) {
        String avString = this.uploadService.handleSaveUploadFile(file, "avatar");
        newUser.setAvatarUrl(avString);
        return "redirect:/admin/user";
    }

}
