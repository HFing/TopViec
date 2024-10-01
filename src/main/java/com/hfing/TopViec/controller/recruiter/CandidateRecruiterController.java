package com.hfing.TopViec.controller.recruiter;

import java.util.Date;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.stream.Collectors;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.InfoResumeSaved;
import com.hfing.TopViec.domain.JobPost;
import com.hfing.TopViec.domain.JobPostActivity;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.InfoResumeSavedService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.JobPostActivityService;
import com.hfing.TopViec.service.JobPostService;
import com.hfing.TopViec.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CandidateRecruiterController {
    private final InfoResumeService infoResumeService;
    private final InfoResumeSavedService infoResumeSavedService;
    private final UserService userService;
    private final InfoCompanyService infoCompanyService;
    private final CommonCityService commonCityService;
    private final JobPostActivityService jobPostActivityService;
    private final JobPostService jobPostService;

    public CandidateRecruiterController(InfoResumeService infoResumeService,
            InfoResumeSavedService infoResumeSavedService,
            UserService userService, InfoCompanyService infoCompanyService, CommonCityService commonCityService,
            JobPostActivityService jobPostActivityService, JobPostService jobPostService) {
        this.infoResumeService = infoResumeService;
        this.infoResumeSavedService = infoResumeSavedService;
        this.userService = userService;
        this.infoCompanyService = infoCompanyService;
        this.commonCityService = commonCityService;
        this.jobPostActivityService = jobPostActivityService;
        this.jobPostService = jobPostService;
    }

    @GetMapping("/recruiter/candidate")
    public String getCadidateFindPage(Model model) {

        model.addAttribute("cities", commonCityService.findAll());
        model.addAttribute("infoResumes", infoResumeService.findAll());

        return "recruiter/candidate/show";
    }

    @GetMapping("/recruiter/candidate/{id}")
    public String getCadidateDetailPage(@PathVariable("id") Long id, Model model) {
        InfoResume resume = infoResumeService.findByIdNotOpt(id);
        model.addAttribute("candidate", resume);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        InfoResumeSaved infoResumeSaved = infoResumeSavedService.findByCompanyAndResume(company, resume);
        boolean isSaved = infoResumeSaved != null;

        if (infoResumeSaved == null) {
            infoResumeSaved = new InfoResumeSaved();
            infoResumeSaved.setCompany(company);
            infoResumeSaved.setResume(resume);
        }

        model.addAttribute("infoResumeSaved", infoResumeSaved);
        model.addAttribute("isSaved", isSaved);
        return "recruiter/candidate/profile";
    }

    @PostMapping("/recruiter/candidate/save")
    public String saveResume(@ModelAttribute InfoResumeSaved infoResumeSaved, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        InfoResume resume = infoResumeService.findByIdNotOpt(infoResumeSaved.getResume().getId());

        InfoResumeSaved existingInfoResumeSaved = infoResumeSavedService.findByCompanyAndResume(company, resume);
        if (existingInfoResumeSaved == null) {
            infoResumeSaved.setCompany(company);
            infoResumeSaved.setResume(resume);
            infoResumeSaved.setSavedAt(new Date());
            infoResumeSavedService.saveInfoResumeSaved(infoResumeSaved);
        }

        model.addAttribute("infoResumeSaved", infoResumeSaved);
        model.addAttribute("candidate", resume);
        return "redirect:/recruiter/candidate/" + resume.getId();
    }

    @GetMapping("/recruiter/candidate/save")
    public String getSavePageCandidate(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        infoResumeSavedService.findByCompany(company);
        model.addAttribute("infoResumes", infoResumeSavedService.findByCompany(company));
        return "recruiter/candidate/save";
    }

    @PostMapping("/recruiter/candidate/unsave/{id}")
    public String unsaveResume(@PathVariable("id") Long id, Model model) {

        infoResumeSavedService.deleteById(id);

        return "redirect:/recruiter/candidate/save";
    }

    @GetMapping("/recruiter/candidate/search")
    public String searchCandidates(@RequestParam("keyword") String keyword,
            @RequestParam(value = "city", required = false) Long cityId, Model model) {
        List<InfoResume> infoResumes = infoResumeService.searchResumes(keyword, cityId);
        List<CommonCity> cities = commonCityService.findAll();
        model.addAttribute("infoResumes", infoResumes);
        model.addAttribute("cities", cities);
        return "recruiter/candidate/show";
    }

    @GetMapping("/recruiter/candidate/application")
    public String getMethodName(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        InfoCompany company = infoCompanyService.findByUser(user);
        List<JobPost> jobPosts = company.getJobPosts();

        List<JobPostActivity> jobPostActivities = jobPosts.stream()
                .flatMap(jobPost -> jobPost.getJobPostActivities().stream())
                .collect(Collectors.toList());

        model.addAttribute("jobPostActivities", jobPostActivities);
        model.addAttribute("jobPosts", jobPosts);
        return "recruiter/candidate/application";
    }

    @PostMapping("/recruiter/candidate/updateStatus")
    public String updateStatus(@RequestParam("activityId") Long activityId, @RequestParam("status") int status) {
        JobPostActivity jobPostActivity = jobPostActivityService.findById(activityId);
        if (jobPostActivity != null) {
            jobPostActivity.setStatus(status);
            jobPostActivityService.save(jobPostActivity);
        }
        return "redirect:/recruiter/candidate/application";
    }

    @GetMapping("/recruiter/candidate/application/search")
    public String searchCandidates(@RequestParam(required = false) Long posted,
            @RequestParam(required = false) Integer status,
            Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);

        InfoCompany company = infoCompanyService.findByUser(user);
        List<JobPost> jobPosts = company.getJobPosts();

        List<JobPostActivity> jobPostActivities = jobPosts.stream()
                .flatMap(jobPost -> jobPost.getJobPostActivities().stream())
                .filter(activity -> (posted == null || activity.getJobPost().getId().equals(posted)) &&
                        (status == null || Integer.valueOf(activity.getStatus()).equals(status)))
                .collect(Collectors.toList());

        model.addAttribute("jobPostActivities", jobPostActivities);
        model.addAttribute("jobPosts", jobPosts);

        return "recruiter/candidate/application";
    }

}
