package com.hfing.TopViec.controller.client;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.hfing.TopViec.domain.CommonCareer;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.InfoAdvancedSkill;
import com.hfing.TopViec.domain.InfoCertificate;
import com.hfing.TopViec.domain.InfoEducationDetail;
import com.hfing.TopViec.domain.InfoExperienceDetail;
import com.hfing.TopViec.domain.InfoLanguageSkill;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.JobSeekerProfile;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Language;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;
import com.hfing.TopViec.service.CommonCareerService;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.InfoAdvancedSkillService;
import com.hfing.TopViec.service.InfoCertificateService;
import com.hfing.TopViec.service.InfoEducationDetailService;
import com.hfing.TopViec.service.InfoExperienceDetailService;
import com.hfing.TopViec.service.InfoLanguageSkillService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.JobSeekerProfileService;
import com.hfing.TopViec.service.UploadService;
import com.hfing.TopViec.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    private final UserService userService;
    private final JobSeekerProfileService jobSeekerProfileService;
    private final CommonCityService commonCityService;
    private final CommonLocationService commonLocationService;
    private final InfoResumeService infoResumeService;
    private final CommonCareerService commonCareerService;
    private final InfoExperienceDetailService infoExperienceDetailService;
    private final InfoEducationDetailService infoEducationDetailService;
    private final InfoCertificateService infoCertificateService;
    private final InfoLanguageSkillService infoLanguageSkillService;
    private final InfoAdvancedSkillService infoAdvancedSkillService;
    private final UploadService uploadService;

    public ProfileController(UserService userService, JobSeekerProfileService jobSeekerProfileService,
            CommonCityService commonCityService, CommonLocationService commonLocationService,
            InfoResumeService infoResumeService, CommonCareerService commonCareerService,
            InfoExperienceDetailService infoExperienceDetailService,
            InfoEducationDetailService infoEducationDetailService,
            InfoCertificateService infoCertificateService, InfoLanguageSkillService infoLanguageSkillService,
            InfoAdvancedSkillService infoAdvancedSkillService, UploadService uploadService) {
        this.userService = userService;
        this.jobSeekerProfileService = jobSeekerProfileService;
        this.commonCityService = commonCityService;
        this.commonLocationService = commonLocationService;
        this.infoResumeService = infoResumeService;
        this.commonCareerService = commonCareerService;
        this.infoExperienceDetailService = infoExperienceDetailService;
        this.infoEducationDetailService = infoEducationDetailService;
        this.infoCertificateService = infoCertificateService;
        this.infoLanguageSkillService = infoLanguageSkillService;
        this.infoAdvancedSkillService = infoAdvancedSkillService;
        this.uploadService = uploadService;
    }

    @GetMapping("/profile")
    public String getProfilePage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        JobSeekerProfile jobSeekerProfile = jobSeekerProfileService.getProfileByUserId(user.getId());
        model.addAttribute("jobSeekerProfile", jobSeekerProfile);

        return "client/profile/show";
    }

    @GetMapping("/profile/accountsettings")
    public String showAccountSettings(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername(); // Giả sử email được lưu trong thuộc tính username
        }

        User user = userService.getUserByEmail(userEmail);
        JobSeekerProfile jobSeekerProfile = null;
        if (user != null) {
            jobSeekerProfile = jobSeekerProfileService.getProfileByUserId(user.getId());
        }

        if (jobSeekerProfile == null) {
            // Tạo mới đối tượng JobSeekerProfile nếu nó chưa tồn tại
            jobSeekerProfile = new JobSeekerProfile();
            jobSeekerProfile.setLocation(new CommonLocation());
        }

        String cityName = jobSeekerProfile.getLocation().getCity() != null
                ? jobSeekerProfile.getLocation().getCity().getName()
                : "Not updated";
        String districtName = jobSeekerProfile.getLocation().getDistrict() != null
                ? jobSeekerProfile.getLocation().getDistrict().getName()
                : "Not updated";
        // Lấy danh sách các thành phố
        List<CommonCity> cities = commonCityService.findAll();

        model.addAttribute("user", user);
        model.addAttribute("jobSeekerProfile", jobSeekerProfile); // Đảm bảo tên chính xác
        model.addAttribute("citiesProfileUpdate", cities);
        model.addAttribute("birthday", jobSeekerProfile.getBirthday());
        model.addAttribute("gender", jobSeekerProfile.getGender());
        model.addAttribute("cityName", cityName);
        model.addAttribute("districtName", districtName);
        model.addAttribute("address", jobSeekerProfile.getAddress());

        return "client/profile/account";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(
            @RequestParam("user.fullName") String fullName,
            @RequestParam("user.phone") String phone,
            @RequestParam("location.city.id") Integer cityId,
            @RequestParam("location.district.id") Integer districtId,
            @ModelAttribute("jobSeekerProfile") JobSeekerProfile jobSeekerProfile,
            BindingResult result,
            Model model, HttpSession session) {

        if (result.hasErrors()) {
            return "client/profile/account";
        }

        // Lấy thông tin người dùng hiện tại
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        if (user == null) {
            return "redirect:/login";
        }

        user.setFullName(fullName);
        user.setPhone(phone);
        userService.saveUser(user);

        session.setAttribute("fullName", user.getFullName());
        session.setAttribute("phone", user.getPhone());

        // Cập nhật thông tin hồ sơ tìm việc
        JobSeekerProfile existingProfile = jobSeekerProfileService.getProfileByUserId(user.getId());
        if (existingProfile == null) {
            existingProfile = new JobSeekerProfile();
            existingProfile.setUser(user);
        }
        existingProfile.setBirthday(jobSeekerProfile.getBirthday());
        existingProfile.setGender(jobSeekerProfile.getGender());

        // Cập nhật thông tin location
        CommonLocation location = existingProfile.getLocation();
        if (location == null) {
            location = new CommonLocation();
        }

        existingProfile.setLocation(
                commonLocationService.findByCityIdAndDistrictId(cityId.longValue(), districtId.longValue()));

        existingProfile.setAddress(jobSeekerProfile.getAddress());
        jobSeekerProfileService.save(existingProfile);

        return "redirect:/profile/accountsettings";
    }

    @GetMapping("/profile/resume")
    public String getResumePage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        List<CommonCareer> careers = commonCareerService.findAll();
        List<CommonCity> cities = commonCityService.findAll();
        List<InfoResume> infoResumeMain = infoResumeService.findAllByUserIdAndFileUrlIsNotNull(user.getId());
        model.addAttribute("careers", careers);
        model.addAttribute("cities", cities);
        model.addAttribute("infoResume", infoResume);
        model.addAttribute("newInfoResume", new InfoResume());
        model.addAttribute("infoResumeMain", infoResumeMain);

        return "client/profile/resume";
    }

    @PostMapping("/profile/resume/delete/{id}")
    public String deleteResume(@PathVariable Long id) {
        infoResumeService.deleteById(id);
        return "redirect:/profile/resume";
    }

    @PostMapping("/profile/resume/update/{id}")
    public String updateResume(@PathVariable Long id, @ModelAttribute("newInfoResume") InfoResume infoResume,
            @RequestParam("resumeFile") MultipartFile resumeFile) {
        Optional<InfoResume> existingResumeOptional = infoResumeService.findById(id);
        if (existingResumeOptional.isPresent()) {
            InfoResume existingResume = existingResumeOptional.get();

            // Cập nhật thông tin resume
            existingResume.setTitle(infoResume.getTitle());
            existingResume.setDescription(infoResume.getDescription());
            existingResume.setSalaryMin(infoResume.getSalaryMin());
            existingResume.setSalaryMax(infoResume.getSalaryMax());
            existingResume.setPosition(infoResume.getPosition());
            existingResume.setExperience(infoResume.getExperience());
            existingResume.setAcademicLevel(infoResume.getAcademicLevel());
            existingResume.setTypeOfWorkplace(infoResume.getTypeOfWorkplace());
            existingResume.setJobType(infoResume.getJobType());
            existingResume.setCareer(infoResume.getCareer());
            existingResume.setCity(infoResume.getCity());
            existingResume.setUpdateAt(java.time.LocalDateTime.now());

            // Xử lý file upload nếu có
            if (!resumeFile.isEmpty()) {
                try {
                    // Xóa file cũ
                    Files.deleteIfExists(Paths.get(existingResume.getFileUrl()));

                    // Lưu file mới
                    String fileUrl = uploadService.handleSaveUploadFile(resumeFile, "resume");
                    existingResume.setFileUrl(fileUrl);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý lỗi nếu cần
                }
            }

            // Lưu resume đã cập nhật vào cơ sở dữ liệu
            infoResumeService.save(existingResume);
        }
        return "redirect:/profile/resume";
    }

    @PostMapping("/profile/resume/addresume")
    public String addresume(@ModelAttribute InfoResume infoResume, @RequestParam("resumeFile") MultipartFile resumeFile,
            Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        infoResume.setUser(user);
        infoResume.setCreateAt(LocalDateTime.now());
        infoResume.setCreateAt(LocalDateTime.now());
        infoResume.setUpdateAt(LocalDateTime.now());
        String fileUrl = uploadService.handleSaveUploadFile(resumeFile, "resume");
        infoResume.setFileUrl(fileUrl);
        infoResumeService.save(infoResume);
        return "redirect:/profile/resume";
    }

    @GetMapping("/profile/resume/resume-update")
    public String getResumeUpdatePage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername(); // Giả sử email được lưu trong thuộc tính username
        }
        User user = userService.getUserByEmail(userEmail);
        JobSeekerProfile jobSeekerProfile = jobSeekerProfileService.getProfileByUserId(user.getId());
        String cityName = jobSeekerProfile.getLocation().getCity() != null
                ? jobSeekerProfile.getLocation().getCity().getName()
                : "Chưa cập nhật";
        String districtName = jobSeekerProfile.getLocation().getDistrict() != null
                ? jobSeekerProfile.getLocation().getDistrict().getName()
                : "Chưa cập nhật";

        InfoResume optionalInfoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        List<CommonCareer> careers = commonCareerService.findAll();
        List<CommonCity> cities = commonCityService.findAll();
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());

        if (infoResume.getExperienceDetails() == null) {
            infoResume.setExperienceDetails(new ArrayList<>());
        }
        // Thêm đối tượng infoExperienceDetail vào mô hình
        model.addAttribute("infoExperienceDetail", new InfoExperienceDetail());

        if (infoResume.getEducationDetails() == null) {
            infoResume.setEducationDetails(new ArrayList<>());
        }

        model.addAttribute("infoEducationDetails", new InfoEducationDetail());

        if (infoResume.getCertificates() == null) {
            infoResume.setCertificates(new ArrayList<>());
        }
        model.addAttribute("infoCertificate", new InfoCertificate());

        if (infoResume.getLanguageSkills() == null) {
            infoResume.setLanguageSkills(new ArrayList<>());
        }
        model.addAttribute("infoLanguageSkill", new InfoLanguageSkill());

        if (infoResume.getAdvancedSkills() == null) {
            infoResume.setAdvancedSkills(new ArrayList<>());
        }
        model.addAttribute("infoAdvancedSkill", new InfoAdvancedSkill());

        model.addAttribute("infoResumeShow", infoResume);
        model.addAttribute("infoResume", optionalInfoResume);
        model.addAttribute("user", user);
        model.addAttribute("jobSeekerProfile", jobSeekerProfile);
        model.addAttribute("birthday", jobSeekerProfile.getBirthday());
        model.addAttribute("gender", jobSeekerProfile.getGender());
        model.addAttribute("cityName", cityName);
        model.addAttribute("districtName", districtName);
        model.addAttribute("address", jobSeekerProfile.getAddress());
        model.addAttribute("positions", Position.values());
        model.addAttribute("academicLevels", AcademicLevel.values());
        model.addAttribute("experiences", Experience.values());
        model.addAttribute("careers", careers);
        model.addAttribute("cities", cities);
        model.addAttribute("typeOfWorkplaces", TypeOfWorkplace.values());
        model.addAttribute("jobTypes", JobType.values());
        model.addAttribute("experienceDetails", infoResume.getExperienceDetails());
        model.addAttribute("educationDetails", infoResume.getEducationDetails());
        model.addAttribute("certificates", infoResume.getCertificates());
        model.addAttribute("languageSkills", infoResume.getLanguageSkills());
        model.addAttribute("advancedSkills", infoResume.getAdvancedSkills());
        return "client/profile/resumeupdate";
    }

    @PostMapping("/updateResume")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateResume(@ModelAttribute("infoResume") InfoResume infoResume) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        infoResume.setUser(user);
        infoResume.setJobSeekerProfile(jobSeekerProfileService.getProfileByUserId(user.getId()));

        // Kiểm tra xem hồ sơ đã tồn tại chưa
        InfoResume existingResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        if (existingResume != null) {
            // Cập nhật hồ sơ hiện có
            existingResume.setTitle(infoResume.getTitle());
            existingResume.setDescription(infoResume.getDescription());
            existingResume.setSalaryMin(infoResume.getSalaryMin());
            existingResume.setSalaryMax(infoResume.getSalaryMax());
            existingResume.setPosition(infoResume.getPosition());
            existingResume.setExperience(infoResume.getExperience());
            existingResume.setAcademicLevel(infoResume.getAcademicLevel());
            existingResume.setTypeOfWorkplace(infoResume.getTypeOfWorkplace());
            existingResume.setJobType(infoResume.getJobType());
            existingResume.setCareer(infoResume.getCareer());
            existingResume.setCity(infoResume.getCity());
            existingResume.setUpdateAt(java.time.LocalDateTime.now());
            infoResumeService.save(existingResume);
        } else {
            // Chèn hồ sơ mới
            infoResume.setCreateAt(java.time.LocalDateTime.now());
            infoResume.setUpdateAt(java.time.LocalDateTime.now());
            infoResumeService.save(infoResume);
        }

        Map<String, Object> response = new HashMap<>();
        response.put("title", infoResume.getTitle());
        response.put("position", infoResume.getPosition());
        response.put("academicLevel", infoResume.getAcademicLevel());
        response.put("experience", infoResume.getExperience());
        response.put("career", infoResume.getCareer());
        response.put("city", infoResume.getCity());
        response.put("typeOfWorkplace", infoResume.getTypeOfWorkplace());
        response.put("jobType", infoResume.getJobType());
        response.put("description", infoResume.getDescription());
        return ResponseEntity.ok(response);
    }

    @PostMapping("/addExperienceDetail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addExperienceDetail(
            @ModelAttribute InfoExperienceDetail experienceDetail) {
        // Lấy thông tin người dùng hiện tại
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        // Lấy hồ sơ của người dùng
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        if (infoResume == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        // Liên kết chi tiết kinh nghiệm với hồ sơ
        experienceDetail.setResume(infoResume);
        experienceDetail.setCreateAt(LocalDateTime.now());

        // Lưu chi tiết kinh nghiệm vào cơ sở dữ liệu
        infoExperienceDetailService.save(experienceDetail);

        // Tạo phản hồi
        Map<String, Object> response = new HashMap<>();
        response.put("id", experienceDetail.getId());
        response.put("jobName", experienceDetail.getJobName());
        response.put("companyName", experienceDetail.getCompanyName());
        response.put("startDate", experienceDetail.getStartDate());
        response.put("endDate", experienceDetail.getEndDate());
        response.put("description", experienceDetail.getDescription());
        System.out.println(response);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/addEducationDetail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addEducationDetail(
            @ModelAttribute InfoEducationDetail educationDetail) {
        // Lấy thông tin người dùng hiện tại
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        // Lấy hồ sơ của người dùng
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        if (infoResume == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        // Liên kết chi tiết giáo dục với hồ sơ
        educationDetail.setResume(infoResume);
        educationDetail.setCreateAt(LocalDateTime.now());

        // Lưu chi tiết giáo dục vào cơ sở dữ liệu
        infoEducationDetailService.save(educationDetail);

        // Tạo phản hồi
        Map<String, Object> response = new HashMap<>();
        response.put("id", educationDetail.getId());
        response.put("degreeName", educationDetail.getDegreeName());
        response.put("major", educationDetail.getMajor());
        response.put("trainingPlaceName", educationDetail.getTrainingPlaceName());
        response.put("startDate", educationDetail.getStartDate());
        response.put("completedDate", educationDetail.getCompletedDate());
        response.put("description", educationDetail.getDescription());
        System.out.println(response);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/addCertificateDetail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addCertificateDetail(
            @ModelAttribute InfoCertificate certificateDetail) {
        // Lấy thông tin người dùng hiện tại
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        // Lấy hồ sơ của người dùng
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        if (infoResume == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        // Liên kết chi tiết chứng chỉ với hồ sơ
        certificateDetail.setResume(infoResume);
        certificateDetail.setCreateAt(LocalDateTime.now());

        // Lưu chi tiết chứng chỉ vào cơ sở dữ liệu
        infoCertificateService.save(certificateDetail);

        // Tạo phản hồi
        Map<String, Object> response = new HashMap<>();
        response.put("id", certificateDetail.getId());
        response.put("name", certificateDetail.getName());
        response.put("trainingPlaceName", certificateDetail.getTrainingPlaceName());
        response.put("startDate", certificateDetail.getStartDate());
        response.put("expirationDate", certificateDetail.getExpirationDate());
        System.out.println(response);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/addLanguageSkillDetail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addLanguageSkillDetail(
            @ModelAttribute InfoLanguageSkill languageSkillDetail) {
        // Lấy thông tin người dùng hiện tại
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        // Lấy hồ sơ của người dùng
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        if (infoResume == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        // Liên kết chi tiết kỹ năng ngôn ngữ với hồ sơ
        languageSkillDetail.setResume(infoResume);
        languageSkillDetail.setCreateAt(LocalDateTime.now());

        // Lưu chi tiết kỹ năng ngôn ngữ vào cơ sở dữ liệu
        infoLanguageSkillService.save(languageSkillDetail);

        // Tạo phản hồi
        Map<String, Object> response = new HashMap<>();
        response.put("id", languageSkillDetail.getId());
        response.put("language", languageSkillDetail.getLanguage().getDisplayName());
        response.put("level", languageSkillDetail.getLevel());
        System.out.println(response);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/addAdvancedSkillDetail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addAdvancedSkillDetail(
            @ModelAttribute InfoAdvancedSkill advancedSkillDetail) {
        // Lấy thông tin người dùng hiện tại
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        // Lấy hồ sơ của người dùng
        InfoResume infoResume = infoResumeService.findAllByUserIdAndFileUrlIsNull(user.getId());
        if (infoResume == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        // Liên kết chi tiết kỹ năng nâng cao với hồ sơ
        advancedSkillDetail.setResume(infoResume);
        advancedSkillDetail.setCreateAt(LocalDateTime.now());

        // Lưu chi tiết kỹ năng nâng cao vào cơ sở dữ liệu
        infoAdvancedSkillService.save(advancedSkillDetail);

        // Tạo phản hồi
        Map<String, Object> response = new HashMap<>();
        response.put("id", advancedSkillDetail.getId());
        response.put("name", advancedSkillDetail.getName());
        response.put("level", advancedSkillDetail.getLevel());
        System.out.println(response);
        return ResponseEntity.ok(response);
    }

    @ModelAttribute("languages")
    public Language[] getLanguages() {
        return Language.values();
    }

    @ModelAttribute("levels")
    public Map<Short, String> getLevels() {
        Map<Short, String> levels = new LinkedHashMap<>();
        levels.put((short) 1, "1 - Bad");
        levels.put((short) 2, "2 - Below Average");
        levels.put((short) 3, "3 - Average");
        levels.put((short) 4, "4 - Good");
        levels.put((short) 5, "5 - Excellent");
        return levels;
    }

}
