package com.hfing.TopViec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hfing.TopViec.domain.CommonCity;
import com.hfing.TopViec.repository.CommonCityRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class CommonCityService {
    private final CommonCityRepository cityRepository;

    public CommonCityService(CommonCityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    public void save(CommonCity city) {
        cityRepository.save(city);
    }

    public List<CommonCity> findAll() {
        return cityRepository.findAll();
    }

    public boolean existsByName(String name) {
        return cityRepository.existsByName(name);
    }

    public CommonCity findById(Long id) {
        return cityRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("City not found"));
    }

    public void deleteById(Long id) {
        cityRepository.deleteById(id);
    }
}
