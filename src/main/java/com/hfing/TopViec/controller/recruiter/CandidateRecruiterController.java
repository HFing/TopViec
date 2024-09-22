package com.hfing.TopViec.controller.recruiter;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoResume;
import com.hfing.TopViec.domain.InfoResumeSaved;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.InfoResumeSavedService;
import com.hfing.TopViec.service.InfoResumeService;
import com.hfing.TopViec.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CandidateRecruiterController {
    private final InfoResumeService infoResumeService;
    private final InfoResumeSavedService infoResumeSavedService;
    private final UserService userService;
    private final InfoCompanyService infoCompanyService;

    public CandidateRecruiterController(InfoResumeService infoResumeService,
            InfoResumeSavedService infoResumeSavedService, UserService userService,
            InfoCompanyService infoCompanyService) {
        this.infoResumeService = infoResumeService;
        this.infoResumeSavedService = infoResumeSavedService;
        this.userService = userService;
        this.infoCompanyService = infoCompanyService;
    }

    @GetMapping("/recruiter/candidate")
    public String getCadidateFindPage(Model model) {

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
        if (infoResumeSaved == null) {
            infoResumeSaved = new InfoResumeSaved();
            infoResumeSaved.setCompany(company);
            infoResumeSaved.setResume(resume);
        }
        model.addAttribute("infoResumeSaved", infoResumeSaved);

        return "recruiter/candidate/profile";
    }

    @PostMapping("/recruiter/toggle-save-candidate")
    public String toggleSaveCandidate(@RequestParam("resume.id") Long resumeId, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }
        User user = userService.getUserByEmail(userEmail);
        InfoCompany company = infoCompanyService.findByUser(user);
        InfoResume resume = infoResumeService.findByIdNotOpt(resumeId);

        boolean isSaved = infoResumeSavedService.existsByCompanyAndResume(company, resume);
        if (isSaved) {
            infoResumeSavedService.deleteByCompanyAndResume(company, resume);
        } else {
            InfoResumeSaved infoResumeSaved = new InfoResumeSaved();
            infoResumeSaved.setCompany(company);
            infoResumeSaved.setResume(resume);

            infoResumeSavedService.saveInfoResumeSaved(infoResumeSaved);
        }

        return "redirect:/recruiter/candidate/" + resume.getId();
    }

}
