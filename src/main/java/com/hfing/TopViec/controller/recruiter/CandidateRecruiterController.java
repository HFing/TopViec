package com.hfing.TopViec.controller.recruiter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hfing.TopViec.service.InfoResumeService;

@Controller
public class CandidateRecruiterController {
    private final InfoResumeService infoResumeService;

    public CandidateRecruiterController(InfoResumeService infoResumeService) {
        this.infoResumeService = infoResumeService;
    }

    @GetMapping("/recruiter/candidate")
    public String getCadidateFindPage(Model model) {
        model.addAttribute("infoResumes", infoResumeService.findAll());
        return "recruiter/candidate/show";
    }

    @GetMapping("/recruiter/candidate/{id}")
    public String getCadidateDetailPage(@PathVariable("id") Long id, Model model) {
        model.addAttribute("candidate", infoResumeService.findByIdNotOpt(id));
        return "recruiter/candidate/profile";
    }

}
