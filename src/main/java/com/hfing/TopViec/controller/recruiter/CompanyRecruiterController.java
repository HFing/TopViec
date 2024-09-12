package com.hfing.TopViec.controller.recruiter;

import java.sql.Date;

import java.time.LocalDateTime;

import java.nio.file.Files;

import java.nio.file.Paths;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.domain.EmployeeSize;
import com.hfing.TopViec.domain.InfoCompany;
import com.hfing.TopViec.domain.InfoCompanyImage;
import com.hfing.TopViec.domain.User;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;
import com.hfing.TopViec.service.EmployeeSizeService;
import com.hfing.TopViec.service.InfoCompanyImageService;
import com.hfing.TopViec.service.InfoCompanyService;
import com.hfing.TopViec.service.UploadService;
import com.hfing.TopViec.service.UserService;

@Controller
public class CompanyRecruiterController {

    private final UserService userService;
    private final InfoCompanyService infoCompanyService;
    private final CommonCityService cityService;
    private final CommonDistrictService districtService;
    private final EmployeeSizeService employeeSizeService;
    private final UploadService uploadService;
    private final CommonLocationService commonLocationService;
    private final InfoCompanyImageService infoCompanyImageService;

    public CompanyRecruiterController(UserService userService, InfoCompanyService infoCompanyService,
            CommonCityService cityService, CommonDistrictService districtService,
            EmployeeSizeService employeeSizeService,
            UploadService uploadService, CommonLocationService commonLocationService,
            InfoCompanyImageService infoCompanyImageService) {
        this.userService = userService;
        this.infoCompanyService = infoCompanyService;
        this.cityService = cityService;
        this.districtService = districtService;
        this.employeeSizeService = employeeSizeService;
        this.uploadService = uploadService;
        this.commonLocationService = commonLocationService;
        this.infoCompanyImageService = infoCompanyImageService;
    }

    @GetMapping("/recruiter/company")
    public String getInfoCompanyPage(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        InfoCompany existingCompany = infoCompanyService.findByUser(user);
        model.addAttribute("existingCompany", existingCompany);
        model.addAttribute("cities", cityService.findAll());
        model.addAttribute("districts", districtService.findAll());
        model.addAttribute("employeeSizes", employeeSizeService.findAll());
        return "recruiter/company/show";
    }

    @PostMapping("/recruiter/company/update")
    public String updateCompany(Model model,
            @ModelAttribute("existingCompany") InfoCompany company,
            @RequestParam("companyCover") MultipartFile companyCover,
            @RequestParam("companyImage") MultipartFile companyImage,
            @RequestParam("city") Long cityId,
            @RequestParam("district") Long districtId,
            @RequestParam("employeeSize.id") Long employeeSizeId) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);

        InfoCompany existingCompany = infoCompanyService.getCompanyById(company.getId());
        if (companyCover != null && !companyCover.isEmpty()) {
            String imgCover = this.uploadService.handleSaveUploadFile(companyCover, "companycover");
            existingCompany.setCompanyCoverImageUrl(imgCover);
        }

        if (companyImage != null && !companyImage.isEmpty()) {
            String img = this.uploadService.handleSaveUploadFile(companyImage, "company");
            existingCompany.setCompanyImageUrl(img);
        }
        CommonLocation location = commonLocationService.findByCityIdAndDistrictId(cityId, districtId);
        CommonCity city = cityService.findById(cityId);
        CommonDistrict district = districtService.findById(districtId);
        location.setCity(city);
        location.setDistrict(district);
        existingCompany.setLocation(location);

        EmployeeSize employeeSize = employeeSizeService.findById(employeeSizeId);
        existingCompany.setEmployeeSize(employeeSize);

        existingCompany.setCompanyName(company.getCompanyName());
        existingCompany.setFacebookUrl(company.getFacebookUrl());
        existingCompany.setYoutubeUrl(company.getYoutubeUrl());
        existingCompany.setLinkedinUrl(company.getLinkedinUrl());
        existingCompany.setCompanyEmail(company.getCompanyEmail());
        existingCompany.setCompanyPhone(company.getCompanyPhone());
        existingCompany.setWebsiteUrl(company.getWebsiteUrl());
        existingCompany.setTaxCode(company.getTaxCode());
        existingCompany.setSince(company.getSince());
        existingCompany.setFieldOperation(company.getFieldOperation());
        existingCompany.setDescription(company.getDescription());
        existingCompany.setUpdateAt(new Date(System.currentTimeMillis()));
        existingCompany.setUser(user);

        infoCompanyService.saveInfoCompany(existingCompany);
        return "redirect:/recruiter/company";
    }

    @GetMapping("/recruiter/company/image")
    public String getImageCompany(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        InfoCompany existingCompany = infoCompanyService.findByUser(user);
        model.addAttribute("existingCompany", existingCompany);
        return "recruiter/company/image";
    }

    @PostMapping("/recruiter/company/image")
    public String updateImageCompany(Model model,
            @RequestParam("companyImage") MultipartFile companyImage) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = null;

        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userEmail = userDetails.getUsername();
        }

        User user = userService.getUserByEmail(userEmail);
        InfoCompany existingCompany = infoCompanyService.findByUser(user);
        if (companyImage != null && !companyImage.isEmpty()) {
            String img = this.uploadService.handleSaveUploadFile(companyImage, "companyimg");
            InfoCompanyImage companyImageEntity = new InfoCompanyImage();
            companyImageEntity.setCreateAt(LocalDateTime.now());
            companyImageEntity.setImageUrl(img);
            companyImageEntity.setCompany(existingCompany);
            infoCompanyImageService.save(companyImageEntity);
        }
        return "redirect:/recruiter/company/image";
    }

    @PostMapping("/recruiter/company/image/delete")
    public String deleteImageCompany(@RequestParam("imageId") Long imageId) {
        InfoCompanyImage companyImage = infoCompanyImageService.findById(imageId);
        if (companyImage != null) {
            // Xóa ảnh khỏi hệ thống lưu trữ
            try {
                Files.deleteIfExists(Paths.get(companyImage.getImageUrl()));
            } catch (Exception e) {
                e.printStackTrace();
                // Xử lý ngoại lệ nếu cần
            }

            // Xóa bản ghi ảnh khỏi cơ sở dữ liệu
            infoCompanyImageService.delete(companyImage);
        }

        return "redirect:/recruiter/company/image";
    }
}
