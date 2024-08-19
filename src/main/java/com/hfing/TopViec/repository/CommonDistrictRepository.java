package com.hfing.TopViec.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.CommonDistrict;

@Repository
public interface CommonDistrictRepository extends JpaRepository<CommonDistrict, Long> {
    CommonDistrict findByNameAndCityId(String name, Long cityId);

    List<CommonDistrict> findByCityId(Long cityId);

}
