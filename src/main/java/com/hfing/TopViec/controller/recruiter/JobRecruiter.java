package com.hfing.TopViec.controller.recruiter;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.hfing.TopViec.domain.CommonCareer;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.Notification;
import com.hfing.TopViec.domain.PaymentHistory;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;
import com.hfing.TopViec.service.CommonCareerService;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.NotificationService;
import com.hfing.TopViec.service.PaymentHistoryService;
import com.hfing.TopViec.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JobRecruiter {

    private final UserService userService;
    private final JobPostService jobPostService;
    private final InfoCompanyService infoCompanyService;
    private final CommonCareerService commonCareerService;
    private final CommonCityService commonCityService;
    private final CommonLocationService commonLocationService;
    private final CommonDistrictService commonDistrictService;
    private final NotificationService notificationService;
    private final PaymentHistoryService paymentHistoryService;

    public JobRecruiter(UserService userService, JobPostService jobPostService, InfoCompanyService infoCompanyService,
            CommonCareerService commonCareerService, CommonCityService commonCityService,
            CommonLocationService commonLocationService, CommonDistrictService commonDistrictService,
            NotificationService notificationService, PaymentHistoryService paymentHistoryService) {
        this.userService = userService;
        this.jobPostService = jobPostService;
        this.infoCompanyService = infoCompanyService;
        this.commonCareerService = commonCareerService;
        this.commonCityService = commonCityService;
        this.commonLocationService = commonLocationService;
        this.commonDistrictService = commonDistrictService;
        this.notificationService = notificationService;
        this.paymentHistoryService = paymentHistoryService;
    }

    @GetMapping("/recruiter/job")
    public String getJobListRecruiter(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        model.addAttribute("jobPosts", jobPostService.getJobPostsByUserId(user.getId()));
        return "recruiter/job/show";
    }

    @GetMapping("/recruiter/job/create")
    public String getCreateJobRecruiter(Model model) {

        List<CommonCareer> careers = commonCareerService.findAll();
        List<CommonCity> cities = commonCityService.findAll();
        model.addAttribute("newJobPost", new JobPost());
        model.addAttribute("careers", careers);
        model.addAttribute("cities", cities);
        model.addAttribute("experiences", Experience.values());
        model.addAttribute("positions", Position.values());
        model.addAttribute("academicLevels", AcademicLevel.values());
        model.addAttribute("typeOfWorkplaces", TypeOfWorkplace.values());
        model.addAttribute("jobTypes", JobType.values());
        return "recruiter/job/create";
    }

    @PostMapping("/recruiter/job/create")
    public String postCreateJob(@ModelAttribute("newJobPost") JobPost newJobPost,
            @RequestParam("location.city.id") Long cityId,
            @RequestParam("location.district.id") Long districtId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        newJobPost.setLocation(commonLocationService.findByCityIdAndDistrictId(cityId, districtId));
        newJobPost.setUser(user);
        newJobPost.setCompany(infoCompanyService.findByUser(user));
        newJobPost.setCreateAt(LocalDateTime.now());
        newJobPost.setViews(Long.valueOf(0));
        newJobPost.setIsHot(false);
        newJobPost.setIsUrgent(false);
        newJobPost.setStatus(2);
        jobPostService.saveJobPost(newJobPost);

        Notification notification = new Notification();
        notification.setUser(userService.getUserByEmail("admin@gmail.com"));
        notification.setCity(newJobPost.getLocation().getCity());
        notification.setCareer(newJobPost.getCareer());
        notification.setPosition(newJobPost.getPosition().getDisplayName());
        notification.setJobName(newJobPost.getJobName() + " - " + newJobPost.getCompany().getCompanyName()
                + " just posted a job ad that needs your approval.");
        notification.setExperience(newJobPost.getExperience().getDisplayName());
        notificationService.saveNotification(notification);

        return "redirect:/recruiter/job";
    }

    @GetMapping("/recruiter/job/update")
    public String getUpdateJobForm(@RequestParam("id") Long jobId, Model model) {
        JobPost existingJobPost = jobPostService.getJobPostById(jobId);
        model.addAttribute("existingJobPost", existingJobPost);

        List<CommonCareer> careers = commonCareerService.findAll();
        List<CommonCity> cities = commonCityService.findAll();
        List<CommonDistrict> districts = commonDistrictService
                .findByCityId(existingJobPost.getLocation().getCity().getId());
        model.addAttribute("careers", careers);
        model.addAttribute("cities", cities);
        model.addAttribute("experiences", Experience.values());
        model.addAttribute("positions", Position.values());
        model.addAttribute("academicLevels", AcademicLevel.values());
        model.addAttribute("typeOfWorkplaces", TypeOfWorkplace.values());
        model.addAttribute("jobTypes", JobType.values());
        model.addAttribute("districts", districts);

        return "recruiter/job/update";
    }

    @PostMapping("/recruiter/job/update")
    public String postUpdateJob(@ModelAttribute("existingJobPost") JobPost updatedJobPost,
            @RequestParam("location.city.id") Long cityId,
            @RequestParam("location.district.id") Long districtId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        // Lấy JobPost hiện có từ cơ sở dữ liệu
        JobPost existingJobPost = jobPostService.getJobPostById(updatedJobPost.getId());

        // Cập nhật các thuộc tính của JobPost hiện có
        existingJobPost.setJobName(updatedJobPost.getJobName());
        existingJobPost.setJobDescription(updatedJobPost.getJobDescription());
        existingJobPost.setJobRequirement(updatedJobPost.getJobRequirement());
        existingJobPost.setBenefitsEnjoyed(updatedJobPost.getBenefitsEnjoyed());
        existingJobPost.setSalaryMin(updatedJobPost.getSalaryMin());
        existingJobPost.setSalaryMax(updatedJobPost.getSalaryMax());
        existingJobPost.setDeadline(updatedJobPost.getDeadline());
        existingJobPost.setLocation(commonLocationService.findByCityIdAndDistrictId(cityId, districtId));
        existingJobPost.setCareer(updatedJobPost.getCareer());
        existingJobPost.setExperience(updatedJobPost.getExperience());
        existingJobPost.setPosition(updatedJobPost.getPosition());
        existingJobPost.setAcademicLevel(updatedJobPost.getAcademicLevel());
        existingJobPost.setTypeOfWorkplace(updatedJobPost.getTypeOfWorkplace());
        existingJobPost.setJobType(updatedJobPost.getJobType());
        existingJobPost.setUser(user);
        existingJobPost.setQuantity(updatedJobPost.getQuantity());
        existingJobPost.setGender(updatedJobPost.getGender());
        existingJobPost.setCompany(infoCompanyService.findByUser(user));
        existingJobPost.setUpdateAt(LocalDateTime.now());
        existingJobPost.setLocation(commonLocationService.findByCityIdAndDistrictId(cityId, districtId));
        existingJobPost.setContactPersonName(updatedJobPost.getContactPersonName());
        existingJobPost.setContactPersonPhone(updatedJobPost.getContactPersonPhone());
        existingJobPost.setContactPersonEmail(updatedJobPost.getContactPersonEmail());
        existingJobPost.setIsUrgent(updatedJobPost.getIsUrgent());

        // Lưu JobPost đã cập nhật
        jobPostService.saveJobPost(existingJobPost);

        return "redirect:/recruiter/job";
    }

    @GetMapping("/recruiter/job/delete")
    public String showDeleteJobConfirmation(@RequestParam("id") Long jobId, Model model) {
        JobPost jobPost = jobPostService.getJobPostById(jobId);
        model.addAttribute("jobPost", jobPost);
        return "recruiter/job/delete";
    }

    @PostMapping("/recruiter/job/delete")
    public String deleteJobPost(@ModelAttribute("jobPost") JobPost jobPost) {
        jobPostService.deleteJobPost(jobPost.getId());
        return "redirect:/recruiter/job";
    }

    @GetMapping("/recruiter/job/toggleHot")
    public String toggleHotStatus(@RequestParam("id") Long jobId, RedirectAttributes redirectAttributes) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        PaymentHistory paymentHistory = paymentHistoryService.findByUserID(user.getId());
        JobPost jobPost = jobPostService.getJobPostById(jobId);

        long jobFeaturedCount = (paymentHistory != null) ? paymentHistory.getFeaturedCount() : 0;
        long jobFeaturedUsed = jobPostService.getHotJobPostCountByUserId(user.getId());
        if (jobPost.getIsHot()) {
            jobPost.setIsHot(false);
            jobPostService.saveJobPost(jobPost);
            redirectAttributes.addFlashAttribute("message", "Update Job Hot successfully!");
            return "redirect:/recruiter/jobhot";
        }

        // Kiểm tra số lượng Job Hot còn lại
        if (jobFeaturedCount == 0) {
            redirectAttributes.addFlashAttribute("message", "You have no Job Hot left!");
            return "redirect:/recruiter/jobhot";
        } else if (jobFeaturedUsed >= jobFeaturedCount) {
            redirectAttributes.addFlashAttribute("message", "You have used all Job Hot!");
            return "redirect:/recruiter/jobhot";
        } else {
            jobPost.setIsHot(true); // Đặt trạng thái isHot thành true
            jobPostService.saveJobPost(jobPost);
            redirectAttributes.addFlashAttribute("message", "Update Job Hot successfully!");
            return "redirect:/recruiter/jobhot"; // Quay lại danh sách công việc
        }

    }

    @GetMapping("/recruiter/jobhot")
    public String getJobHotPage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        paymentHistoryService.findByUserID(user.getId());
        PaymentHistory paymentHistory = paymentHistoryService.findByUserID(user.getId());
        jobPostService.getJobPostsByUserId(user.getId());
        long jobFeaturedCount = (paymentHistory != null) ? paymentHistory.getFeaturedCount() : 0;
        model.addAttribute("jobFeaturedUsed", jobPostService.getHotJobPostCountByUserId(user.getId()));
        model.addAttribute("jobFeaturedCount", jobFeaturedCount);
        model.addAttribute("jobPosts", jobPostService.getJobPostsByUserId(user.getId()));
        return "recruiter/job/jobhot";
    }

}
