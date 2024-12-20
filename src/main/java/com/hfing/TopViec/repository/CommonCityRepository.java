package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.CommonCity;

@Repository
public interface CommonCityRepository extends JpaRepository<CommonCity, Long> {
    boolean existsByName(String name);
}
