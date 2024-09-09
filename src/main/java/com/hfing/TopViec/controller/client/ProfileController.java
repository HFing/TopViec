package com.hfing.TopViec.controller.client;

import java.lang.ProcessHandle.Info;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfing.TopViec.domain.CommonCareer;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.InfoEducationDetail;
import com.hfing.TopViec.domain.InfoExperienceDetail;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.JobSeekerProfile;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;
import com.hfing.TopViec.service.CommonCareerService;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.InfoEducationDetailService;
import com.hfing.TopViec.service.InfoExperienceDetailService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.JobSeekerProfileService;
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

    public ProfileController(UserService userService, JobSeekerProfileService jobSeekerProfileService,
            CommonCityService commonCityService, CommonLocationService commonLocationService,
            InfoResumeService infoResumeService, CommonCareerService commonCareerService,
            InfoExperienceDetailService infoExperienceDetailService,
            InfoEducationDetailService infoEducationDetailService) {
        this.userService = userService;
        this.jobSeekerProfileService = jobSeekerProfileService;
        this.commonCityService = commonCityService;
        this.commonLocationService = commonLocationService;
        this.infoResumeService = infoResumeService;
        this.commonCareerService = commonCareerService;
        this.infoExperienceDetailService = infoExperienceDetailService;
        this.infoEducationDetailService = infoEducationDetailService;
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
    public String getResumePage() {
        return "client/profile/resume";
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

        Optional<InfoResume> optionalInfoResume = infoResumeService.getResumeByUserId(user.getId());
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

        model.addAttribute("infoResumeShow", infoResume);
        model.addAttribute("infoResume", optionalInfoResume.orElse(new InfoResume()));
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
        Optional<InfoResume> existingResume = infoResumeService.getResumeByUserId(user.getId());
        if (existingResume.isPresent()) {
            // Cập nhật hồ sơ hiện có
            InfoResume existing = existingResume.get();
            existing.setTitle(infoResume.getTitle());
            existing.setDescription(infoResume.getDescription());
            existing.setSalaryMin(infoResume.getSalaryMin());
            existing.setSalaryMax(infoResume.getSalaryMax());
            existing.setPosition(infoResume.getPosition());
            existing.setExperience(infoResume.getExperience());
            existing.setAcademicLevel(infoResume.getAcademicLevel());
            existing.setTypeOfWorkplace(infoResume.getTypeOfWorkplace());
            existing.setJobType(infoResume.getJobType());
            existing.setCareer(infoResume.getCareer());
            existing.setCity(infoResume.getCity());
            existing.setUpdateAt(java.time.LocalDateTime.now());
            infoResume.setUpdateAt(java.time.LocalDateTime.now());
            infoResumeService.save(existing);
        } else {
            // Chèn hồ sơ mới
            infoResume.setCreateAt(java.time.LocalDateTime.now());
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
}
