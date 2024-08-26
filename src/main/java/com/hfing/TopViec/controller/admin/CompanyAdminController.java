package com.hfing.TopViec.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.EmployeeSizeService;
import com.hfing.TopViec.service.InfoCompanyService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CompanyAdminController {
    private final CommonCityService cityService;
    private final EmployeeSizeService employeeSizeService;
    private final CommonDistrictService districtService;
    private final InfoCompanyService companyService;
    private final CommonLocationService locationService;

    public CompanyAdminController(CommonCityService cityService, EmployeeSizeService employeeSizeService,
            CommonDistrictService districtService, InfoCompanyService companyService,
            CommonLocationService locationService) {
        this.cityService = cityService;
        this.employeeSizeService = employeeSizeService;
        this.districtService = districtService;
        this.companyService = companyService;
        this.locationService = locationService;
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
            @RequestParam("city") Long cityId,
            @RequestParam("district") Long districtId,
            RedirectAttributes redirectAttributes) {

        newCompany.setCompanyImageUrl("");
        newCompany.setCompanyCoverImageUrl("");

        // Gán location cho công ty
        CommonLocation location = locationService.findByCityIdAndDistrictId(cityId, districtId);
        newCompany.setLocation(location);

        newCompany.setCreateAt(new Date(System.currentTimeMillis()));
        // Lưu công ty mới (giả định có phương thức service để lưu)
        companyService.saveInfoCompany(newCompany);

        // Thêm thông báo thành công và chuyển hướng
        redirectAttributes.addFlashAttribute("message", "Company created successfully!");
        return "redirect:/admin/company/show";
    }
}
