package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hfing.TopViec.domain.CommonCity;

public interface CommonCityRepository extends JpaRepository<CommonCity, Long> {
    boolean existsByName(String name);
}
