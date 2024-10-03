package com.hfing.TopViec.controller.client;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.JobPostActivity;
import com.hfing.TopViec.domain.Role;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.UserRole;
import com.hfing.TopViec.domain.dto.RegisterDTO;
import com.hfing.TopViec.domain.dto.RegisterRecruiterDTO;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.EmployeeSizeService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostActivityService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.RoleService;
import com.hfing.TopViec.service.UserRoleService;
import com.hfing.TopViec.service.UserService;
import java.util.UUID;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.hfing.TopViec.domain.ChatHistory;
import com.hfing.TopViec.service.ChatHistoryService; // Tạo service để lấy lịch sử chat
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import com.hfing.TopViec.domain.ChatMessage;
import com.hfing.TopViec.domain.ChatRequest;

@Controller
public class HomePageController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;
    private final UserRoleService userRoleService;
    private final CommonCityService cityService;
    private final CommonDistrictService districtService;
    private final EmployeeSizeService employeeSizeService;
    private final CommonLocationService locationService;
    private final InfoCompanyService infoCompanyService;
    private final JobPostService jobPostService;
    private final CommonCareerService commonCareerService;
    private final JobPostActivityService jobPostActivityService;

    @Autowired
    private ChatHistoryService chatHistoryService;

    public HomePageController(UserService userService, PasswordEncoder passwordEncoder, RoleService roleService,
            UserRoleService userRoleService, CommonCityService cityService, CommonDistrictService districtService,
            EmployeeSizeService employeeSizeService, CommonLocationService locationService,
            InfoCompanyService infoCompanyService, JobPostService jobPostService) {
            InfoCompanyService infoCompanyService, JobPostService jobPostService,
            CommonCareerService commonCareerService, JavaMailSender mailSender,
            JobPostActivityService jobPostActivityService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
        this.userRoleService = userRoleService;
        this.cityService = cityService;
        this.districtService = districtService;
        this.employeeSizeService = employeeSizeService;
        this.locationService = locationService;
        this.infoCompanyService = infoCompanyService;
        this.jobPostService = jobPostService;
        this.commonCareerService = commonCareerService;
        this.mailSender = mailSender;
        this.jobPostActivityService = jobPostActivityService;
    }

    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/contact")
    public String getContactPage() {
        return "client/homepage/contact";
    }

    @GetMapping("/about")
    public String getAboutPage() {
        return "client/homepage/about";
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<JobPost> hotJobPosts = jobPostService.getHotJobPosts();
        List<JobPost> jobPosts = jobPostService.getNonHotJobPostsWithStatusOne();
        model.addAttribute("hotJobPosts", hotJobPosts);
        model.addAttribute("jobPosts", jobPosts);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerUser,
            BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        registerUser.setPassword(passwordEncoder.encode(registerUser.getPassword()));
        User user = new User();
        user.setEmail(registerUser.getEmail());
        user.setPassword(registerUser.getPassword());
        user.setFullName(registerUser.getFullName());
        user.setCreateAt(LocalDateTime.now());
        user.setAvatarUrl("default_avatar.jpg");
        user.setRoleName("USER");
        user.setIsActive(false); // Set isActive to false
        user.setHasCompany(false);
        user.setEmailNotificationActive(true);
        user.setIsVerifyEmail(false);
        user.setPhone("Not Update");
        Role role = roleService.findByName("USER");
        UserRole userRole = new UserRole();
        userRole.setRole(role);
        userRole.setUser(user);
        userService.saveUser(user);
        userRoleService.saveUserRole(userRole);

        // Generate verification token
        String token = UUID.randomUUID().toString();
        String verificationUrl = "http://localhost:8080/verify?token=" + token;

        // Save token to user (assuming you have a field for it)
        user.setVerificationToken(token);
        userService.saveUser(user);

        // Send verification email
        sendVerificationEmail(user.getEmail(), verificationUrl);

        redirectAttributes.addFlashAttribute("message",
                "Registration successful! Please check your email to verify your account.");
        return "redirect:/login";
    }

    private void sendVerificationEmail(String email, String verificationUrl) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setFrom("h5studiogl@gmail.com");
        message.setSubject("Account Verification");
        message.setText("Please click the following link to verify your account: " + verificationUrl);
        mailSender.send(message);
    }

    @GetMapping("/login")
    public String getLogInPage() {
        return "client/auth/login";
    }

    @GetMapping("/login-success")
    public String loginSuccess(HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String email = authentication.getName();
            User user = userService.getUserByEmail(email); // Giả sử bạn có phương thức này trong UserService
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("fullName", user.getFullName());
            }
        }

        return "redirect:/";
    }

    @GetMapping("/404")
    public String getPageDeny() {
        return "client/auth/404";
    }

    @GetMapping("/register_recruiter")
    public String getRegisterRecruiterPage(Model model) {
        model.addAttribute("registerRecruiter", new RegisterRecruiterDTO());
        model.addAttribute("cities", cityService.findAll());
        model.addAttribute("employeeSizes", employeeSizeService.findAll());
        return "client/auth/register_recruiter";
    }

    @GetMapping("/api/districts")
    @ResponseBody
    public List<CommonDistrict> getDistrictsByCityId(@RequestParam Long cityId) {
        return districtService.findByCityId(cityId);
    }

    @PostMapping("/register_recruiter")
    public String registerRecruiter(@Valid RegisterRecruiterDTO registerRecruiterDTO, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            result.getAllErrors().forEach(error -> System.out.println(" Loi o day >>>" + error.getDefaultMessage()));
            model.addAttribute("registerRecruiter", registerRecruiterDTO);
            model.addAttribute("cities", cityService.findAll());
            model.addAttribute("employeeSizes", employeeSizeService.findAll());
            return "client/auth/register_recruiter";
        }

        // Create and save User
        User user = new User();
        user.setEmail(registerRecruiterDTO.getEmail());
        user.setPassword(passwordEncoder.encode(registerRecruiterDTO.getPassword()));
        user.setFullName(registerRecruiterDTO.getFullName());
        user.setAvatarUrl("default_avatar.jpg");
        user.setRoleName("RECRUITER");
        user.setIsActive(true);
        user.setHasCompany(true);
        user.setEmailNotificationActive(true);
        user.setCreateAt(LocalDateTime.now());
        userService.saveUser(user);

        // Ensure user is saved and has an ID
        if (user.getId() == null) {
            throw new IllegalStateException("User ID should not be null after saving");
        }

        // Assign Role to User
        Role role = roleService.findByName("RECRUITER");
        UserRole userRole = new UserRole();
        userRole.setRole(role);
        userRole.setUser(user);
        userRoleService.saveUserRole(userRole);

        // Create and save InfoCompany
        InfoCompany infoCompany = new InfoCompany();
        infoCompany.setCompanyName(registerRecruiterDTO.getCompanyName());
        infoCompany.setCompanyEmail(registerRecruiterDTO.getCompanyEmail());
        infoCompany.setCompanyPhone(registerRecruiterDTO.getCompanyPhone());
        infoCompany.setTaxCode(registerRecruiterDTO.getCompanyTax());
        infoCompany.setSince(registerRecruiterDTO.getEstablishedDate());
        infoCompany.setFieldOperation(registerRecruiterDTO.getFieldOperation());
        infoCompany.setEmployeeSize(employeeSizeService.findById(registerRecruiterDTO.getCompanySize()));
        infoCompany.setWebsiteUrl(registerRecruiterDTO.getCompanyWebsite());
        infoCompany.setDescription(registerRecruiterDTO.getCompanyDescription());
        infoCompany.setCreateAt(new Date(System.currentTimeMillis()));

        // Find or create CommonLocation
        CommonCity city = cityService.findById(registerRecruiterDTO.getCityId());
        CommonDistrict district = districtService.findById(registerRecruiterDTO.getDistrictId());
        CommonLocation location = locationService.findByCityIdAndDistrictId(registerRecruiterDTO.getCityId(),
                registerRecruiterDTO.getDistrictId());
        if (location == null) {
            location = new CommonLocation();
            location.setCity(city);
            location.setDistrict(district);
            locationService.save(location);
        }

        // Set location and user for InfoCompany
        infoCompany.setLocation(location);
        infoCompany.setUser(user);

        infoCompany.setCompanyCoverImageUrl("company-cover-default.jpeg");
        infoCompany.setCompanyImageUrl("company-default.jpg");
        // Save InfoCompany
        infoCompanyService.saveInfoCompany(infoCompany);

        // Ensure infoCompany is saved and has an ID
        if (infoCompany.getId() == null) {
            throw new IllegalStateException("InfoCompany ID should not be null after saving");
        }

        redirectAttributes.addFlashAttribute("message", "Registration successful!");
        return "redirect:/login";
    }

    @GetMapping("/verify")
    public String verifyAccount(@RequestParam("token") String token, RedirectAttributes redirectAttributes) {
        System.out.println("Verifying account with token: " + token);
        User user = userService.findByVerificationToken(token);
        if (user != null) {
            user.setIsActive(true);
            user.setIsVerifyEmail(true); // Mark email as verified
            user.setVerificationToken(null); // Clear the token
            userService.saveUser(user);
            System.out.println("Account verified successfully for token: " + token);
            redirectAttributes.addFlashAttribute("message", "Account verified successfully!");
            return "redirect:/login";
        } else {
            System.out.println("Invalid verification link for token: " + token);
            redirectAttributes.addFlashAttribute("error", "Invalid verification link.");
            return "redirect:/register";
        }
    }

    @GetMapping("/search")
    public String searchJobs(@RequestParam(value = "query", required = false) String query,
            @RequestParam(value = "location", required = false) String location,
            @RequestParam(value = "position", required = false) String position,
            @RequestParam(value = "career", required = false) String career,
            Model model) {
        List<JobPost> hotJobPosts = jobPostService.getHotJobPosts();
        model.addAttribute("hotJobPosts", hotJobPosts);

        List<JobPost> jobPosts;
        if (query != null && !query.isEmpty()) {
            jobPosts = jobPostService.searchJobs(query);
        } else if (location != null && !location.isEmpty()) {
            jobPosts = jobPostService.searchJobsByLocation(location);
        } else if (position != null && !position.isEmpty()) {
            jobPosts = jobPostService.searchJobsByPosition(Position.valueOf(position));
        } else if (career != null && !career.isEmpty()) {
            jobPosts = jobPostService.searchJobsByCareer(career);
        } else {
            jobPosts = jobPostService.getAllJobPosts();
        }

        model.addAttribute("jobPosts", jobPosts);

        List<CommonCareer> careers = commonCareerService.findAll();
        model.addAttribute("careers", careers);

        return "client/homepage/search";
    }

    @GetMapping("/chat")
    public String getChatPage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String email = authentication.getName();
            User user = userService.getUserByEmail(email); // Lấy thông tin người dùng

            // Thêm thông tin người dùng vào mô hình
            model.addAttribute("currentUser", user); // Thêm người dùng hiện tại vào mô hình
            // Lấy danh sách người dùng đã nhắn tin
            List<String> users = chatHistoryService.getDistinctUsers(user.getFullName()); // Truyền tên người dùng hiện tại
            model.addAttribute("users", users);

            if (user != null) {
                // Kiểm tra vai trò của người dùng
                String role = user.getRoleName();
                if ("USER".equals(role)) {
                    // Lấy danh sách nhà tuyển dụng mà user đã apply
                    List<InfoCompany> appliedCompanies = jobPostActivityService.getAppliedCompaniesByUser(user);
                    model.addAttribute("appliedCompanies", appliedCompanies);
                } else if ("RECRUITER".equals(role)) {
                    // Lấy danh sách user đã apply tin tuyển dụng
                    List<JobPostActivity> applicants = jobPostActivityService.getApplicantsByRecruiter(user);
                    model.addAttribute("applicants", applicants);
                }
            }
        }

        return "client/chat/show"; // Trả về view chat
    }

    @PostMapping("/chat/history")
    public ResponseEntity<?> getChatHistory(@RequestBody ChatRequest chatRequest) {
        String sender = chatRequest.getSender();
        String recipient = chatRequest.getRecipient();

        // Xử lý logic lấy lịch sử chat
        List<ChatMessage> chatHistory = chatHistoryService.getChatHistory(sender, recipient);
        return ResponseEntity.ok(chatHistory);
    }

}