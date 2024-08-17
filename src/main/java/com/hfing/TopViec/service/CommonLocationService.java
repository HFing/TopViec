package com.hfing.TopViec.service;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.CommonLocation;
import com.hfing.TopViec.repository.CommonLocationRepository;

@Service
public class CommonLocationService {
    private final CommonLocationRepository locationRepository;

    public CommonLocationService(CommonLocationRepository locationRepository) {
        this.locationRepository = locationRepository;
    }

    public void save(CommonLocation location) {
        locationRepository.save(location);
    }

    public CommonLocation findByDistrictId(Long districtId) {
        return locationRepository.findByDistrictId(districtId);
    }

    public void delete(Long id) {
        locationRepository.deleteById(id);
    }

    public CommonLocation findByCityIdAndDistrictId(Long cityId, Long districtId) {
        return locationRepository.findByCityIdAndDistrictId(cityId, districtId);
    }
}
