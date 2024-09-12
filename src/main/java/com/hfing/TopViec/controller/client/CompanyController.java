package com.hfing.TopViec.controller.client;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoCompanyImage;
import com.hfing.TopViec.service.InfoCompanyImageService;
import com.hfing.TopViec.service.InfoCompanyService;
import org.springframework.ui.Model;

@Controller
public class CompanyController {
    private InfoCompanyService companyService;
    private InfoCompanyImageService companyImageService;

    public CompanyController(InfoCompanyService companyService, InfoCompanyImageService companyImageService) {
        this.companyService = companyService;
        this.companyImageService = companyImageService;
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
        return "client/company/detail";
    }

}
