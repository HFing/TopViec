package com.hfing.TopViec.controller.admin;

import java.util.List;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.service.CommonCityService;
import com.hfing.TopViec.service.CommonDistrictService;
import com.hfing.TopViec.service.CommonLocationService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LocationController {

    private final CommonCityService cityService;
    private final CommonDistrictService districtService;
    private final CommonLocationService locationService;

    public LocationController(CommonCityService cityService, CommonDistrictService districtService,
            CommonLocationService locationService) {
        this.cityService = cityService;
        this.districtService = districtService;
        this.locationService = locationService;
    }

    @GetMapping("/admin/location/city")
    public String getLocationPage(Model model) {
        List<CommonCity> cities = cityService.findAll();
        model.addAttribute("cities", cities);
        return "admin/location/city/show";
    }

    @GetMapping("/admin/location/city/create")
    public String getCreatePage(Model model) {
        model.addAttribute("newCity", new CommonCity());
        return "admin/location/city/create";
    }

    @PostMapping("/admin/location/city/create")
    public String postCreateCity(Model model, @ModelAttribute("newCity") @Valid CommonCity newCity,
            BindingResult result) {
        if (cityService.existsByName(newCity.getName())) {
            result.rejectValue("name", "error.newCity", "City name already exists");
            model.addAttribute("newCity", newCity);
            return "admin/location/city/create";
        }
        cityService.save(newCity);
        return "redirect:/admin/location/city";
    }

    @GetMapping("/admin/location/city/update/{id}")
    public String getUpdateCityPage(@PathVariable Long id, Model model) {
        CommonCity city = cityService.findById(id);
        model.addAttribute("city", city);
        return "admin/location/city/update";
    }

    @PostMapping("/admin/location/city/update/{id}")
    public String postUpdateCity(@PathVariable Long id, @ModelAttribute("city") CommonCity city, BindingResult result,
            Model model) {
        if (result.hasErrors()) {
            model.addAttribute("city", city);
            return "admin/location/city/update";
        }

        if (cityService.existsByName(city.getName())) {
            result.rejectValue("name", "error.city", "City name already exists");
            model.addAttribute("city", city);
            return "admin/location/city/update";
        }

        cityService.save(city);
        return "redirect:/admin/location/city";
    }

    @GetMapping("/admin/location/city/delete/{id}")
    public String getDeleteCityPage(@PathVariable Long id, Model model) {
        CommonCity city = cityService.findById(id);
        model.addAttribute("city", city);
        return "admin/location/city/delete";
    }

    @PostMapping("/admin/location/city/delete/{id}")
    public String postDeleteCity(@PathVariable Long id) {
        cityService.deleteById(id);
        return "redirect:/admin/location/city";
    }

    // District
    @GetMapping("/admin/location/district")
    public String getDistrictPage(Model model) {
        List<CommonDistrict> districts = districtService.findAll();
        model.addAttribute("districts", districts);
        return "admin/location/district/show";
    }

    @GetMapping("/admin/location/district/create")
    public String getCreateDistrictPage(Model model) {
        List<CommonCity> cities = cityService.findAll();
        model.addAttribute("cities", cities);
        model.addAttribute("newDistrict", new CommonDistrict());
        return "admin/location/district/create";
    }

    @PostMapping("/admin/location/district/create")
    public String postCreateDistrict(@ModelAttribute("newDistrict") @Valid CommonDistrict district,
            BindingResult result, Model model) {
        if (result.hasErrors()) {
            List<CommonCity> cities = cityService.findAll();
            model.addAttribute("cities", cities);
            return "admin/location/district/create";
        }

        CommonDistrict existingDistrict = districtService.findByNameAndCityId(district.getName(),
                district.getCity().getId());
        if (existingDistrict != null) {
            List<CommonCity> cities = cityService.findAll();
            model.addAttribute("cities", cities);
            model.addAttribute("error", "District already exists in the selected city.");
            return "admin/location/district/create";
        }

        districtService.save(district);
        CommonLocation location = new CommonLocation();
        location.setCity(district.getCity());
        location.setDistrict(district);
        locationService.save(location);

        return "redirect:/admin/location/district";
    }

    @GetMapping("/admin/location/district/update/{id}")
    public String getUpdateDistrictPage(@PathVariable Long id, Model model) {
        CommonDistrict district = districtService.findById(id);
        if (district == null) {
            model.addAttribute("error", "District not found.");
            return "admin/location/district/show";
        }

        List<CommonCity> cities = cityService.findAll();
        model.addAttribute("cities", cities);
        model.addAttribute("district", district);
        return "admin/location/district/update";
    }

    @PostMapping("/admin/location/district/update/{id}")
    public String postUpdateDistrict(@PathVariable Long id, @ModelAttribute("district") @Valid CommonDistrict district,
            BindingResult result, Model model) {
        if (result.hasErrors()) {
            List<CommonCity> cities = cityService.findAll();
            model.addAttribute("cities", cities);
            return "admin/location/district/update";
        }

        CommonDistrict existingDistrict = districtService.findByNameAndCityId(district.getName(),
                district.getCity().getId());
        if (existingDistrict != null && !existingDistrict.getId().equals(id)) {
            List<CommonCity> cities = cityService.findAll();
            model.addAttribute("cities", cities);
            model.addAttribute("error", "District already exists in the selected city.");
            return "admin/location/district/update";
        }

        districtService.save(district);
        return "redirect:/admin/location/district";
    }

    @GetMapping("/admin/location/district/delete/{id}")
    public String getDeleteDistrictPage(@PathVariable Long id, Model model) {
        CommonDistrict district = districtService.findById(id);
        if (district == null) {
            model.addAttribute("error", "District not found.");
            return "admin/location/district/delete";
        }
        model.addAttribute("district", district);
        return "admin/location/district/delete";
    }

    @PostMapping("/admin/location/district/delete/{id}/{cityId}")
    public String deleteDistrict(@PathVariable Long id, @PathVariable Long cityId, Model model) {
        CommonDistrict district = districtService.findById(id);
        if (district == null) {
            model.addAttribute("error", "District not found.");
            return "admin/location/district/delete";
        }

        CommonLocation location = locationService.findByCityIdAndDistrictId(cityId, id);
        if (location == null) {
            model.addAttribute("error", "Location not found for the given city and district.");
            return "admin/location/district/delete";
        }

        locationService.delete(location.getId());
        districtService.deleteById(id);

        return "redirect:/admin/location/district";
    }

}
