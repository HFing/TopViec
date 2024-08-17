package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hfing.TopViec.domain.CommonLocation;

public interface CommonLocationRepository extends JpaRepository<CommonLocation, Long> {
    CommonLocation findByDistrictId(Long districtId);

    CommonLocation findByCityIdAndDistrictId(Long cityId, Long districtId);
}