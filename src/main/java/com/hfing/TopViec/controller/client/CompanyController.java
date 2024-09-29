package com.hfing.TopViec.controller.client;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoCompanyImage;
import com.hfing.TopViec.service.InfoCompanyImageService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.JobPostService;

import org.springframework.ui.Model;

@Controller
public class CompanyController {
    private final InfoCompanyService companyService;
    private final InfoCompanyImageService companyImageService;
    private final JobPostService jobPostService;

    public CompanyController(InfoCompanyService companyService, InfoCompanyImageService companyImageService,
            JobPostService jobPostService) {
        this.companyService = companyService;
        this.companyImageService = companyImageService;
        this.jobPostService = jobPostService;
    }

    @GetMapping("/companies")
    public String getComPany(Model model) {
        List<InfoCompany> companies = companyService.getAllCompanies();
        model.addAttribute("companies", companies);
        return "client/company/show";
    }

    @GetMapping("/companies/{id}")
    public String getCompanyById(@PathVariable("id") Long id, Model model) {
        InfoCompany company = companyService.getCompanyById(id);
        List<InfoCompanyImage> images = companyImageService.findByCompany(company);
        model.addAttribute("company", company);
        model.addAttribute("city", company.getLocation().getCity().getName());
        model.addAttribute("sizeEmployees", company.getEmployeeSize().getSizeDescription());
        model.addAttribute("images", images);
        model.addAttribute("jobPosts", jobPostService.getJobPostsByCompanyId(id));
        return "client/company/detail";
    }

}
