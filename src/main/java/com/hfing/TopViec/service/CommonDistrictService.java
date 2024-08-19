package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.CommonDistrict;
import com.hfing.TopViec.repository.CommonDistrictRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class CommonDistrictService {
    private final CommonDistrictRepository districtRepository;

    public CommonDistrictService(CommonDistrictRepository districtRepository) {
        this.districtRepository = districtRepository;
    }

    public void save(CommonDistrict district) {
        districtRepository.save(district);
    }

    public List<CommonDistrict> findAll() {
        return districtRepository.findAll();
    }

    public CommonDistrict findById(Long id) {
        return districtRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("District not found"));
    }

    public void deleteById(Long id) {
        if (!districtRepository.existsById(id)) {
            throw new EntityNotFoundException("District not found");
        }
        districtRepository.deleteById(id);
    }

    public CommonDistrict findByNameAndCityId(String name, Long cityId) {
        return districtRepository.findByNameAndCityId(name, cityId);
    }

    public List<CommonDistrict> findByCityId(Long cityId) {
        return districtRepository.findByCityId(cityId);
    }
}
