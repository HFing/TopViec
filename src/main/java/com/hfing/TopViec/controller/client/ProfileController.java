package com.hfing.TopViec.controller.client;

import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.JobSeekerProfile;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.JobSeekerProfileService;
import com.hfing.TopViec.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    private final UserService userService;
    private final JobSeekerProfileService jobSeekerProfileService;
    private final CommonCityService commonCityService;
    private final CommonDistrictService commonDistrictService;
    private final CommonLocationService commonLocationService;

    public ProfileController(UserService userService, JobSeekerProfileService jobSeekerProfileService,
            CommonCityService commonCityService, CommonDistrictService commonDistrictService,
            CommonLocationService commonLocationService) {
        this.userService = userService;
        this.jobSeekerProfileService = jobSeekerProfileService;
        this.commonCityService = commonCityService;
        this.commonDistrictService = commonDistrictService;
        this.commonLocationService = commonLocationService;
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
                : "Not updated";
        String districtName = jobSeekerProfile.getLocation().getDistrict() != null
                ? jobSeekerProfile.getLocation().getDistrict().getName()
                : "Not updated";

        model.addAttribute("user", user);
        model.addAttribute("jobSeekerProfile", jobSeekerProfile); // Đảm bảo tên chính xác
        model.addAttribute("birthday", jobSeekerProfile.getBirthday());
        model.addAttribute("gender", jobSeekerProfile.getGender());
        model.addAttribute("cityName", cityName);
        model.addAttribute("districtName", districtName);
        model.addAttribute("address", jobSeekerProfile.getAddress());

        return "client/profile/resumeupdate";
    }

}
