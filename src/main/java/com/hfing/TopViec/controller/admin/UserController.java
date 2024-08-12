package com.hfing.TopViec.controller.admin;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hfing.TopViec.domain.Role;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.UserRole;
import com.hfing.TopViec.service.RoleService;
import com.hfing.TopViec.service.UploadService;
import com.hfing.TopViec.service.UserRoleService;
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
    private final UserRoleService userRoleService;
    // private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, RoleService roleService,
            UserRoleService userRoleService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.roleService = roleService;
        this.userRoleService = userRoleService;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("roles", roleService.getAllRoles());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @RequestParam("avatarFile") MultipartFile file,
            @RequestParam("roleId") Long roleId,
            @ModelAttribute("newUser") User newUser) {
        // Handle file upload
        String avString = this.uploadService.handleSaveUploadFile(file, "avatar");
        newUser.setAvatarUrl(avString);

        // Set roleName
        Role role = roleService.findById(roleId);
        newUser.setRoleName(role.getName());

        newUser.setCreateAt(LocalDateTime.now());

        // Save the new user
        userService.saveUser(newUser);

        // Create and save UserRole
        userRoleService.createAndSaveUserRole(newUser, role);

        return "redirect:/admin/user";
    }

}
