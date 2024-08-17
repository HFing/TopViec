package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hfing.TopViec.domain.CommonDistrict;

public interface CommonDistrictRepository extends JpaRepository<CommonDistrict, Long> {
    CommonDistrict findByNameAndCityId(String name, Long cityId);
}
