package com.hfing.TopViec.controller.client;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.service.InfoCompanyService;

import jakarta.persistence.criteria.CriteriaBuilder.In;

import org.springframework.ui.Model;

@Controller
public class CompanyController {
    private InfoCompanyService companyService;

    public CompanyController(InfoCompanyService companyService) {
        this.companyService = companyService;
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
        model.addAttribute("company", company);
        model.addAttribute("city", company.getLocation().getCity().getName());
        model.addAttribute("sizeEmployees", company.getEmployeeSize().getSizeDescription());
        return "client/company/detail";
    }

}
