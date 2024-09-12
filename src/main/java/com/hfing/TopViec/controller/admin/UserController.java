package com.hfing.TopViec.controller.admin;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.Role;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.UserRole;
import com.hfing.TopViec.service.JobSeekerProfileService;
import com.hfing.TopViec.service.RoleService;
import com.hfing.TopViec.service.UploadService;
import com.hfing.TopViec.service.UserRoleService;
import com.hfing.TopViec.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final RoleService roleService;
    private final UserRoleService userRoleService;
    private final PasswordEncoder passwordEncoder;
    private final JobSeekerProfileService jobSeekerProfileService;

    public UserController(UserService userService, UploadService uploadService, RoleService roleService,
            UserRoleService userRoleService, PasswordEncoder passwordEncoder,
            JobSeekerProfileService jobSeekerProfileService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.roleService = roleService;
        this.userRoleService = userRoleService;
        this.passwordEncoder = passwordEncoder;
        this.jobSeekerProfileService = jobSeekerProfileService;
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

        // Encode password
        newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));

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

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postUserDelete(Model model, @ModelAttribute("newUser") User user) {
        // Xóa các UserRole liên quan
        userRoleService.deleteUserRolesByUserId(user.getId());
        jobSeekerProfileService.deleteByUserId(user.getId());

        // Xóa người dùng
        userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = userService.getUserById(id);

        // Định dạng ngày tạo và ngày cập nhật
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String formattedCreateAt = user.getCreateAt() != null ? user.getCreateAt().format(formatter) : "N/A";
        String formattedUpdateAt = user.getUpdateAt() != null ? user.getUpdateAt().format(formatter) : "N/A";

        model.addAttribute("user", user);
        model.addAttribute("formattedCreateAt", formattedCreateAt);
        model.addAttribute("formattedUpdateAt", formattedUpdateAt);

        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        model.addAttribute("roles", roleService.getAllRoles());
        Long selectedRoleId = roleService.findByName(currentUser.getRoleName()).getId();
        model.addAttribute("selectedRoleId", selectedRoleId);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUserUpdate(Model model, @RequestParam("avatarFile") MultipartFile file,
            @RequestParam("roleId") Long roleId,
            @ModelAttribute("newUser") User newUser) {
        User currentUser = this.userService.getUserById(newUser.getId());
        if (currentUser != null) {
            if (file != null && !file.isEmpty()) {
                String avString = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatarUrl(avString);
            }
            currentUser.setFullName(newUser.getFullName());
            currentUser.setEmail(newUser.getEmail());
            currentUser.setPhone(newUser.getPhone());
            currentUser.setRoleName(roleService.findById(roleId).getName());
            currentUser.setIsActive(newUser.getIsActive());
            currentUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
            currentUser.setIsVerifyEmail(newUser.getIsVerifyEmail());
            currentUser.setHasCompany(newUser.getHasCompany());
            currentUser.setEmailNotificationActive(newUser.getEmailNotificationActive());
            currentUser.setUpdateAt(LocalDateTime.now());

            // update UserRole
            UserRole userRole = userRoleService.getUserRoleByUserId(currentUser.getId());
            if (userRole != null) {
                userRole.setRole(roleService.findById(roleId));
                userRoleService.saveUserRole(userRole);
            }

            userService.saveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

}
