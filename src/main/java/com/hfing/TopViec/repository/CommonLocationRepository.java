package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.CommonLocation;

@Repository
public interface CommonLocationRepository extends JpaRepository<CommonLocation, Long> {
    CommonLocation findByDistrictId(Long districtId);

    CommonLocation findByCityIdAndDistrictId(Long cityId, Long districtId);
}