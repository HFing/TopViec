package com.hfing.TopViec.controller.admin;

import java.sql.Date;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.EmployeeSizeService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CompanyAdminController {
    private final CommonCityService cityService;
    private final EmployeeSizeService employeeSizeService;
    private final CommonDistrictService districtService;
    private final InfoCompanyService companyService;
    private final CommonLocationService locationService;
    private final UploadService uploadService;

    public CompanyAdminController(CommonCityService cityService, EmployeeSizeService employeeSizeService,
            CommonDistrictService districtService, InfoCompanyService companyService,
            CommonLocationService locationService,
            UploadService uploadService) {
        this.cityService = cityService;
        this.employeeSizeService = employeeSizeService;
        this.districtService = districtService;
        this.companyService = companyService;
        this.locationService = locationService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/company")
    public String getCompanyPage(Model model) {
        List<InfoCompany> companies = companyService.getAllCompanies();
        model.addAttribute("companies", companies);
        return "admin/company/show";
    }

    @GetMapping("/admin/company/create")
    public String getCompanyCreate(Model model) {
        model.addAttribute("newCompany", new InfoCompany());
        model.addAttribute("cities", cityService.findAll());
        model.addAttribute("employeeSizes", employeeSizeService.findAll());
        return "admin/company/create";
    }

    @GetMapping("/admin/api/districts")
    @ResponseBody
    public List<CommonDistrict> getDistrictsByCityId(@RequestParam Long cityId) {
        if (cityId == null) {
            throw new IllegalArgumentException("City ID is required and must be a valid number.");
        }
        return districtService.findByCityId(cityId);
    }

    @PostMapping("/admin/company/create")
    public String createCompany(@ModelAttribute("newCompany") InfoCompany newCompany,
            BindingResult result,
            @RequestParam("city") Long cityId,
            @RequestParam("district") Long districtId,
            @RequestParam("companyImageUrl") MultipartFile file,
            @RequestParam("companyCoverImageUrl") MultipartFile coverFile) {

        if (file != null && !file.isEmpty()) {
            String companyImageUrl = this.uploadService.handleSaveUploadFile(file, "company");
            newCompany.setCompanyImageUrl(companyImageUrl);
        } else {
            newCompany.setCompanyImageUrl("company-default.jpg");
        }

        if (coverFile != null && !coverFile.isEmpty()) {
            String companyCoverImageUrl = this.uploadService.handleSaveUploadFile(coverFile, "companycover");
            newCompany.setCompanyCoverImageUrl(companyCoverImageUrl);
        } else {
            newCompany.setCompanyCoverImageUrl("company-cover-default.jpeg");
        }

        CommonLocation location = locationService.findByCityIdAndDistrictId(cityId, districtId);
        newCompany.setLocation(location);
        newCompany.setCreateAt(new Date(System.currentTimeMillis()));
        companyService.saveInfoCompany(newCompany);
        return "redirect:/admin/company";
    }

    @GetMapping("/admin/company/delete/{id}")
    public String deleteCompanyPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newCompany", new InfoCompany());
        return "admin/company/delete";
    }

    @PostMapping("/admin/company/delete")
    public String deleteCompany(@RequestParam long id, RedirectAttributes redirectAttributes) {
        companyService.deleteCompanyById(id);
        redirectAttributes.addFlashAttribute("message", "Company deleted successfully.");
        return "redirect:/admin/company";
    }

    @GetMapping("/admin/company/{id}")
    public String companyDetailPage(Model model, @PathVariable long id) {
        InfoCompany company = companyService.getCompanyById(id);
        model.addAttribute("employeeSize", company.getEmployeeSize().getSizeDescription());
        model.addAttribute("company", company);
        String userName = (company.getUser() != null && company.getUser().getFullName() != null)
                ? company.getUser().getFullName()
                : "N/A";
        model.addAttribute("userName", userName);
        CommonLocation location = company.getLocation();
        model.addAttribute("location", location);
        model.addAttribute("address", location.getAddress());
        return "admin/company/detail";
    }
}
