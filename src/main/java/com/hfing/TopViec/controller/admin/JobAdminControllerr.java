package com.hfing.TopViec.controller.admin;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.CommonCareer;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.enums.AcademicLevel;
import com.hfing.TopViec.domain.enums.Experience;
import com.hfing.TopViec.domain.enums.JobType;
import com.hfing.TopViec.domain.enums.Position;
import com.hfing.TopViec.domain.enums.TypeOfWorkplace;
import com.hfing.TopViec.service.CommonCareerService;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JobAdminControllerr {
    private final UserService userService;
    private final JobPostService jobPostService;
    private final CommonCareerService commonCareerService;
    private final CommonCityService commonCityService;
    private final InfoCompanyService companyService;
    private final CommonLocationService commonLocationService;

    public JobAdminControllerr(UserService userService, JobPostService jobPostService,
            CommonCareerService commonCareerService, CommonCityService commonCityService,
            InfoCompanyService companyService, CommonLocationService commonLocationService) {
        this.userService = userService;
        this.jobPostService = jobPostService;
        this.commonCareerService = commonCareerService;
        this.commonCityService = commonCityService;
        this.companyService = companyService;
        this.commonLocationService = commonLocationService;
    }

    @GetMapping("/admin/job")
    public String getJobAdminPage(Model model) {
        model.addAttribute("jobList", jobPostService.getAllJobPosts());
        model.addAttribute("jobPost", new JobPost());
        return "admin/job/show";
    }

    @PostMapping("/admin/job/updateStatus")
    public String updateJobStatus(@RequestParam("id") Long jobPostId, @RequestParam("status") int status) {
        JobPost jobPost = jobPostService.getJobPostById(jobPostId);
        jobPost.setStatus(status);
        jobPostService.saveJobPost(jobPost);
        return "redirect:/admin/job";
    }

    @GetMapping("/admin/job/{id}")
    public String viewJobPost(@PathVariable("id") Long jobPostId, Model model) {
        JobPost jobPost = jobPostService.getJobPostById(jobPostId);

        model.addAttribute("jobPost", jobPost);
        model.addAttribute("cityname", jobPost.getLocation().getCity().getName());
        model.addAttribute("districtname", jobPost.getLocation().getDistrict().getName());
        model.addAttribute("careername", jobPost.getCareer().getName());
        model.addAttribute("companyname", jobPost.getCompany().getCompanyName());
        model.addAttribute("user", userService.getUserById(jobPost.getUser().getId()).getFullName());
        return "admin/job/detail";
    }

    @GetMapping("/admin/job/create")
    public String getCreateJobPage(Model model) {
        List<CommonCareer> careers = commonCareerService.findAll();
        List<CommonCity> cities = commonCityService.findAll();
        List<InfoCompany> companies = companyService.getAllCompanies();

        model.addAttribute("newJobPost", new JobPost());
        model.addAttribute("careers", careers);
        model.addAttribute("cities", cities);
        model.addAttribute("experiences", Experience.values());
        model.addAttribute("positions", Position.values());
        model.addAttribute("academicLevels", AcademicLevel.values());
        model.addAttribute("typeOfWorkplaces", TypeOfWorkplace.values());
        model.addAttribute("jobTypes", JobType.values());
        model.addAttribute("companies", companies);

        return "admin/job/create";
    }

    @PostMapping("/admin/job/create")
    public String postCreateJob(@ModelAttribute("newJobPost") JobPost newJobPost,
            @RequestParam("location.city.id") Long cityId,
            @RequestParam("location.district.id") Long districtId,
            @RequestParam("company.id") Long companyId) {
        // Set the city and district

        newJobPost.setLocation(commonLocationService.findByCityIdAndDistrictId(cityId, districtId));

        // Set the company
        InfoCompany company = companyService.getCompanyById(companyId);
        newJobPost.setCompany(company);
        newJobPost.setUser(company.getUser());
        newJobPost.setCreateAt(LocalDateTime.now());
        newJobPost.setStatus(2);
        // Save the job post
        jobPostService.saveJobPost(newJobPost);

        return "redirect:/admin/job";
    }

    @GetMapping("/admin/job/delete")
    public String deleteJob(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        jobPostService.deleteJobPost(id);
        return "redirect:/admin/job";
    }

}
