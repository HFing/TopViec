package com.hfing.TopViec.controller.admin;

import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.InfoResumeSaved;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.InfoResumeSavedService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CandidateAdminController {
    private final InfoResumeService infoResumeService;
    private final InfoResumeSavedService infoResumeSavedService;
    private final UserService userService;
    private final InfoCompanyService infoCompanyService;
    private final CommonCityService commonCityService;

    public CandidateAdminController(InfoResumeService infoResumeService, InfoResumeSavedService infoResumeSavedService,
            UserService userService, InfoCompanyService infoCompanyService, CommonCityService commonCityService) {
        this.infoResumeService = infoResumeService;
        this.infoResumeSavedService = infoResumeSavedService;
        this.userService = userService;
        this.infoCompanyService = infoCompanyService;
        this.commonCityService = commonCityService;
    }

    @GetMapping("/admin/candidate")
    public String getCadidateFindPage(Model model) {

        model.addAttribute("cities", commonCityService.findAll());
        model.addAttribute("infoResumes", infoResumeService.findAll());

        return "admin/candidate/show";
    }

    @GetMapping("/admin/candidate/{id}")
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
        return "admin/candidate/profile";
    }

    @GetMapping("/admin/candidate/search")
    public String searchCandidates(@RequestParam("keyword") String keyword,
            @RequestParam(value = "city", required = false) Long cityId, Model model) {
        List<InfoResume> infoResumes = infoResumeService.searchResumes(keyword, cityId);
        List<CommonCity> cities = commonCityService.findAll();
        model.addAttribute("infoResumes", infoResumes);
        model.addAttribute("cities", cities);
        return "admin/candidate/show";
    }

}
